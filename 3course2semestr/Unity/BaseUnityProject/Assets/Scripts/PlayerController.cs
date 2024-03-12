using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class PlayerController : MonoBehaviour {
    public float walkSpeed = 8f;
    public float jumpSpeed = 7f;
    public float rotationSpeed = 100f;

    Rigidbody rb;

    Collider coll;

    Camera currentCamera;

    bool pressedJump = false;

    void Start () {
        rb = GetComponent<Rigidbody>();
        coll = GetComponent<Collider>();
        currentCamera = GetComponentInChildren<Camera>();
    }
  
    void Update () {
        WalkHandler();
        JumpHandler();
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
            }            
        }
        else
        {
            pressedJump = false;
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
}