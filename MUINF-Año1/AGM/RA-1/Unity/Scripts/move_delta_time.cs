using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class move_delta_time : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Translate(new Vector3(Input.GetAxis("Horizontal")*2*Time.deltaTime, 0.0f, 0.0f));
     }
}
