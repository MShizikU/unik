using System;
using UnityEngine.SceneManagement;
using UnityEngine;
public class UIPause : MonoBehaviour
{
    [SerializeField] private GameObject _pausePanel;
    public event Action<bool> Paused;

    void Start () {
        _pausePanel.SetActive(!_pausePanel.activeSelf);
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            _pausePanel.SetActive(!_pausePanel.activeSelf);
            Cursor.visible = !Cursor.visible;
            if (Cursor.visible){
                Cursor.lockState = CursorLockMode.None;
            }else{
                Cursor.lockState = CursorLockMode.Locked;
            }
            Paused?.Invoke(_pausePanel.activeSelf);
        }
    }

    public void RestartGame()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    public void ExitToMenu(string menuSceneName)
    {
        SceneManager.LoadScene(menuSceneName);
    }

    public void ResumeGame()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Paused?.Invoke(false);
        Cursor.visible = false;
        _pausePanel.SetActive(false);
        Time.timeScale = 1f;
    }

    private void PauseGame()
    {
        Time.timeScale = 0f;
    }

}
