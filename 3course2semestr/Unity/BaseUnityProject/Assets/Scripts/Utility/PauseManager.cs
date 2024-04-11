using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseManager : MonoBehaviour
{
    public bool IsPaused { get; set; }

    public void ResumeGame(){
        this.IsPaused = false;
    }

    public void PauseGame(){
        this.IsPaused = true;
    }
}
