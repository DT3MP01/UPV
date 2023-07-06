using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManejadorCanyon : MonoBehaviour
{
    GameObject manejadorCanon;
    [SerializeField] string canyon;
    void Start() { manejadorCanon = GameObject.Find(canyon); }
    void Update()
    {
        if (Input.GetKey(KeyCode.U)) //rotate cannon up
            manejadorCanon.transform.Rotate(Vector3.back, Space.Self);
        if (Input.GetKey(KeyCode.J)) //rotate cannon down
            manejadorCanon.transform.Rotate(Vector3.forward, Space.Self);
    }
}
