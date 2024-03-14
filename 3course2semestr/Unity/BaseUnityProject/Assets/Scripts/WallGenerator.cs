using UnityEngine;

public class WallGenerator : MonoBehaviour
{
    
    [SerializeField] private GameObject earthPlane;
    [SerializeField] private GameObject wallPrefab;
    [SerializeField] private float wallHeight = 5f;
    [SerializeField] private float wallThickness = 0.1f;

    void Start()
    {
        GenerateWalls();
    }

    void GenerateWalls()
    {
        if (earthPlane == null || wallPrefab == null)
        {
            Debug.LogError("Earth plane or wall prefab is not assigned!");
            return;
        }

        Bounds earthBounds = earthPlane.GetComponent<Renderer>().bounds;

        float wallWidth = earthBounds.size.x + 2 * wallThickness;
        float wallLength = earthBounds.size.z + 2 * wallThickness;

        SpawnWall(new Vector3(earthBounds.center.x, wallHeight / 2, earthBounds.min.z - wallThickness / 2), new Vector3(0, 0, 0), wallWidth, wallHeight);
        SpawnWall(new Vector3(earthBounds.center.x, wallHeight / 2, earthBounds.max.z + wallThickness / 2), new Vector3(0, 0, 0), wallWidth, wallHeight);
        SpawnWall(new Vector3(earthBounds.min.x - wallThickness / 2, wallHeight / 2, earthBounds.center.z), new Vector3(0, 90, 0), wallLength, wallHeight);
        SpawnWall(new Vector3(earthBounds.max.x + wallThickness / 2, wallHeight / 2, earthBounds.center.z), new Vector3(0, 90, 0), wallLength, wallHeight);
    }

    void SpawnWall(Vector3 position, Vector3 rotation, float width, float height)
    {
        GameObject wall = Instantiate(wallPrefab, position, Quaternion.Euler(rotation), transform);
        wall.transform.localScale = new Vector3(width, height, wallThickness);
    }
}