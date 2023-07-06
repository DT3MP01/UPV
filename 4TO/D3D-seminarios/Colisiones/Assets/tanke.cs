using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class tanke : MonoBehaviour
{
    [SerializeField]float walkSpeed;
    [SerializeField] float rotationSpeed;
    GameObject manejadorCanon;
    Rigidbody rigidBody;
    [SerializeField]string canyon;
    // Start is called before the first frame update
    void Start()
    {
        //define the animator attached to the player
        rigidBody = GetComponent<Rigidbody>();
        manejadorCanon = GameObject.Find(canyon);
    }
    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("Ha habido una colisión con el objeto " + collision.gameObject.name);
    }
    void Update()
    {
        Vector3 position = Input.GetAxis("Vertical") * Vector3.left * walkSpeed * Time.deltaTime;
        //Poner el código siguiente sólo en caso de uso de la función terremoto
        //position.y = suelo.transform.position.y - transform.position.y;
        //Forward and backward
        transform.Translate(position);
        //Turn right/left
        transform.Rotate(Input.GetAxis("Horizontal") * Vector3.up * rotationSpeed*Time.deltaTime, Space.Self);
    }

}
