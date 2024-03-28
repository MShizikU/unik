using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class PlayerController : MonoBehaviour {

    private Animator _characterAnimator;

    public int sitTriggered = 0;
    public GameObject spherePrefab; 
    public int numberOfSpheres = 4;
    public float sphereSizeMin = 0.1f;
    public float sphereSizeMax = 0.3f;
    public float deletionTime = 3f;

    public float walkSpeed = 8f;
    public float jumpSpeed = 7f;
    public float rotationSpeed = 100f;

    private Collider playerCollider;
    private Transform playerTransform;

    Rigidbody rb;

    Collider coll;

    Camera currentCamera;

    bool pressedJump = false;

    void Start () {
        rb = GetComponent<Rigidbody>();
        coll = GetComponent<Collider>();
        _characterAnimator = GetComponent<Animator>();
        currentCamera = GetComponentInChildren<Camera>();
        playerTransform = transform;
    }
  
    void Update () {
        WalkHandler();
        JumpHandler();
        Sithandler();
    }


    void WalkHandler()
    {
        float distance = walkSpeed * Time.deltaTime;
        
        float hAxis = Input.GetAxis("Horizontal");
        float vAxis = Input.GetAxis("Vertical");

        Vector3 cameraForward = currentCamera.transform.forward;
        Vector3 cameraRight = currentCamera.transform.right;

        cameraForward.y = 0f;
        cameraRight.y = 0f;

        cameraForward.Normalize();
        cameraRight.Normalize();

        Vector3 movement = (cameraForward * vAxis + cameraRight * hAxis) * distance;

        Vector3 currPosition = transform.position;
        Vector3 newPosition = currPosition + movement;
        /*if (hAxis != 0F || vAxis != 0F){
            _characterAnimator.SetTrigger("PlayerRunStart");
        }
        else{
            _characterAnimator.SetTrigger("PlayerRunStop");
        }*/

        rb.MovePosition(newPosition);
    }

    void JumpHandler()
    {
        float jAxis = Input.GetAxis("Jump");
        bool isGrounded = CheckGrounded();
        if (jAxis > 0f)
        {
            if(!pressedJump && isGrounded)
            {
                pressedJump = true;
                Vector3 jumpVector = new Vector3(0f, jumpSpeed, 0f);
                rb.velocity = rb.velocity + jumpVector;
                GenerateSpheres();
                //_characterAnimator.SetTrigger("PlayerJump");
            }            
        }
        else
        {
            pressedJump = false;
        }
    }

    void Sithandler(){
        Debug.Log(sitTriggered);
        if (Input.GetKey(KeyCode.LeftControl) || Input.GetKey(KeyCode.RightControl))
        {
            if (sitTriggered == 0){
                Vector3 currentPosition = playerTransform.position;

                playerTransform.localScale = new Vector3(playerTransform.localScale.x, 0.5f, playerTransform.localScale.z);

                playerTransform.position = currentPosition;
                //_characterAnimator.SetTrigger("PlayerSmoozeStart");
                sitTriggered = 1;
                if (playerCollider != null)
                {
                    playerCollider.transform.localScale = new Vector3(1f, 0.5f, 1f);
                }
            }
        }
        else
        {
            if (sitTriggered == 1){
                playerTransform.localScale = new Vector3(playerTransform.localScale.x, 1f, playerTransform.localScale.z);

                if (playerCollider != null)
                {
                    playerCollider.transform.localScale = Vector3.one;
                }

                //_characterAnimator.SetTrigger("PlayerSmoozeStop");
                sitTriggered = 0;
                if (playerCollider != null)
                {
                    playerCollider.transform.localScale = new Vector3(1f, 0.5f, 1f);
                }
            }
        }
    }

    bool CheckGrounded()
    {
        float sizeX = coll.bounds.size.x;
        float sizeZ = coll.bounds.size.z;
        float sizeY = coll.bounds.size.y;

        Vector3 corner1 = transform.position + new Vector3(sizeX/2, -sizeY / 2 + 0.01f, sizeZ / 2);
        Vector3 corner2 = transform.position + new Vector3(-sizeX / 2, -sizeY / 2 + 0.01f, sizeZ / 2);
        Vector3 corner3 = transform.position + new Vector3(sizeX / 2, -sizeY / 2 + 0.01f, -sizeZ / 2);
        Vector3 corner4 = transform.position + new Vector3(-sizeX / 2, -sizeY / 2 + 0.01f, -sizeZ / 2);

        bool grounded1 = Physics.Raycast(corner1, new Vector3(0, -1, 0), 0.5f);
        bool grounded2 = Physics.Raycast(corner2, new Vector3(0, -1, 0), 0.5f);
        bool grounded3 = Physics.Raycast(corner3, new Vector3(0, -1, 0), 0.5f);
        bool grounded4 = Physics.Raycast(corner4, new Vector3(0, -1, 0), 0.5f);

        return (grounded1 || grounded2 || grounded3 || grounded4);
    }

    public void GenerateSpheres()
    {
        Vector3 playerPosition = playerTransform.position;

        for (int i = 0; i < numberOfSpheres; i++)
        {
            Vector3 position = playerPosition + Random.insideUnitSphere * 5f;
            float size = Random.Range(sphereSizeMin, sphereSizeMax);
            GameObject sphere = Instantiate(spherePrefab, position, Quaternion.identity);
            sphere.transform.localScale = new Vector3(size, size, size);
            StartCoroutine(DeleteAfterTime(sphere, deletionTime));
        }
    }

    IEnumerator DeleteAfterTime(GameObject obj, float time)
    {
        yield return new WaitForSeconds(time);
        Destroy(obj);
    }
}