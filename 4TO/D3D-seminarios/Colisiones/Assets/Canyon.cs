using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Canyon : MonoBehaviour
{

    //Contiene la bala a disparar
    [SerializeField] GameObject bala;
    [SerializeField] float potDisp;
    Vector3 dirDisparoTanque;
    void Start() { }
    // Update is called once per frame
    void Update()
    {
        //Shoot the cannon
        if (Input.GetKeyDown(KeyCode.Space))
            disparaBala();
    }
    void disparaBala()
    {
        Vector3 posicion = transform.position,
        DirDisparo;
        Quaternion rotacion = transform.rotation;
        GameObject nuevaBala;
        nuevaBala = Instantiate(bala, posicion, rotacion);
        DirDisparo = transform.TransformVector(nuevaBala.transform.rotation.eulerAngles);
        DirDisparo = Vector3.Normalize(DirDisparo);
        nuevaBala.GetComponent<Rigidbody>().AddForce(DirDisparo * potDisp, ForceMode.Impulse);
    }
}
