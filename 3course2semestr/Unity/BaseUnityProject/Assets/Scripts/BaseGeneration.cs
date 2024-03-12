using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseGeneration : MonoBehaviour
{

    private readonly struct Circle
    {
        public readonly float Radius;
        public readonly Vector3 Point;

        public Circle(float radius, Vector3 point)
        {
            Radius = radius;
            Point = point;
        }
    }

    [SerializeField] private float _radius;
    [SerializeField] private int _cylinderAmount;
    [SerializeField] private GameObject _cylinderPrefab;
    [SerializeField] private GameObject Player;
    [SerializeField] private float _spawnInterval;
    private readonly List<Circle> _existingCircles = new List<Circle>();
    private readonly List<Circle> _circles = new List<Circle>();
    private readonly Vector3[] _directions = new Vector3[6];
    private Vector3 _lastSpawnPosition;
    private Transform _playerTransform;

    private void Start()
    {
        _cylinderAmount += 1;
        _playerTransform = Player.transform;
        Quaternion rotation = Quaternion.AngleAxis(60f, Vector3.up);
        Vector3 direction = Vector3.forward;
        for (int i = 0; i < 6; i++)
        {
            _directions[i] = direction;
            direction = rotation * direction;
        }
        
    }

    private void Update()
    {
        if (Vector3.Distance(_playerTransform.position, _lastSpawnPosition) >= _spawnInterval)
        {
            _circles.Clear();
            Circle root = new Circle(_radius, _playerTransform.position);
            _circles.Add(root);
            GenerateCircle(root);
            _lastSpawnPosition = _playerTransform.position;
            SpawnPrefabAt(_circles);
        }
    }

    private void GenerateCircle(Circle root)
    {
        List<Vector3> directions = new List<Vector3>();

        for (int i = 0; i < _directions.Length; i++)
        {
            directions.Add(_directions[i]);
        }

        for (int i = 0; i < _directions.Length; i++)
        {
            Vector3 randomDirection = directions[Random.Range(0, directions.Count)];
            Vector3 nextPoint = root.Point + randomDirection * _radius * 2f;
            directions.Remove(randomDirection);
            if (TryCreateCircleAt(nextPoint))
            {
                Circle circle = new Circle(_radius, nextPoint);
                _circles.Add(circle);
                _existingCircles.Add(circle);
                GenerateCircle(circle);
            }
        }
    }

    private bool TryCreateCircleAt(Vector3 point)
    {
        if (_circles.Count >= _cylinderAmount) return false;

        foreach (var existingCircle in _existingCircles)
        {
            float sqrDistance = (point - existingCircle.Point).sqrMagnitude;
            if (sqrDistance < existingCircle.Radius * existingCircle.Radius) return false;
        }
        return true;
    }

    private void SpawnPrefabAt(List<Circle> circles)
    {
        for (int i = 1; i < circles.Count; i++)
        {
            Instantiate(_cylinderPrefab, circles[i].Point, Quaternion.identity);
        }
    }

}
