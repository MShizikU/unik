using UnityEngine;
public class PlayerEffect : MonoBehaviour
{
    [SerializeField] private ParticleSystem _dustParticleSystem;
    private PlayerController _playerController;
    private void Awake()
    {
        _playerController = GetComponent<PlayerController>();
    }

    private void OnEnable()
    {
        _playerController.Moving += OnPlayerMoving;
    }

    private void OnPlayerMoving(bool moving)
    {
        if (moving){
            _dustParticleSystem.Play();
        }else{
            _dustParticleSystem.Stop();
        }
    }
}