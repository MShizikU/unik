using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Game : MonoBehaviour
{
    public static Game Instance { get; private set; }
    public PauseManager PauseManager { get; private set; }
    private UIPause _UIPause;

    private void Awake()
    {
        Instance = this;
        PauseManager = new PauseManager();
        _UIPause = FindObjectOfType<UIPause>();
    }

    private void OnEnable()
    {
        _UIPause.Paused += OnPauseStateChanged;
    }

    private void OnDisable()
    {
        _UIPause.Paused -= OnPauseStateChanged;
    }

    private void OnPauseStateChanged(bool isPaused)
    {
        if (isPaused)
        {
            PauseManager.PauseGame();
        }
        else
        {
            PauseManager.ResumeGame();
        }
    }
}
