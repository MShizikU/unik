using UnityEngine;


public class PlayerAudio : MonoBehaviour
{
    [SerializeField] private AudioClip[] _footstepClips;
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
            AudioClip randomClip = _footstepClips[Random.Range(0, _footstepClips.Length)];
            _playerAudioSource.clip = randomClip;
            _playerAudioSource.Play();
        }else if (!moving){
            AudioClip randomClip = _footstepClips[Random.Range(0, _footstepClips.Length)];
            _playerAudioSource.clip = randomClip;
            _playerAudioSource.Stop();
        }
    }
}
