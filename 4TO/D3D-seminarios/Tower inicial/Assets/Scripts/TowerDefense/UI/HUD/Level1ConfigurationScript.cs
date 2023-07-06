using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Level1ConfigurationScript : MonoBehaviour
{
    public GameObject helicoptero;
    public GameObject start;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
        if (Input.GetKeyDown(KeyCode.H))
        {
            Instantiate(helicoptero, start.transform.position, Quaternion.identity);
        }
    }
}
