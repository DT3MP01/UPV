constexpr auto PROYECTO = "Driving videogame";

#include <iostream>
#include <cmath>
#include <freeglut.h>
#include <../Utilidades.h>
#include <sstream>
#include <ctime>
#include <irrKlang.h>

#pragma comment(lib, "irrKlang.lib")

using namespace irrklang;
using namespace std;

// Interface to the sound engine
ISoundEngine* engine;

// Different types of modes
bool light_mode = true;
bool original_mode = false;
bool wired_mode = false;
bool fog_mode = false;
bool HUD_mode = false;
bool large_mode = false;
bool car_mode = false;
bool dif_mode = false;

bool eagle_view = false;

// Camera position
float x = 0;
static int y = 1;
double z = 0;

// Amplitude and period of the sinusoidal function
double amplitude = 10;
double period = 80;

// Array for all textures
GLuint textures[14];

// Controls
bool my_right = false;
bool right2 = false;
bool my_left = false;
bool left2 = false;
bool up = false;
bool down = false;

// Original and changed speed and rotational speed increments
double speed_increase = 0.05;
double original_speed_increase = 0.1;
double rotation_increase = PI / 90;
double original_rotation_increase = 0.25;

// Variables to know the rotation and speed
double rotation = 1;
double speed = 0;

// Coin management
bool coin_taken = false;
int coins = 1;

// Continuous rotation of the coins
double alpha_coins = 0;

// Vertices for quads
GLfloat v0[3] = { 0, 0, 0 };
GLfloat v1[3] = { 0, 0, 0 };
GLfloat v2[3] = { 0, 0, 0 };
GLfloat v3[3] = { 0, 0, 0 };

// Road creation parameters
GLint road_width = 4;
GLint lampposts_distance = 10;

// Road material parameters
GLfloat road_dif[] = { (GLfloat) 0.8, (GLfloat) 0.8, (GLfloat) 0.8, 1 };
GLfloat road_sp[] = { (GLfloat) 0.3, (GLfloat) 0.3, (GLfloat) 0.3, 1 };

// Management of banners and lampposts
int banner_index = 0;
float ant = 4;
float ant2 = 4;

// Array with the names of lampposts
GLfloat lampposts[] = { GL_LIGHT2, GL_LIGHT3, GL_LIGHT4, GL_LIGHT5 };

// Functions for the creation of the road following a sinusoidal function
double func_sin(float x) {
	return amplitude * sin(x * ((2 * PI) / period));
}

double der_func_sin(float x) {
	return ((2 * PI * amplitude) / period) * cos(x * (2 * PI / period));
}

// Function to update the number of coins collected
// This is done from time to time to try not to pick up the same coin several times
void updateCoins(int second) {
	static int before = 0;
	int now = glutGet(GLUT_ELAPSED_TIME);
	int time = now - before;

	if (time > 1000) {
		coin_taken = false;
		before = now;
	}

	glutTimerFunc(1500, updateCoins, 1500);
	glutPostRedisplay();
}

void updateControl(int second) {
	left2 = my_left;
	right2 = my_right;

	glutTimerFunc(1500, updateControl, 1500);
	glutPostRedisplay();
}

// Función para ajustar el movimiento del vehículo en base a las teclas pulsadas
void onTimer(int value) {

	// ANIMACIÓN TEMPORALMENTE COHERENTE - HECHO
	static double before = 0;
	double now = glutGet(GLUT_ELAPSED_TIME);
	double time = (now - before) / 1000;
	x += (float) (speed * sin(rotation) * time);
	z += speed * cos(rotation) * time;
	before = now;

	alpha_coins += (360 / 30) * time;

	// CONTROLES SEGÚN LA PRÁCTICA 6 - HECHO
	if (up) {
		if (original_mode) {
			speed += original_speed_increase;
		}
		else {
			speed += speed_increase;
		}
	}

	if (down && speed > 0.0001) {
		if (original_mode) {
			speed -= original_speed_increase;
		}
		else {
			speed -= speed_increase;
		}
	}

	if (my_left) {
		if (original_mode) {
			rotation += original_rotation_increase;
		}
		else {
			rotation += rotation_increase;
		}
	}

	if (my_right) {
		if (original_mode) {
			rotation -= original_rotation_increase;
		}
		else {
			rotation -= rotation_increase;
		}
	}

	if (speed < 0.05) {
		speed = 0;
	}

	if (speed > 15) {
		speed = 15;
	}

	up = false;
	down = false;
	my_left = false;
	my_right = false;

	// TÍTULO CON LA MAGNITUD DE LA VELOCIDAD - HECHO
	stringstream title;
	title << "Simulador de coche. Velocidad (m/s): " << speed << " Número de monedas: " << (coins - 1);
	glutSetWindowTitle(title.str().c_str());

	glutTimerFunc(1000 / 60, onTimer, 1000 / 60);
	glutPostRedisplay();
}

// Function that monitors keystrokes
void onKey(unsigned char letter, int xp, int yp) {
	switch (letter) {
	case 'A':
	case 'a':
		if (eagle_view) {
			eagle_view = false;
		}
		else {
			eagle_view = true;
		}
		break;
	case 'D':
	case 'd':
		if (!dif_mode) {
			period = 70;
			amplitude = 15;
			dif_mode = true;
			// Background music
			engine->stopAllSounds();
			engine->play2D("Dragon Ball Super - Limit-Break x Survivor (Instrumental Type C).mp3", true);
		}
		else {
			amplitude = 10;
			period = 120;
			dif_mode = false;
			// Background music
			engine->stopAllSounds();
			engine->play2D("./GCN Dry Dry Desert - Mario Kart 8 Deluxe OST.mp3", true);

		}
		break;
	case 'E':
	case 'e':
		if (car_mode) {
			car_mode = false;
		}
		else {
			car_mode = true;
		}
		break;
	case 'H':
	case 'h':
		if (HUD_mode) {
			HUD_mode = false;
		}
		else {
			HUD_mode = true;
		}
		break;
	case 'G':
	case 'g':
		if (original_mode) {
			original_mode = false;
		}
		else {
			original_mode = true;
		}
		break;
	case 'L':
	case 'l':
		if (light_mode) {
			light_mode = false;
		}
		else {
			light_mode = true;
		}
		break;
	case 'N':
	case 'n':
		if (fog_mode) {
			fog_mode = false;
		}
		else {
			fog_mode = true;
		}
		break;
	case 'S':
	case 's':
		if (wired_mode) {
			wired_mode = false;
		}
		else {
			wired_mode = true;
		}
		break;
	case 27:
		exit(0);
	case 'W':
	case 'w':
		if (large_mode) {
			large_mode = false;
		}
		else {
			large_mode = true;
		}
		break;
	case 'P':
	case 'p':
		saveScreenshot((char*) "screenshot.jpg", 600, 600);
		break;
	}
	glutPostRedisplay();
}

// Function controlling the arrows
void onSpecialKey(int key, int xp, int yp) {
	switch (key) {
	case GLUT_KEY_LEFT:
		my_left = true;
		left2 = true;
		break;
	case GLUT_KEY_RIGHT:
		my_right = true;
		right2 = true;
		break;
	case GLUT_KEY_UP:
		up = true;
		left2 = false;
		right2 = false;
		break;
	case GLUT_KEY_DOWN:
		down = true;
		left2 = false;
		right2 = false;
		break;
	}
	glutPostRedisplay();
}

// Drawing of the kart
void kart() {
	glPushMatrix();
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

	if (right2) {
		glBindTexture(GL_TEXTURE_2D, textures[10]);
	}
	else if (left2) {
		glBindTexture(GL_TEXTURE_2D, textures[11]);
	}
	else {
		glBindTexture(GL_TEXTURE_2D, textures[12]);
	}

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glBegin(GL_QUADS);
	glTexCoord2f(0, 0);
	glVertex3f((GLfloat) -0.5, (GLfloat) 0.1, (GLfloat) -2);
	glTexCoord2f(1, 0);
	glVertex3f((GLfloat) 0.5, (GLfloat) 0.1, -2);
	glTexCoord2f(1, 1);
	glVertex3f((GLfloat) 0.5, (GLfloat) 0.9, -2);
	glTexCoord2f(0, 1);
	glVertex3f((GLfloat) -0.5, (GLfloat) 0.9, -2);
	glEnd();
	glDisable(GL_BLEND);
	glPopMatrix();
}

// Drawing of the ball that turns golden depending on the number of coins collected
void ball() {
	glPushMatrix();
	glTranslatef(0, -0.75, -2);
	glColor3f(1, 0, 0);

	glRotatef((GLfloat) (100 * x), -1, 0, 0);

	if (coins > 20) {
		glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, ORO);
		glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, AMARILLO);
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 5);
		glBindTexture(GL_TEXTURE_2D, textures[4]);
	}
	else {
		glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, GRISCLARO);
		glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, GRISOSCURO);
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 5);
		glBindTexture(GL_TEXTURE_2D, textures[13]);
	}

	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

	if (wired_mode) {
		glutWireSphere(0.2, 30, 30);
	}
	else {
		glutSolidSphere(0.2, 30, 30);
	}
	glPopMatrix();
}

// Initiation function
void init()
{
	engine = createIrrKlangDevice();

	// Background music
	engine->play2D("./GCN Dry Dry Desert - Mario Kart 8 Deluxe OST.mp3", true);

	// Z-BUFFER ACTIVADO - HECHO
	glEnable(GL_DEPTH_TEST);

	glClearColor(1, 1, 1, 1);

	// ACTIVAMOS EL SOMBREADO - HECHO
	glShadeModel(GL_SMOOTH);

	// ACTIVAMOS LA ILUMINACIÓN - HECHO
	glEnable(GL_LIGHTING);

	// ACTIVAMOS LAS LUCES DISTINTAS DE LA PRÁCTICA 7 - HECHO
	glEnable(GL_LIGHT0);
	glEnable(GL_LIGHT1);
	glEnable(GL_LIGHT2);
	glEnable(GL_LIGHT3);
	glEnable(GL_LIGHT4);
	glEnable(GL_LIGHT5);
	glEnable(GL_LIGHT6);
	glEnable(GL_LIGHT7);

	// LUZ DIRECCIONAL DE LUNA - HECHO
	GLfloat ambient_moon[] = { (GLfloat) 0.05, (GLfloat) 0.05, (GLfloat) 0.05, 1 };
	GLfloat specular_moon[] = { 0, 0, 0, 1 };
	glLightfv(GL_LIGHT0, GL_AMBIENT, ambient_moon);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, ambient_moon);
	glLightfv(GL_LIGHT0, GL_SPECULAR, specular_moon);
	glLightModeli(GL_LIGHT_MODEL_TWO_SIDE, GL_TRUE);

	// LUZ FOCAL DEL VEHICULO - HECHO
	GLfloat ambient_headlamp[] = { (GLfloat) 0.2, (GLfloat) 0.2, (GLfloat) 0.2, 1 };
	GLfloat fuzzy_headlamp[] = { 1, 1, 1, 1 };
	GLfloat specular_headlamp[] = { (GLfloat) 0.3, (GLfloat) 0.3, (GLfloat) 0.3, 1 };

	glLightfv(GL_LIGHT1, GL_AMBIENT, ambient_headlamp);
	glLightfv(GL_LIGHT1, GL_DIFFUSE, fuzzy_headlamp);
	glLightfv(GL_LIGHT1, GL_SPECULAR, specular_headlamp);
	glLightf(GL_LIGHT1, GL_SPOT_CUTOFF, 25);
	glLightf(GL_LIGHT1, GL_SPOT_EXPONENT, 20);

	// Headlamps
	GLfloat specular_ambient_streetlamp[] = { 0, 0, 0, 1 };
	GLfloat fuzzy_streetlamp[] = { (GLfloat) 0.5, (GLfloat) 0.5, (GLfloat) 0.2, 1 };
	GLfloat posEms[] = { 0, -1, 0, 1 };

	glLightfv(GL_LIGHT2, GL_AMBIENT, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT2, GL_DIFFUSE, fuzzy_streetlamp);
	glLightfv(GL_LIGHT2, GL_SPECULAR, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT2, GL_SPOT_DIRECTION, posEms);
	glLightf(GL_LIGHT2, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT2, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT3, GL_AMBIENT, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT3, GL_DIFFUSE, fuzzy_streetlamp);
	glLightfv(GL_LIGHT3, GL_SPECULAR, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT3, GL_SPOT_DIRECTION, posEms);
	glLightf(GL_LIGHT3, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT3, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT4, GL_AMBIENT, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT4, GL_DIFFUSE, fuzzy_streetlamp);
	glLightfv(GL_LIGHT4, GL_SPECULAR, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT4, GL_SPOT_DIRECTION, posEms);
	glLightf(GL_LIGHT4, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT4, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT5, GL_AMBIENT, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT5, GL_DIFFUSE, fuzzy_streetlamp);
	glLightfv(GL_LIGHT5, GL_SPECULAR, specular_ambient_streetlamp);
	glLightfv(GL_LIGHT5, GL_SPOT_DIRECTION, posEms);
	glLightf(GL_LIGHT5, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT5, GL_SPOT_EXPONENT, 10);

	// Banners
	GLfloat banner_specular_environment[] = { 0.5, 0.5, 0.5, 1 };
	GLfloat diffuse_banner[] = { 1, 1, 1, 1 };

	glLightfv(GL_LIGHT6, GL_AMBIENT, banner_specular_environment);
	glLightfv(GL_LIGHT6, GL_DIFFUSE, diffuse_banner);
	glLightfv(GL_LIGHT6, GL_SPECULAR, banner_specular_environment);
	glLightfv(GL_LIGHT6, GL_SPOT_DIRECTION, posEms);
	glLightf(GL_LIGHT6, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT6, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT7, GL_AMBIENT, banner_specular_environment);
	glLightfv(GL_LIGHT7, GL_DIFFUSE, diffuse_banner);
	glLightfv(GL_LIGHT7, GL_SPECULAR, banner_specular_environment);
	glLightfv(GL_LIGHT7, GL_SPOT_DIRECTION, posEms);
	glLightf(GL_LIGHT7, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT7, GL_SPOT_EXPONENT, 10);

	// ACTIVAMOS LAS TEXTURAS - HECHO
	glEnable(GL_TEXTURE_2D);

	// Road
	glGenTextures(1, &textures[1]);
	glBindTexture(GL_TEXTURE_2D, textures[1]);
	loadImageFile((char*) "road.jpg");

	// Dry desert around
	glGenTextures(1, &textures[2]);
	glBindTexture(GL_TEXTURE_2D, textures[2]);
	loadImageFile((char*) "BANNER-DESIERTO-VIDEOJUEGO.png");

	// Clear skies
	glGenTextures(1, &textures[3]);
	glBindTexture(GL_TEXTURE_2D, textures[3]);
	loadImageFile((char*) "cielo.jpg");

	// Golden
	glGenTextures(1, &textures[4]);
	glBindTexture(GL_TEXTURE_2D, textures[4]);
	loadImageFile((char*) "golden.jpg");

	// Night sky
	glGenTextures(1, &textures[5]);
	glBindTexture(GL_TEXTURE_2D, textures[5]);
	loadImageFile((char*) "night.jpg");

	// Banners
	glGenTextures(1, &textures[6]);
	glBindTexture(GL_TEXTURE_2D, textures[6]);
	loadImageFile((char*) "banner-avicii.png");

	glGenTextures(1, &textures[7]);
	glBindTexture(GL_TEXTURE_2D, textures[7]);
	loadImageFile((char*) "dbzk_banner_final.jpg");

	glGenTextures(1, &textures[8]);
	glBindTexture(GL_TEXTURE_2D, textures[8]);
	loadImageFile((char*) "banner-gal.jpg");

	glGenTextures(1, &textures[9]);
	glBindTexture(GL_TEXTURE_2D, textures[9]);
	loadImageFile((char*) "banner-gal2.jpg");

	// Kart
	glGenTextures(1, &textures[10]);
	glBindTexture(GL_TEXTURE_2D, textures[10]);
	loadImageFile((char*) "mario_derecha.png");

	glGenTextures(1, &textures[11]);
	glBindTexture(GL_TEXTURE_2D, textures[11]);
	loadImageFile((char*) "mario_izquierda.png");

	glGenTextures(1, &textures[12]);
	glBindTexture(GL_TEXTURE_2D, textures[12]);
	loadImageFile((char*) "mario_recto.png");

	// Steel
	glGenTextures(1, &textures[13]);
	glBindTexture(GL_TEXTURE_2D, textures[13]);
	loadImageFile((char*) "steel.jpg");
}

void display()
{
	// Z-BUFFER ACTIVADO - HECHO
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	if (wired_mode) {
		glDisable(GL_LIGHTING);
		glDisable(GL_TEXTURE_2D);
	}
	else {

		if (light_mode) {
			glDisable(GL_LIGHTING);
			glClearColor(1, 1, 1, 1);
		}
		else
		{
			glShadeModel(GL_SMOOTH);
			glEnable(GL_LIGHTING);
			glClearColor(0, 0, 0, 0);
		}
		glEnable(GL_TEXTURE_2D);
	}

	if (fog_mode) {
		glEnable(GL_FOG);
		glFogfv(GL_FOG_COLOR, ORO);
		glFogf(GL_FOG_DENSITY, (GLfloat) 0.05);
	}
	else {
		glDisable(GL_FOG);
	}

	glMatrixMode(GL_MODELVIEW);

	// Drawing of banners
	GLfloat looping = 0;
	GLfloat start2 = ant2;
	for (int i = 0; i < 4; ++i) {
		start2 += 75;

		if (i == 0) {
			looping = start2;
		}

		GLfloat streetlight_X = start2;
		double streetlight_Z = func_sin(streetlight_X);
		GLfloat light_position_1[] = { streetlight_X, 10, (GLfloat) streetlight_Z + 2, 1 };
		GLfloat light_position_2[] = { streetlight_X, 10, (GLfloat) streetlight_Z - 2, 1 };
		glPushMatrix();

		switch (i) {
		case 0:
			glLightfv(GL_LIGHT6, GL_POSITION, light_position_1);
			glLightfv(GL_LIGHT7, GL_POSITION, light_position_2);
			glBindTexture(GL_TEXTURE_2D, textures[(0 + banner_index) % 4 + 6]);
			break;
		case 1:
			glBindTexture(GL_TEXTURE_2D, textures[(1 + banner_index) % 4 + 6]);
			break;
		case 2:
			glBindTexture(GL_TEXTURE_2D, textures[(2 + banner_index) % 4 + 6]);
			break;
		case 3:
			glBindTexture(GL_TEXTURE_2D, textures[(3 + banner_index) % 4 + 6]);
			break;
		}

		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		if (wired_mode) {
			glPolygonMode(GL_BACK, GL_LINE);
			glPolygonMode(GL_FRONT, GL_LINE);
		}
		else {
			glPolygonMode(GL_BACK, GL_FILL);
			glPolygonMode(GL_FRONT, GL_FILL);
		}
		glTranslatef(streetlight_X, 1, (GLfloat) streetlight_Z);
		glColor3f(1, 0, 1);
		GLfloat g0[3] = { 1, 1, -4 };
		GLfloat g1[3] = { 1, 1, 4 };
		GLfloat g2[3] = { 1, 6, 4 };
		GLfloat g3[3] = { 1, 6, -4 };
		quadtex(g0, g1, g2, g3, 0, 1, 0, 1, 50, 50);
		glPopMatrix();
		glPushMatrix();
		glDisable(GL_TEXTURE_2D);
		glDisable(GL_LIGHTING);
		glTranslatef(streetlight_X + 1, 7, (GLfloat) streetlight_Z - 4);
		glColor3f(0, 0, 0);
		glRotatef(90, 1, 0, 0);

		if (wired_mode) {
			glutWireCylinder(0.1, 10, 30, 30);
		}
		else {
			glutSolidCylinder(0.1, 10, 30, 30);
		}

		glEnable(GL_TEXTURE_2D);
		glEnable(GL_LIGHTING);
		glPopMatrix();
		glPushMatrix();
		glDisable(GL_TEXTURE_2D);
		glDisable(GL_LIGHTING);
		glTranslatef(streetlight_X + 1, 7, (GLfloat) streetlight_Z + 4);
		glColor3f(0, 0, 0);
		glRotatef(90, 1, 0, 0);

		if (wired_mode) {
			glutWireCylinder(0.1, 10, 30, 30);
		}
		else
		{
			glutSolidCylinder(0.1, 10, 30, 30);
			glEnable(GL_TEXTURE_2D);
			glEnable(GL_LIGHTING);
		}

		glPopMatrix();
	}

	if (x > looping) {
		banner_index = (banner_index + 1) % 4;
		ant2 = looping;
	}

	// Drawing of dynamic road
	float road_start = x - 10;
	double derivative = der_func_sin(road_start);
	double vfsinus = func_sin(road_start);
	GLfloat pre[3] = { road_start, 0, (GLfloat) vfsinus };
	GLfloat tz[3] = { (GLfloat) -derivative, 0, 1 };
	GLfloat normal[3] = { (GLfloat) ((1 / sqrt(1 + derivative * derivative)) * tz[0]), 0, (GLfloat) ((1 / sqrt(1 + derivative * derivative)) * tz[2]) };

	for (int i = 0; i < 3; ++i) {
		v0[i] = pre[i] - (normal[i] * road_width);
		v3[i] = pre[i] + (normal[i] * road_width);
	}

	for (int i = 1; i < 100; ++i) {
		float aux = road_start + i;
		vfsinus = func_sin(aux);
		float derivative = (float) der_func_sin(aux);
		GLfloat pre2[3] = { aux, 0, (GLfloat) vfsinus };
		GLfloat tz[3] = { -derivative, 0, 1 };
		GLfloat normal2[3] = { (1 / sqrt(1 + derivative * derivative)) * tz[0] , 0 ,(1 / sqrt(1 + derivative * derivative)) * tz[2] };
		for (int i = 0; i < 3; ++i) {
			v1[i] = pre2[i] - (normal2[i] * road_width);
			v2[i] = pre2[i] + (normal2[i] * road_width);
		}
		glPushMatrix();

		if (wired_mode) {
			glPolygonMode(GL_BACK, GL_LINE);
			glPolygonMode(GL_FRONT, GL_LINE);
		}
		else {
			glPolygonMode(GL_BACK, GL_FILL);
			glPolygonMode(GL_FRONT, GL_FILL);
		}

		// Applying the texture
		glBindTexture(GL_TEXTURE_2D, textures[1]);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

		glColor3f(0, 1, 0);

		// Road equipment
		glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, road_dif);
		glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, road_sp);
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 3);

		quadtex(v2, v1, v0, v3, 0, 1, 0, 1, 50, 50);
		glPopMatrix();

		for (int i = 0; i < 3; ++i) {
			v0[i] = v1[i];
			v3[i] = v2[i];
		}
	}

	// End of road drawing

	// Drawing lampposts and coins
	GLfloat start = ant;
	GLfloat loop = 0;
	for (int i = 0; i < 4; ++i) {
		start += lampposts_distance;

		if (i == 0) {
			loop = start;
		}

		float lamppost_X = start;
		float lamppost_Z = (float) func_sin(lamppost_X);
		GLfloat streetlight_position[] = { lamppost_X, 4, lamppost_Z, 1 };

		glLightfv((GLenum) lampposts[i], GL_POSITION, streetlight_position);

		glPushMatrix();
		glBindTexture(GL_TEXTURE_2D, textures[4]);

		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

		glTranslatef((GLfloat) lamppost_X, (GLfloat) 0.3, (GLfloat) lamppost_Z);

		if (abs(lamppost_X - x) < 0.5 && abs(lamppost_Z - z) < 0.5 && !coin_taken) {
			engine->play2D("./mario-coin.mp3");
			++coins;
			coin_taken = true;
		}

		glColor3f(1, 1, 0);
		glRotatef((GLfloat) (20 * alpha_coins), 0, 1, 0);

		if (wired_mode) {
			glutWireCylinder(0.1, 0.1, 100, 100);
		}
		else {
			glutSolidCylinder(0.15, 0.05, 100, 100);
		}
		glPopMatrix();
	}

	if (x > loop) {
		ant = loop;
	}

	// Desert
	glPushMatrix();
	glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, BLANCO);
	glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, BLANCO);
	glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 4);
	glBindTexture(GL_TEXTURE_2D, textures[2]);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

	glColor3f(1, 1, 0);

	GLfloat p0[3] = { (GLfloat) (100 + x), (GLfloat) -0.1, (GLfloat) (-100 - z) };
	GLfloat p1[3] = { (GLfloat) (100 + x), (GLfloat) -0.1, (GLfloat) (100 - z) };
	GLfloat p2[3] = { (GLfloat) (-100 - x), (GLfloat) -0.1, (GLfloat) (100 + z) };
	GLfloat p3[3] = { (GLfloat) (-100 - x), (GLfloat) -0.1, (GLfloat) (-100 - z) };
	quadtex(p0, p1, p2, p3, 0, 10, 0, 10, 10 * 10, 5 * 10);
	glPopMatrix();
	glLoadIdentity();

	if (!eagle_view) {
		glEnable(GL_LIGHT1);
		if (car_mode)
			ball();
		else {
			glPushMatrix();
			glTranslatef(0, -1, 0);
			kart();
			glPopMatrix();
		}

		if (!large_mode) {
			GLfloat ambient_headlamp[] = { (GLfloat) 0.2, (GLfloat) 0.2, (GLfloat) 0.2, 1 };
			GLfloat fuzzy_headlamp[] = { 1, 1, 1, 1 };
			GLfloat specular_headlamp[] = { (GLfloat) 0.3, (GLfloat) 0.3, (GLfloat) 0.3, 1 };

			glLightfv(GL_LIGHT1, GL_AMBIENT, ambient_headlamp);
			glLightfv(GL_LIGHT1, GL_DIFFUSE, fuzzy_headlamp);
			glLightfv(GL_LIGHT1, GL_SPECULAR, specular_headlamp);
			glLightf(GL_LIGHT1, GL_SPOT_CUTOFF, 25);
			glLightf(GL_LIGHT1, GL_SPOT_EXPONENT, 20);
			GLfloat light_position_1[] = { 0, (GLfloat) 0.7, 0, 1 };
			GLfloat light_direction_1[] = { 0, (GLfloat) -0.5, (GLfloat) -0.7 };
			glLightfv(GL_LIGHT1, GL_POSITION, light_position_1);
			glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, light_direction_1);
		}
		else {
			GLfloat ambient_headlamp[] = { (GLfloat) 0.5, (GLfloat) 0.5, (GLfloat) 0.5, 1 };
			GLfloat fuzzy_headlamp[] = { 1, 1, 1, 1 };
			GLfloat specular_headlamp[] = { (GLfloat) 0.3, (GLfloat) 0.3, (GLfloat) 0.3, 1 };

			glLightfv(GL_LIGHT1, GL_AMBIENT, ambient_headlamp);
			glLightfv(GL_LIGHT1, GL_DIFFUSE, fuzzy_headlamp);
			glLightfv(GL_LIGHT1, GL_SPECULAR, specular_headlamp);
			glLightf(GL_LIGHT1, GL_SPOT_CUTOFF, 25);
			glLightf(GL_LIGHT1, GL_SPOT_EXPONENT, 5);
			GLfloat light_position_1[] = { 0, (GLfloat) 0.7, 0, 1 };
			GLfloat light_direction_1[] = { 0, (GLfloat) -0.4, (GLfloat) -0.7 };
			glLightfv(GL_LIGHT1, GL_POSITION, light_position_1);
			glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, light_direction_1);
		}
		if (wired_mode) {
			glDisable(GL_LIGHTING); // Deactivating lights
			glDisable(GL_TEXTURE_2D); // Deactivating textures
		}
	}
	else {
		glDisable(GL_LIGHT1);
	}

	if (HUD_mode) {
		glDisable(GL_TEXTURE_2D);
		glDisable(GL_LIGHTING);

		glPushMatrix();
		glTranslatef(-0.75, -0.75, -2);
		glScalef((GLfloat) 0.25, (GLfloat) (0.2 * speed), 0);

		if (speed <= 5) {
			glColor3f(0, 1, 0);
		}
		else if (speed <= 10) {
			glColor3f(1, 1, 0);
		}
		else {
			glColor3f(1, 0, 0);
		}

		if (wired_mode) {
			glutWireCube(1);
		}
		else {
			glutSolidCube(1);
		}

		glPopMatrix();
		glPushMatrix();

		glTranslatef((GLfloat) 0.55, (GLfloat) -0.55, -2);
		glColor3f(0, 0, 1);
		glRotatef((GLfloat) (((rotation) * 180 / PI) - 90), 0, 0, 1);

		if (wired_mode) {
			glPushMatrix();
			glTranslatef(0, (GLfloat) 0.15, 0);
			glRotatef(-90, 1, 0, 0);
			glScalef(2, 2, 2);
			glutWireCone(0.03, 0.05, 100, 100);
			glPopMatrix();
			glPushMatrix();
			glRotatef(-90, 1, 0, 0);
			glutWireCylinder(0.01, 0.15, 100, 100);
			glPopMatrix();
		}
		else {
			glPushMatrix();
			glTranslatef(0, (GLfloat) 0.15, 0);
			glRotatef(-90, 1, 0, 0);
			glScalef(2, 2, 2);
			glutSolidCone(0.03, 0.05, 100, 100);
			glPopMatrix();
			glPushMatrix();
			glRotatef(-90, 1, 0, 0);
			glutSolidCylinder(0.01, 0.15, 100, 100);
			glPopMatrix();
		}
		glPopMatrix();

		glEnable(GL_TEXTURE_2D);
		glEnable(GL_LIGHTING);
	}

	// VECTOR DE VISTA DEFINIDO COMO EN LA PRÁCTICA 6 - HECHO
	if (!eagle_view) {
		gluLookAt(x, y, z, 10 * sin(rotation) + x, 1, 10 * cos(rotation) + z, 0, 1, 0); // Placing the camera
	}
	else {
		gluLookAt(x, 100, z, 10 * sin(rotation) + x, 1, 10 * cos(rotation) + z, 0, 1, 0); // Placing the camera
	}

	if (light_mode) {
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
	}
	else {
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	}

	// Moonlight
	GLfloat moon_position[] = { 0, 10, 0, 0 };
	glLightfv(GL_LIGHT0, GL_POSITION, moon_position);

	// Cylinder
	glPushMatrix();

	if (light_mode) {
		glBindTexture(GL_TEXTURE_2D, textures[3]);
	}
	else {
		glBindTexture(GL_TEXTURE_2D, textures[5]);
	}

	double alpha = 2 * PI / 50;
	GLfloat cil0[3] = { (GLfloat) (200 * cos(0) + x), 100, (GLfloat) (200 * -sin(0) + z) };
	GLfloat cil1[3] = { (GLfloat) (200 * cos(0) + x), -55, (GLfloat) (200 * -sin(0) + z) };
	GLfloat cil2[3];
	GLfloat cil3[3];

	for (int i = 1; i <= 50; ++i) {
		cil2[0] = (GLfloat) (200 * cos(i * alpha) + x);
		cil2[1] = 100;
		cil2[2] = (GLfloat) (200 * -sin(i * alpha) + z);
		cil3[0] = (GLfloat) (200 * cos(i * alpha) + x);
		cil3[1] = -55;
		cil3[2] = (GLfloat) (200 * -sin(i * alpha) + z);

		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		glColor3f(0, 0, 1);
		quadtex(cil3, cil1, cil0, cil2, (GLfloat) ((i) / 50 + 0.5), (GLfloat) ((i - 1) / 50 + 0.5), 0, 1);

		for (int j = 0; j < 3; ++j) {
			cil0[j] = cil2[j];
			cil1[j] = cil3[j];
		}
	}

	glPopMatrix();

	glutSwapBuffers();
	glFlush();
}

// VARIACIÓN DE VENTANA - HECHO
void reshape(GLint w, GLint h)
{
	// Whole area as a framework
	glViewport(0, 0, w, h);

	// Aspect ratio
	float aspect_ratio = float (w) / float (h);

	// Projection matrix
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	// CÁMARA PERSPECTIVA DEFINIDA COMO EN LA PRÁCTICA 6 - HECHO
	gluPerspective(45, aspect_ratio, 1, 250);
}

int main(int argc, char** argv)
{
	FreeImage_Initialise();
	glutInit(&argc, argv);

	// Z-BUFFER ACTIVADO - HECHO
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);

	glutInitWindowSize(600, 600);
	glutCreateWindow(PROYECTO);

	init();

	// CALLBACKS
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);

	// Pressed key callback
	glutKeyboardFunc(onKey);

	// Callback of arrows (special keys): up, down, right and left
	glutSpecialFunc(onSpecialKey);
	glutTimerFunc(1000 / 60, onTimer, 1000 / 60);
	glutTimerFunc(1500, updateCoins, 1500);
	glutTimerFunc(1500, updateControl, 1500);

	// Clearing the command window for the sound library
	system("CLS");

	// INDICAR AL USUARIO LOS CONTROLES POR LA VENTANA DE COMANDOS - HECHO
	cout <<
		"Flechas arriba/abajo: Aumentar/disminuir la velocidad " << endl <<
		"Flechas izquierda/derecha: Girar vehiculo " << endl <<
		"A/a: Vista de aguila" << endl <<
		"D/d: Cambiar nivel de dificultad " << endl <<
		"E/e: Alternar vehiculo " << endl <<
		"G/g: Cambiar velocidad de giro " << endl <<
		"H/h: Activar/desactivar HUD " << endl <<
		"L/l: Cambiar tipo de luz (modos diurno/nocturno) " << endl <<
		"N/n: Activar/desactivar niebla " << endl <<
		"S/s: Activar/desactivar modelo simple en alambrico " << endl <<
		"P/p: Guardar captura de pantalla del videojuego " << endl <<
		"W/w: Cambiar de las luces cortas a largas y viceversa " << endl <<
		"Esc: Salir " << endl;

	// Event loop
	glutMainLoop();

	// Unlocking FreeImage
	FreeImage_DeInitialise();

	return 0;
}