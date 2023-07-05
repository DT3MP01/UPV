using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonManager : MonoBehaviour
{
    public GameObject hero, crab;

    // Start is called before the first frame update
    void Start()
    {
        hero = (GameObject)Instantiate(hero, transform.position, Quaternion.identity);
        hero.AddComponent<MeshRenderer>();
        // ajustar al tamaño del target. Puede ser pequeño o grande
        hero.transform.localScale = new Vector3(1.0f, 1.0f, 1.0f);
        hero.transform.Rotate(new Vector3(0, 180, 0));
        hero.transform.parent = gameObject.transform;
        hero.SetActive(false);

        crab = (GameObject)Instantiate(crab, transform.position, Quaternion.identity);
        crab.AddComponent<MeshRenderer>();
        // ajustar al tamaño del target. Puede ser pequeño o grande 
        crab.transform.localScale = new Vector3(0.1f, 0.1f, 0.1f);
        crab.transform.Rotate(new Vector3(0, 180, 0));
        crab.transform.parent = gameObject.transform;
        crab.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnActivarHero()
    {
        crab.SetActive(false);
        hero.SetActive(true);
    }

    public void OnActivarCrab()
    {
        hero.SetActive(false);
        crab.SetActive(true);
    }


}
