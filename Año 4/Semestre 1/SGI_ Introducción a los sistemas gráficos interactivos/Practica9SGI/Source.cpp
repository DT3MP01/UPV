/***************************************************
ISGI::Isotropia de la vista
Roberto Vivo', 2013 (v1.0)
Dibujo de una esfera donde la vista se ajusta al marco
Dependencias:
+GLUT
***************************************************/
#include <iostream>
#include "gl/freeglut.h"
#include <sstream>
#include <utilidades.h>
#include <vector>
#include <math.h>  

#define TASA_FPS 60
#define PROYECTO "circuito"

static enum class modoQ { ALAMBRICO, SOLIDO, DOBLE };
modoQ modo = modoQ::SOLIDO;
static enum class camQ { CAR_CAM, CIRCUIT_CAM };
camQ cam = camQ::CAR_CAM;
static enum class FogMode { ON, OFF };
FogMode fogMode = FogMode::OFF;
static enum class NightMode { ON, OFF };
NightMode nightMode = NightMode::OFF;


// PROPIEDADES CONDUCCION
bool isKeyDown = false;
float VEL_MAX = 12.0 / TASA_FPS;
float acc = 0.01;
float vel = 0;
float cX = 0;
float cY = 0;
float rotVel = 1.5;
float rot = 0;
bool isUIshown = false;
bool rPressable = true;


GLfloat base[4][3] = { {-10, 0, 0}, {10, 1, 0}, {10, 1, -10}, {-10, 0, -10} };
vector<float> puntosCircuito;
vector<float> puntosFarolas;
GLint coche, farola, fondo;
GLint circuito;
GLuint texroad, texmetal, texfloor, MALDITO, background, ui;

// Random float between a and b
float RandomFloat(float a, float b) {
	float random = ((float)rand()) / (float)RAND_MAX;
	float diff = b - a;
	float r = random * diff;
	return a + r;
}

// Create a vector containing the random points for the circuit
void createCircuitPoints() {
	int steps = 12;
	float nMax = 8;
	float rMax = 7;
	float phase = PI/2;
	srand(time(0));
	for (float i = 0; i < 2 * PI; i += 2.0 * PI/steps)
	{
		float xoff = (cos(i + phase)) + nMax / 2 * nMax;
		float yoff = (sin(i + phase)) + nMax / 2 * nMax;
		float rx = xoff + RandomFloat(rMax, -rMax);
		float ry = xoff + RandomFloat(rMax, -rMax);
		rx = rx * cos(i + phase);
		ry = ry * sin(i + phase);
		puntosCircuito.push_back(rx); puntosCircuito.push_back(ry);
	}
	puntosCircuito.push_back(puntosCircuito[0]); puntosCircuito.push_back(puntosCircuito[1]); // RECORDAR VOLVER A METER LOS DOS PRIMEROS PUNTOS AL FINAL DEL CIRCUITO
	cX = puntosCircuito[0];
	cY = puntosCircuito[1];
}

// calculates the distance from two points in 2D
float distAB(float x[], float y[]) {
	float vec[2] = { x[0] + y[0], x[1] + y[1] };
	return sqrt(pow(vec[0], 2.0) + pow(vec[1], 2.0));
}

// Calculates the modulus of a vector in 2D
float modVec(float x[]) {
	return sqrt(pow(x[0], 2.0) + pow(x[1], 2.0));
}

// Calculates the angle between two vectors
float angleAB(float a[2], float b[2]) {
	float dot = a[0] * b[0] + a[1] * b[1];
	float det = a[0] * b[1] - a[1] * b[0];
	return pow(atan2(det, dot), 2.0);
}
float angleAB(float ax, float ay, float bx, float by) {
	float dot = ax * bx + ay * bx;
	float det = ax * bx - ay * bx;
	return pow(atan2(det, dot), 2.0);
}

// Check if the normal  of two vectors faces up or down
bool positiveNormal(float A[2], float B[2]) {
	float c = A[1] * B[0] - A[0] * B[1];
	return c > 0;
}

// Generates the quads that will form the circuit and places random lamps along it
void genCircuit() {
	float g = 1.5; // factor de ensanchamiento del circuito
	float df = .3; // distancia farola circuito
	int probFarola = 8; // Probabilidad de instanciar una farola en 1/probFarola
	float texoff = 0;
	float qA[2];
	float qB[2];
	float qC[2];
	float qD[2];

	circuito = glGenLists(1);
	glNewList(circuito, GL_COMPILE);

	float mod;
	float puntoA[2];
	float puntoB[2];
	float puntoC[2];
	int sizeC = puntosCircuito.size();
	
	for (int i = 0; i < sizeC; i += 2)
	{
		qA[0] = qC[0]; qA[1] = qC[1];
		qB[0] = qD[0]; qB[1] = qD[1];
		// Con los puntos insertados en el vector puntosCircuito creará los quads del circuito

		if (i == 0) {

			puntoA[0] = puntosCircuito.at(sizeC - 4); puntoA[1] = puntosCircuito.at(sizeC - 3);
			puntoB[0] = puntosCircuito[i];			puntoB[1] = puntosCircuito[i + 1];
			puntoC[0] = puntosCircuito[i + 2];		puntoC[1] = puntosCircuito[i + 3];
		}
		else if (i == sizeC - 2) {

			puntoA[0] = puntosCircuito[i - 2];	puntoA[1] = puntosCircuito[i - 1];
			puntoB[0] = puntosCircuito[i];		puntoB[1] = puntosCircuito[i + 1];
			puntoC[0] = puntosCircuito[2];		puntoC[1] = puntosCircuito[3];
		}
		else {

			puntoA[0] = puntosCircuito[i - 2];	puntoA[1] = puntosCircuito[i - 1];
			puntoB[0] = puntosCircuito[i];		puntoB[1] = puntosCircuito[i + 1];
			puntoC[0] = puntosCircuito[i + 2];	puntoC[1] = puntosCircuito[i + 3];
		}


		float vectA[2] = { puntoB[0] - puntoA[0], puntoB[1] - puntoA[1] };
		float dist = distAB(puntoA,puntoB);
		float vectB[2] = { puntoB[0] - puntoC[0], puntoB[1] - puntoC[1] };

		// Calculo de la bisectriz
		float modA = modVec(vectA);
		float modB = modVec(vectB);
		//float vf[2] = { modB * vectA[0] + modA * vectB[0], modB * vectA[1] + modA * vectB[1] };
		float vf[2] = { vectA[0] / modA + vectB[0] / modB, vectA[1] / modA + vectB[1] / modB };
		if (vf[0] == 0 && vf[1] == 0) {
			// vectores colineares
			printf("vector colinear");
			vf[0] = vectA[1]; vf[1] = vectA[0];
		}
		mod = modVec(vf);
		vf[0] = vf[0] / mod * g; vf[1] = vf[1] / mod * g; // normalizacion del vector bisector


		qC[0] = puntoB[0] + vf[0]; qC[1] = puntoB[1] + vf[1];
		qD[0] = puntoB[0] - vf[0]; qD[1] = puntoB[1] - vf[1];

		// Con qA, qB, qC, qD se crea el nuevo quad del circuito
		// Calcular angulo ABC ABD
		float AB[2] = { qB[0] - qA[0], qB[1] - qA[1] };
		float AC[2] = { qC[0] - qA[0], qC[1] - qA[1] };
		float AD[2] = { qD[0] - qA[0], qD[1] - qA[1] };
		float angABC = angleAB(AC, AB);
		float angABD = angleAB(AD, AB);

		

			glPushMatrix();
			glBindTexture(GL_TEXTURE_2D, texroad);
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);
			float off = 20.0 / dist;
				if (angABC > angABD) {

					GLfloat newQ[4][3] = { {qA[0],0,qA[1]},{qB[0],0,qB[1]},{qD[0],0,qD[1]},{qC[0],0,qC[1]} };
					if (i != 0) {
						if(positiveNormal(AB, AC)) // Se calcula si la normal mira arriba, para que el quad se dibuje en direccion al cielo 
													// y la luz se dibuje correctamente
							// TODO hacerlo con quadtex para mejorar la escala de la pista
							quadtex(newQ[0], newQ[1], newQ[2], newQ[3],0,1, 0, off,10, 10);
						else
							quadtex(newQ[3], newQ[2], newQ[1], newQ[0],  0, 1, 0, off, 10, 10);
					}
				}
				else {
					GLfloat newQ[4][3] = { {qA[0],0,qA[1]},{qB[0],0,qB[1]},{qC[0],0,qC[1]},{qD[0],0,qD[1]} };
					if (i != 0) {
						if (!positiveNormal(AB, AC))
							quadtex(newQ[3], newQ[2], newQ[1], newQ[0], 0, 1, 0, off, 10, 10);
						else
							quadtex(newQ[0], newQ[1], newQ[2], newQ[3], 0, 1, 0, off, 10, 10);
					}
				}
				texoff += off;
			glPopMatrix();

			if (rand() % probFarola == 0) {
				// colocar farolita al lado del circuito
				// punto medio de AB
				float pm[2] = { (puntoA[0] + puntoB[0]) / 2,(puntoA[1] + puntoB[1]) / 2 };
				// unitario vectorA perpendicular
				float  ua[2] = { -1.0 * vectA[1] / modA, vectA[0] / modA };



				float o = rand() % 2 == 0 ? 1.0 : -1.0; // orientacion de la farola
				float ang = (atan2(ua[1], -ua[0]) * 180 / PI) - 90 * o; // angulo vector
				if (i != 0) {
					glPushMatrix();
						glTranslatef(pm[0] - ua[0] * (g + df) * o, 0, pm[1] - ua[1] * (g + df) * o);
						// Se anyade el punto donde instanciamos la farola a la red de puntosFarola
						puntosFarolas.push_back(pm[0]); puntosFarolas.push_back(pm[1]);
						glRotatef(ang, 0, 1, 0);
						glCallList(farola);
					glPopMatrix();
				}
			}
			//srand(i * time(0));
	}
	glEndList();
}

// Smooth the points of the circuit to have prettier shape
void smoothCircuit() {
	for (int i = 0; i < puntosCircuito.size() - 2; i+=4)
	{
		float factor = 0.25;
		 
		float pAx = puntosCircuito[i-2];
		float pAy = puntosCircuito[i-1];
		float pBx = puntosCircuito[i];
		float pBy = puntosCircuito[i + 1];
		float pCx = puntosCircuito[i+2];
		float pCy = puntosCircuito[i + 3];

		if (i == 0) {
			pAx = puntosCircuito[puntosCircuito.size() - 4];
			pAy = puntosCircuito[puntosCircuito.size() - 3 ];
		}

		float distAB = sqrt(pow(pBx - pAx, 2.0) + pow(pBy - pAy,2.0));
		float distBC = sqrt(pow(pBx - pCx, 2.0) + pow(pBy - pCy, 2.0));

		float vecA[2] = { pAx - pBx, pAy - pBy };
		float vecB[2] = { pCx - pBx, pCy - pBy };
		float modA = modVec(vecA);
		float modB = modVec(vecB);
		vecA[0] = vecA[0] / modA; vecA[1] = vecA[1] / modA;
		vecB[0] = vecB[0] / modB; vecB[1] = vecB[1] / modB;

		puntosCircuito[i] = vecB[0] * factor * distBC + pBx;
		puntosCircuito[i + 1] = vecB[1] * factor * distBC + pBy;
		puntosCircuito.insert(puntosCircuito.begin() + i, vecA[1] * factor * distAB  + pBy);
		puntosCircuito.insert(puntosCircuito.begin() + i, vecA[0] * factor * distAB + pBx);
	}
	puntosCircuito[puntosCircuito.size() - 2] = puntosCircuito[0];
	puntosCircuito[puntosCircuito.size() - 1] = puntosCircuito[1];
	cX = puntosCircuito[0];
	cY = puntosCircuito[1];
	rot = (angleAB(puntosCircuito[0], puntosCircuito[1], puntosCircuito[2], puntosCircuito[3]) + PI) * 180 / PI;
}

// Generates the car model
void genCar() {
	coche = glGenLists(1);
	glNewList(coche, GL_COMPILE);
	glPushMatrix();
		glColor3f(0.12, 0.1, 0.11);
		GLfloat h = 0.2;
		GLfloat h2 = 0.4;
		GLfloat capoQ[4][3] = { {0,h,.2},{-0.4,h - 0.05,.15},{-0.4,h - .05, -.15}, {0,h,-.2 } };
		quad(capoQ[2], capoQ[1], capoQ[0], capoQ[3], 10, 10);

		GLfloat techo[4][3] = { {0,h2,.17},{0,h2,-.17},{.5,h2,-.17},{.5,h2,.17} };
		quad(techo[0], techo[1], techo[2], techo[3]);

		GLfloat pared[4][3] = { {0,h,-.2},{0,h2,-.17},{.5,h2,-.17},{.5,h,-.2} };
		quad(pared[0], pared[1], pared[2], pared[3]);

		GLfloat pared2[4][3] = { {0,h,.2},{0,h2,.17},{.5,h2,.17},{.5,h,.2} };
		quad(pared2[0], pared2[1], pared2[2], pared2[3]);

		GLfloat pared3[4][3] = { {0.5,0,.2},{0.5,h,0.2},{0,h,.2},{0,0,.2} };
		quad(pared3[0], pared3[1], pared3[2], pared3[3]);

		GLfloat pared4[4][3] = { {0.5,0,-.2},{0.5,h,-0.2},{0,h,-.2},{0,0,-.2} };
		quad(pared4[0], pared4[1], pared4[2], pared4[3]);

		GLfloat morro[4][3] = { {-0.4,0,.15},{-0.4,0,-.15},{-0.4,.15,-.15},{-0.4,.15,.15} };
		quad(morro[0], morro[1], morro[2], morro[3]);

		GLfloat morro2[4][3] = { {0,0,.2},{0,0,-.2},{0,.2,-.2},{0,.2,.2} };
		quad(morro2[0], morro2[1], morro2[2], morro2[3]);

		GLfloat pared5[4][3] = { {0,0,0.2},{-0.4,0,-.15},{-0.4,0.15,.15},{0,.2,.2} };
		quad(pared5[0], pared5[1], pared5[2], pared5[3]);
		glBindTexture(GL_TEXTURE_2D, 0);
	glPopMatrix();
	glEndList();
}

// Creates the model of the lamp
void genFarola() {
	farola = glGenLists(1);
	glNewList(farola, GL_COMPILE);
	GLfloat q1[4][3] = { {0.05,0,0},{-.05,0,0},{-.05,.4,0},{0.05,.4,0} };
	GLfloat q2[4][3] = { {0.03,.4,0},{-.03,.4,0},{-.03,2.5,0},{0.03,2.5,0} };
	GLfloat q3[4][3] = { {0,0,1},{0,.03,1},{0,.03,-.4},{0,0,-.4} };
	GLfloat qq[4][3] = { { -5, 5, 0 }, { 5, 5, 0 }, { 5, 0, -5 }, { -5, 0, -5 } };

	glPushMatrix();
		glBindTexture(GL_TEXTURE_2D, texmetal);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);        //Texel menor que pixel
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);        //Texel mayor que pixel
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);            //La textura se repite en abcisas
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);            //La textura se repite en ordenadas

		quad(q1[0], q1[1], q1[2], q1[3]);

		glPushMatrix();
			glRotatef(-90, 0, 1, 0);
			quad(q1[0], q1[1], q1[2], q1[3]);
		glPopMatrix();
		glPushMatrix();
			quad(q2[0], q2[1], q2[2], q2[3]);
		glPopMatrix();
		glPushMatrix();
			glRotatef(-90, 0, 1, 0);
			quad(q2[0], q2[1], q2[2], q2[3]);
		glPopMatrix();
		glPushMatrix();
			glTranslatef(0, 2, 0);
			quad(q3[0], q3[1], q3[2], q3[3]);
		glPopMatrix();
		glPushMatrix();
			glTranslatef(0, 2, 0);
			glRotatef(90, 0, 0, 1);
			quad(q3[0], q3[1], q3[2], q3[3]);
		glPopMatrix();
		glPushMatrix();
			GLUquadric* quad;
			quad = gluNewQuadric();
			glTranslatef(0, 2, 1);
			gluSphere(quad, .15, 10, 10);
		glPopMatrix();
	glPopMatrix();
	glBindTexture(GL_TEXTURE_2D, 0);
	glEndList();
}

// Creates the model of the floor
void floor() {
	//TODO: make a list of it
	glPushMatrix();
	glBindTexture(GL_TEXTURE_2D, texfloor);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);
	if (nightMode == NightMode::OFF) {
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
	}
	else { glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE); }

	GLfloat base[4][3] = { {-200, -0.01, 200},{200, -0.01, 200},{200, -0.01, -200},{-200, -0.01, -200} };
	quadtex(base[0], base[1], base[2], base[3], 0, 100, 0, 100,100,100);
	glPopMatrix();
}

// Generate a panoramic view of the background with the steps you want
void genFondo() {
	int steps = 12;
	float h = 220;
	float r = 220;
	float pa[2] = { r, 0 };
	float pb[2] = { r, 0 };

	fondo = glGenLists(1);
	glNewList(fondo, GL_COMPILE);

	glPushMatrix();

		glBindTexture(GL_TEXTURE_2D, background);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_MIRRORED_REPEAT);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_MIRRORED_REPEAT);

		int j = 0;
		for (float i = 2 * PI / steps; i < 2*PI; i+=2*PI/steps)
		{
			pa[0] = pb[0];
			pa[1] = pb[1];
			pb[0] = r * cos(i);
			pb[1] = r * sin(i);
			GLfloat p[4][3] = { {pa[0],-1,pa[1]},{pa[0],h,pa[1]},{pb[0],h,pb[1]},{pb[0],-1,pb[1]} };
			glPushMatrix();
				quadtex(p[1], p[2], p[3], p[0],
				j * 1.0/steps,(j+1.0)/steps,0,1, // making it panoramic
				1,1);
			glPopMatrix();
			j++;
		}
		glBindTexture(GL_TEXTURE_2D, 0);
	glPopMatrix();
	
	glEndList();
}

//Barra del hud para comprobar velocidad
void interfaz() {

	glPushMatrix();
	glColor4f(vel/VEL_MAX , 1.0, 0.0, 0.6);
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); glEnable(GL_BLEND); 
		glDisable(GL_TEXTURE_2D);
		glDisable(GL_LIGHTING);
		glBegin(GL_POLYGON);
		glTranslatef(-0.5, -5, 0);
		glVertex3f(-1.2, (vel * 2), -2.0);
		glVertex3f(-1.3, (vel * 2), -2.0);
		glVertex3f(-1.3, 0, -2.0);
		glVertex3f(-1.2, 0, -2.0);
		glEnd();
	glPopMatrix();
}

// Load the textures that will be used
void loadTextures() {
	//loadTex(&texroad, texroad, (char*)"texroad.jpg");
	glGenTextures(1, &texroad);
	glBindTexture(GL_TEXTURE_2D, texroad);
	loadImageFile((char*)"carretera.jpg");

	glGenTextures(1, &texmetal);
	glBindTexture(GL_TEXTURE_2D, texmetal);
	loadImageFile((char*)"metal.png");

	glGenTextures(1, &texfloor);
	glBindTexture(GL_TEXTURE_2D, texfloor);
	loadImageFile((char*)"floor.jpg");

	glGenTextures(1, &MALDITO);
	glBindTexture(GL_TEXTURE_2D, MALDITO);
	loadImageFile((char*)"sky.jpg");

	glGenTextures(1, &background);
	glBindTexture(GL_TEXTURE_2D, background);
	loadImageFile((char*)"sky.jpg");

	glEnable(GL_TEXTURE_2D);
}

// Displays a menu to choose where to place the cam view
void onMenuVista(int valor) {
	if (valor == 0) {
		// TODO: CAMBIA A CAM COCHE
		cam = camQ::CAR_CAM;
	}
	else {
		// TODO: CAMBIA A CAM SUPERIOR ORTOGONAL
		cam = camQ::CIRCUIT_CAM;
	}

	glutPostRedisplay();
}

// Displays a menu to choose where to place the model view
void onMenuModo(int valor) {
	if (valor == 0) { modo = modoQ::ALAMBRICO; }
	else if (valor == 1) { modo = modoQ::SOLIDO; }
	else { modo = modoQ::DOBLE; }

	glutPostRedisplay();
}

void lightmat() {
	GLfloat Al0[] = { 0.05,0.05,0.05 };
	GLfloat Dl0[] = { 0.05,0.05,0.05 };
	GLfloat Sl0[] = { 0.0,0.0,0.0 };

	glEnable(GL_LIGHT0);
	glLightfv(GL_LIGHT0, GL_AMBIENT, Al0);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, Dl0);
	glLightfv(GL_LIGHT0, GL_SPECULAR, Sl0);



	//luz faro vehiculo

	GLfloat Al1[] = { 0.2,0.2,0.2,1.0 };
	GLfloat Dl1[] = { 1.0,1.0,1.0,1.0 };
	GLfloat Sl1[] = { 0.3,0.3,0.3,1.0 };


	glEnable(GL_LIGHT1);
	glLightfv(GL_LIGHT1, GL_AMBIENT, Al1);
	glLightfv(GL_LIGHT1, GL_DIFFUSE, Dl1);
	glLightfv(GL_LIGHT1, GL_SPECULAR, Sl1);
	glLightf(GL_LIGHT1, GL_SPOT_CUTOFF, 25);
	glLightf(GL_LIGHT1, GL_SPOT_EXPONENT, 10.0);

	//farolas

	GLfloat Alx[] = { 0.0,0.0,0.0,1.0 };
	GLfloat Dlx[] = { 1,1,0.5,1.0 };
	GLfloat Slx[] = { 0.0,0.0,0.0,1.0 };
	float se = 5;
	float sc = 45.0;

	glEnable(GL_LIGHT2);
	glLightfv(GL_LIGHT2, GL_AMBIENT, Alx);
	glLightfv(GL_LIGHT2, GL_DIFFUSE, Dlx);
	glLightfv(GL_LIGHT2, GL_SPECULAR, Slx);
	glLightf(GL_LIGHT2, GL_SPOT_CUTOFF, sc);
	glLightf(GL_LIGHT2, GL_SPOT_EXPONENT, se);

	glEnable(GL_LIGHT3);
	glLightfv(GL_LIGHT3, GL_AMBIENT, Alx);
	glLightfv(GL_LIGHT3, GL_DIFFUSE, Dlx);
	glLightfv(GL_LIGHT3, GL_SPECULAR, Slx);
	glLightf(GL_LIGHT3, GL_SPOT_CUTOFF, sc);
	glLightf(GL_LIGHT3, GL_SPOT_EXPONENT, se);

	glEnable(GL_LIGHT4);
	glLightfv(GL_LIGHT4, GL_AMBIENT, Alx);
	glLightfv(GL_LIGHT4, GL_DIFFUSE, Dlx);
	glLightfv(GL_LIGHT4, GL_SPECULAR, Slx);
	glLightf(GL_LIGHT4, GL_SPOT_CUTOFF, sc);
	glLightf(GL_LIGHT4, GL_SPOT_EXPONENT, se);

	glEnable(GL_LIGHT5);
	glLightfv(GL_LIGHT5, GL_AMBIENT, Alx);
	glLightfv(GL_LIGHT5, GL_DIFFUSE, Dlx);
	glLightfv(GL_LIGHT5, GL_SPECULAR, Slx);
	glLightf(GL_LIGHT5, GL_SPOT_CUTOFF, sc);
	glLightf(GL_LIGHT5, GL_SPOT_EXPONENT, se);
}

// Initial function
void init()
// Funcion de inicializacion propia
{
	rPressable = false;
	//Tener en cuenta la profundidad logica
	glEnable(GL_DEPTH_TEST);
	glClearColor(0,0,0,0);
	lightmat();

	genCar();
	loadTextures();
	genFarola();
	genFondo();
	createCircuitPoints();
	smoothCircuit();
	smoothCircuit(); // smoothCircuit();
	genCircuit();

	// MENU SELECCIÓN CAMARA
	glutCreateMenu(onMenuVista);
	glutAddMenuEntry("CAMARA COCHE", 0);
	glutAddMenuEntry("VISTA SUPERIOR", 1);
	glutAttachMenu(GLUT_LEFT_BUTTON);

	// MENU SELECCIÓN MODO VISTA
	glutCreateMenu(onMenuModo);
	glutAddMenuEntry("ALAMBRICO", 0);
	glutAddMenuEntry("SOLIDO", 1);
	glutAttachMenu(GLUT_RIGHT_BUTTON);

	rPressable = true;
}

// Handle the fog interaction
void handleFog() {
	if (fogMode == FogMode::ON) {

		glEnable(GL_FOG);
		GLfloat fogColor[] = { 0.71 ,0.65,0.58 };
		glFogfv(GL_FOG_COLOR, fogColor);		
		glFogf(GL_FOG_DENSITY, 0.1);		

	}
	else {
		glDisable(GL_FOG);
	}
}

// Handle the night interaction
void handleNight() {
	if (nightMode == NightMode::ON) {
		glPushMatrix();
			glEnable(GL_LIGHTING);
			glShadeModel(GL_SMOOTH);
			glEnable(GL_BLEND);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
			glColorMaterial(GL_FRONT, GL_DIFFUSE);
		glPopMatrix();
	}
	else {
		glClearColor(1, 1, 1, 1);
		glPushMatrix();
			glDisable(GL_LIGHTING);
			glDisable(GL_BLEND);
		glPopMatrix();
	}

}

// Function to place the lights near the car dinamically
void activateNearLamp() {
	float maxDist = 10;
	float ahead = 4; // la distancia por delante del vehiculo
	// posicion del vehiculo calculada con cX y cY
	// iterar entre todas las farolas a ver cuales están a menos de 5u
	vector<float> nearLamps;
	for (int i = 0; i < puntosFarolas.size() - 2; i += 2)
	{
		float aheadX = cX + cos(rot * PI/ 180.0) * ahead;
		float aheadY = cY + sin(rot * PI /180.0) * ahead;
		float dist = sqrt(pow(puntosFarolas[i] - aheadX, 2.0) + pow(puntosFarolas[i + 1] - aheadY, 2.0));
		if (dist < maxDist) {
			nearLamps.push_back(puntosFarolas[i]); nearLamps.push_back(puntosFarolas[i + 1]);
		}
	}
	//printf("There are %i lamps near", nearLamps.size() / 2);
	int usedLamps = 0;
	int lamps[4] = { GL_LIGHT2,GL_LIGHT3,GL_LIGHT4, GL_LIGHT5 };
	glPushMatrix();
		for (int i = 0; i < 4 && nearLamps.size()>0; i++)
		{
			float y = nearLamps.back();
			nearLamps.pop_back();
			float x = nearLamps.back();
			nearLamps.pop_back();

			GLfloat lampPos[4] = { x,2,y,1 };
			glLightfv(lamps[i], GL_POSITION, lampPos);
			GLfloat dir_farola[3] = { 0.0, -1.0, 0.0 };
			glLightfv(lamps[i], GL_SPOT_DIRECTION, dir_farola);
			usedLamps++;
		}
		while (usedLamps < 4) { // LAS NO USADAS SE ENIAN A CUENCA PARA QUE NO MOLESTEN
			GLfloat lampPos[4] = { 500,500,500,1 };
			glLightfv(lamps[usedLamps], GL_POSITION, lampPos);
			GLfloat dir_farola[3] = { 0.0, -1.0, 0.0 };
			glLightfv(lamps[usedLamps], GL_SPOT_DIRECTION, dir_farola);

			usedLamps++;
		}
	glPopMatrix();

	// La luna
	GLfloat posicionLuna[] = { 0.0, 10.0, 0.0, 0.0 };
	glLightfv(GL_LIGHT0, GL_POSITION, posicionLuna);

}

// Funcion de atencion al dibujo
void display()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	
	if (cam == camQ::CAR_CAM) {
		if (isUIshown)
			interfaz();

		// COCHE
		GLfloat posicionL1[] = { 0 ,0.7,0,1 };//luz de los focos del coche
		glLightfv(GL_LIGHT1, GL_POSITION, posicionL1);
		GLfloat dir_light1[] = { 0.0, -0.5, -0.7 };
		glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, dir_light1);
		glPushMatrix();
			glTranslatef(0, -.3, -.26); // centrar el coche en la camara
			glRotatef(-90, 0, 1, 0);
			glCallList(coche);
		glPopMatrix();

		gluLookAt(cX, 0.3, 0.0 + cY,
			cX + cos(rot * PI / 180) * 10, 0.3, cY + sin(rot * PI / 180) * 10,
			0, 1, 0);
	}
	else if (cam == camQ::CIRCUIT_CAM) {
		glDisable(GL_FOG);
		glOrtho(10, 10, 10, 10, 0.2, 50);
		gluLookAt(0, 100, 0,0, 0, 0, -1, 0, 0);
		
		glPushMatrix();
			glScalef(10, 10, 10);
			ejes();
		glPopMatrix();

		// COCHE
		glPushMatrix();
			glTranslatef(cX,0,cY);
			glRotatef(-rot, 0, 1, 0);
			glCallList(coche);
		glPopMatrix();
	}

	handleNight();
	handleFog();
	if (modo == modoQ::ALAMBRICO) {
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
		glDisable(GL_TEXTURE_2D);
		glDisable(GL_LIGHTING);
		glDisable(GL_FOG);
	}
	else if (modo == modoQ::SOLIDO) {
		glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
		glEnable(GL_TEXTURE_2D);
	}
	if (nightMode == NightMode::OFF) {
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
	}
	else { 
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE); 
		activateNearLamp(); // solo cuando se entra en modo noche para ahorrar recursos
	}


	glPushMatrix();
		floor();
		glCallList(circuito);
		glCallList(fondo);
	glPopMatrix();

	
	glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	glEnable(GL_TEXTURE_2D);

	glutSwapBuffers();
}

// Funcion de atencion al redimensionamiento
void reshape(GLint w, GLint h)
{
	glViewport(0, 0, w, h);
	float razon = (float)w / h;
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(45, razon, 0.1, 1000);
}

// Function that is called every frame
void update() {
	cX += vel * cos(rot * PI / 180); // Calculate new position of the car
	cY += vel * sin(rot * PI / 180);

	if (vel > 0) vel -= acc / 100; // Decelerates the car
	glutPostRedisplay(); // Refresh the view
}

// Sirve para re-arrancar el reloj de cuenta atras
void onTimer(int tiempo)
{
	glutTimerFunc(tiempo, onTimer, tiempo);
	update();
}

// Handles different key presses
void onKey(unsigned char tecla, int x, int y) {
	switch (tecla) {
	case 'W':
	case 'w': // accelerate
		if (vel < VEL_MAX) {
			vel += acc;
		}
		break;
	case 'S':
	case 's': // brake
		if (vel > 0) {
			vel = vel/1.15;
			if (vel < 0) vel = 0;
		}
		break;
	case 'A':
	case 'a': // turn left
		rot -= rotVel;
		break;
	case 'D':
	case 'd': // turn right
		rot += rotVel;
		break;
	case 'n': // switch the fog mode
		if (fogMode == FogMode::ON) fogMode = FogMode::OFF;
		else fogMode = FogMode::ON;
		break;
	case 'C':
	case 'c':
		if (modo == modoQ::ALAMBRICO) modo = modoQ::SOLIDO;
		else modo = modoQ::ALAMBRICO;
		break;
	case 'L':
	case 'l': // switch the night mode
		if (nightMode == NightMode::ON) nightMode = NightMode::OFF;
		else nightMode = NightMode::ON;
		break;
	case 'R':
	case 'r':
		if (rPressable) {
			vel = 0;
			puntosCircuito.resize(0);
			puntosFarolas.resize(0);
			glDeleteLists(0, 10);
			init();
		}
		break;
	case 'I':
	case 'i':
		isUIshown = !isUIshown;
		break;
	case 'P':
	case 'p': {
		cout << "Guardando captura..." << endl;
		saveScreenshot((char*)"./img/screenshot.jpg", 1280, 720);
		break;
	}
	//case 27:
	//	exit(0);
	}
}

void main(int argc, char** argv)
// Programa principal
{
	FreeImage_Initialise();
	glutInit(&argc, argv); // Inicializacion de GLUT
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH); // Alta de buffers a usar
	glutInitWindowSize(1280, 720); // Tamanyo inicial de la ventana
	glutCreateWindow(PROYECTO); // Creacion de la ventana con su titulo
	init(); // Inicializacion propia. IMPORTANTE SITUAR AQUI
	std::cout << PROYECTO << " RUNNING " << std::endl; // Mensaje por consola
	cout << "\nTecla R para generar otro circuito aleatorio!!\n\n\n";
	cout << "1. Flecha izquierda/derecha: giro del vehículo\n";
	cout << "2. Flecha arriba / abajo: aumento / disminución de la velocidad\n";
	cout << "3. S : Activa / desactiva un modelo simple en alámbrico\n";
	cout << "4. L : Cambia entre modo diurno / nocturno\n";
	cout << "5. N : Cambia el estado de la niebla(on / off)\n";
	cout << "6. C : Cambia la visibilidad de elementos solidarios a la cámara(on / off):\n";
	cout << "7. I : Velocimetro y cronometro\n";
	cout << "8. h : Cambia el modelo de vehículo\n";
	cout << "9. Click derecho e izquierdo para cambiar modo de cámaras y vista\n";
	glutKeyboardFunc(onKey);

	glutDisplayFunc(display); // Alta de la funcion de atencion a display
	glutReshapeFunc(reshape); // Alta de la funcion de atencion a reshape
	glutTimerFunc(1000 / TASA_FPS, onTimer, 1000 / TASA_FPS);

	glutMainLoop(); // Puesta en marcha del programa
	FreeImage_DeInitialise();
}