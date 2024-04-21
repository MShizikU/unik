using UnityEngine;


public class PlayerAudio : MonoBehaviour
{
    private AudioSource _playerAudioSource;
    private PlayerController _playerMovement;

    private void Awake()
    {
        _playerAudioSource = GetComponent<AudioSource>();
        _playerMovement = GetComponent<PlayerController>();
    }
    private void OnEnable()
    {
        _playerMovement.Moving += OnPlayerMoving;
    }
    private void OnPlayerMoving(bool moving)
    {
        if (moving){
            if (_playerAudioSource.isPlaying) return;
            _playerAudioSource.Play();
        }
        else if (!moving){
            if (!_playerAudioSource.isPlaying) return;
            _playerAudioSource.Stop();
        }
    }
}
