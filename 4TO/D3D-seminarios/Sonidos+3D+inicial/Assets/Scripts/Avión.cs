using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Avión : MonoBehaviour
{
    float velocidadAngular = 60.0f, //en grados por segundo
    angulo = 0.0f,
    altura = 5.0f;
    // Start is called before the first frame update
    void Start() { }
    // Update is called once per frame
    void Update()
    {
        angulo = velocidadAngular * Time.deltaTime;
        //Kinematic object
        transform.RotateAround(Vector3.zero, Vector3.up, angulo);
    }
}
