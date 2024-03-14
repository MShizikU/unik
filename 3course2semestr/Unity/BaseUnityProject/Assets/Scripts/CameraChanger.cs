using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraChanger : MonoBehaviour
{
    public Camera firstCamera;
    public Camera secondCamera;

    void Start()
    {   
        firstCamera.enabled = true;
        secondCamera.enabled = false;
    }

    void Update()
    {
        if (Input.GetKeyDown("h"))
        {
            ToggleCameras();
        }

        SyncHorizontalRotation();
    }

    void ToggleCameras()
    {
        firstCamera.enabled = !firstCamera.enabled;
        secondCamera.enabled = !secondCamera.enabled;
    }

    void SyncHorizontalRotation()
    {
        if (firstCamera.enabled && secondCamera.enabled)
        {
            secondCamera.transform.rotation = Quaternion.Euler(
                secondCamera.transform.rotation.eulerAngles.x,
                firstCamera.transform.rotation.eulerAngles.y,
                secondCamera.transform.rotation.eulerAngles.z
            );
        }
        else if (secondCamera.enabled && firstCamera.enabled)
        {
            firstCamera.transform.rotation = Quaternion.Euler(
                firstCamera.transform.rotation.eulerAngles.x,
                secondCamera.transform.rotation.eulerAngles.y,
                firstCamera.transform.rotation.eulerAngles.z 
            );
        }
    }
}