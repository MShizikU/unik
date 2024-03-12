using UnityEngine;

public class FPCameraController : MonoBehaviour
{
    [SerializeField] private float _sensivity;
    [SerializeField] private Transform _player;
    [SerializeField] private float _verticalLover;
    [SerializeField] private float _verticalUpper;
    private float _currentVerticalAngle;

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    void Update()
    {
        var vertical = -Input.GetAxis("Mouse Y") * _sensivity * Time.deltaTime;
        var horizontal = Input.GetAxis("Mouse X") * _sensivity * Time.deltaTime;

        _currentVerticalAngle = Mathf.Clamp(_currentVerticalAngle + vertical, _verticalUpper, _verticalLover);
        transform.localRotation = Quaternion.Euler(_currentVerticalAngle, 0, 0);

        _player.Rotate(0, horizontal, 0);
    }
}