using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine;
using UnityEngine.SceneManagement;


public class UIMainMenu : MonoBehaviour
{
    public void StartGame(string gameSceneName)
    {
        SceneManager.LoadScene(gameSceneName);
    }

    public void ExitGame()
    {
        Application.Quit();
        Debug.Log("Exit");
    }
}

