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
    }

    void ToggleCameras()
    {
        firstCamera.enabled = !firstCamera.enabled;
        secondCamera.enabled = !secondCamera.enabled;
    }
}