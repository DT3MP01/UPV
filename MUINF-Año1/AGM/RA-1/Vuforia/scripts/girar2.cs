using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class girar2 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Transform parentTransform = transform.parent;
        transform.RotateAround(parentTransform.position, parentTransform.up, -60 * Time.deltaTime);

    }
}
