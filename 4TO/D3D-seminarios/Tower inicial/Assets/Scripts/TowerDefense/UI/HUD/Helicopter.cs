using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Helicopter : MonoBehaviour
{
    [SerializeField] float flySpeed;
    [SerializeField] float rotationSpeed;
    private Rigidbody h_rigidbody;
    private Vector3 angulo;
    // Start is called before the first frame update
    void Start()
    {
    }
    void Awake()
    {
        h_rigidbody = GetComponent<Rigidbody>();
    }
    void OnEnable()
    {
        h_rigidbody.isKinematic= false;
    }
    // Update is called once per frame
    void Update()
    {
        Vector3 position;
        if (Input.GetKey(KeyCode.F)){
            position = Vector3.forward * flySpeed * Time.deltaTime;
            transform.Translate(position);
        }
        else if (Input.GetKey(KeyCode.V))
        {
            position = Vector3.back * flySpeed * Time.deltaTime;
            transform.Translate(position);
        }
        if (Input.GetKey(KeyCode.C))
        {
            transform.Rotate(-transform.up * rotationSpeed * Time.deltaTime, Space.Self);
        }
        else if (Input.GetKey(KeyCode.B))
        {
            transform.Rotate(transform.up * rotationSpeed * Time.deltaTime, Space.Self);
        }
        
    }
    void FixedUpdate()
    {
    }
}

