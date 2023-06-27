#define _USE_MATH_DEFINES
#include <iostream>
#include <sstream>
#include <freeglut.h>
#include <gl/GLU.h>
#include <gl/GL.h>
#include <math.h>
#include <ctime>
#include <cmath>
#include <chrono>
#include <../Utilidades.h>

using namespace std;

constexpr auto title = "Driving videogame";

void light_control();
void texture_loading();

// Camera coordinates
float pos_cam[3] = { 0, 1, 0 };
float ant_pos = pos_cam[0];
int max_vision = 90;

// Properties of the circuit layout
float vector_t[2] = { 1, 0 };
float vector_n[2] = { 0, 1 };

float poster_x = 35;

int Nquads = 50;
int length = 4;
float amplitude = 5;
float period = 150;
float width = 8;

static GLfloat fuzzy_material[3] = { 0.8f, 0.8f, 0.8f };
static GLfloat specular_material[3] = { 0.8f, 0.8f, 0.8f };

// Textures
GLuint floor_texture;
GLuint HUD_texture;
GLuint poster_texture;
GLuint lamppost_texture;
GLuint morning_texture;
GLuint evening_texture;
GLuint night_texture;
GLuint background_texture;
GLuint driving_texture;
GLuint road_texture;
GLuint sphere_texture;

// Car parameters
float angle = 0;
float rotationDegrees = 0;
float direction[3] = { 1, 1, 0 };
float speed = 0;

// Spheres
static float sphere_distance = 15;
static float spheres_start[4] = { sphere_distance, 2 * sphere_distance , 3 * sphere_distance, 4 * sphere_distance };
static double sphere_size = 0.8;
static int points = 0;
static bool counting_points = true;

// Modes
static enum class  Mode { Complete, Wired } mode;
static enum class  Day_time { Morning, Evening, Night } day_time;
static enum class Visibility { High, Low } visibility; // fog
GLfloat morning_fog[] = {1, 1, 1};
GLfloat evening_fog[] = {1, 0.9f, 1};
GLfloat night_fog[] = {1, 0.8f, 1};

// Bird's eye view
bool bird_view = false;

// HUDs
static enum class HUD { Hidden, Complete } HUD;
static GLuint arrow;

float cap_w = 960;
float cap_h = 540;

bool dynamic_rotation = false;
bool improved_interface = false;

// Lights
static float streetlight_spacing = 20;
static float streetlight_start[4] = { streetlight_spacing, 2 * streetlight_spacing , 3 * streetlight_spacing, 4 * streetlight_spacing };
bool car_headlights = false;

void texture_loading() {
	// Backgrounds
	glGenTextures(1, &morning_texture);
	glBindTexture(GL_TEXTURE_2D, morning_texture);
	loadImageFile((char*) "morning.jpg");

	glGenTextures(1, &evening_texture);
	glBindTexture(GL_TEXTURE_2D, evening_texture);
	loadImageFile((char*) "evening.jpg");

	glGenTextures(1, &night_texture);
	glBindTexture(GL_TEXTURE_2D, night_texture);
	loadImageFile((char*) "night.jpg");

	background_texture = morning_texture;

	glGenTextures(1, &road_texture);
	glBindTexture(GL_TEXTURE_2D, road_texture);
	loadImageFile((char*) "road.jpg");

	glGenTextures(1, &floor_texture);
	glBindTexture(GL_TEXTURE_2D, floor_texture);
	loadImageFile((char*) "snow.jpg");

	glGenTextures(1, &sphere_texture);
	glBindTexture(GL_TEXTURE_2D, sphere_texture);
	loadImageFile((char*) "btc.jpg");

	glGenTextures(1, &poster_texture);
	glBindTexture(GL_TEXTURE_2D, poster_texture);
	loadImageFile((char*) "banner-gal.jpg");

	glGenTextures(1, &lamppost_texture);
	glBindTexture(GL_TEXTURE_2D, lamppost_texture);
	loadImageFile((char*) "steel.jpg");

	glGenTextures(1, &HUD_texture);
	glBindTexture(GL_TEXTURE_2D, HUD_texture);
	loadImageFile((char*) "myhud.png");
}

void sand() {
	glPushMatrix();

	int length = 10;
	GLfloat v0[] = { 0, -0.005f, 0 };
	GLfloat v1[] = { 0, -0.005f, 0 };
	GLfloat v2[] = { 0, -0.005f, 0 };
	GLfloat v3[] = { 0, -0.005f, 0 };

	glMaterialfv(GL_FRONT, GL_DIFFUSE, fuzzy_material);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular_material);
	glMaterialf(GL_FRONT, GL_SHININESS, 1);

	glBindTexture(GL_TEXTURE_2D, floor_texture);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

	for (float i = pos_cam[1] + ant_pos - 3; i < pos_cam[0] + Nquads * length; i += length) {
		v0[0] = i;
		v1[0] = i;
		v2[0] = i + (GLfloat) length;
		v3[0] = i + (GLfloat) length;

		for (int j = -40; j < 40; j += length) {
			v0[2] = (GLfloat) j;
			v1[2] = (GLfloat) (j + length);
			v2[2] = (GLfloat) (j + length);
			v3[2] = (GLfloat) j;

			quad(v0, v1, v2, v3, 30, 30);
		}
	}
	glPopMatrix();
}

float tracing_derivative(float u, float amplitude, float period) {
	return (2 * (float) M_PI * amplitude / period) * cos(u * 2 * (float) M_PI / period);
}

float layout(float u, float amplitude, float period) {
	return amplitude * sin((u * 2 * (float) M_PI) / period);
}

void poster() {
	glPushAttrib(GL_CURRENT_BIT);
	glColor3f(1, 1, 1);

	if (poster_x < pos_cam[0]) {
		poster_x += 100;
	}

	float f_x = layout(poster_x, amplitude, period);
	double aux = sqrt(pow(vector_n[0], 2) + pow(vector_n[1], 2));
	vector_t[1] = tracing_derivative(poster_x, amplitude, period);
	vector_n[0] = -vector_t[1];
	vector_n[0] = vector_n[0] / (float) aux;
	vector_n[1] = vector_n[1] / (float) aux;
	float v1[3] = { poster_x, 4.5f, (f_x + (width / 2) + 0.1f) };
	float v2[3] = { poster_x, 4.5f, (f_x - (width / 2) - 0.1f) };
	float v3[3] = { poster_x, 2.5f, (f_x - (width / 2) - 0.1f) };
	float v4[3] = { poster_x, 2.5f, (f_x + (width / 2) + 0.1f) };

	glMaterialfv(GL_FRONT, GL_DIFFUSE, fuzzy_material);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular_material);
	glMaterialf(GL_FRONT, GL_SHININESS, 3);
	glBindTexture(GL_TEXTURE_2D, poster_texture);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

	quadtex(v3, v4, v1, v2, 0, 1, 0, 1, 25, 25);

	f_x = layout(poster_x - 3, amplitude, period);
	vector_t[1] = tracing_derivative(poster_x - 3, amplitude, period);
	vector_n[0] = -vector_t[1];
	aux = sqrt(pow(vector_n[0], 2) + pow(vector_n[1], 2));
	vector_n[0] = vector_n[0] / (float) aux;
	vector_n[1] = vector_n[1] / (float) aux;
	f_x = layout(poster_x + 0.1f, amplitude, period);

	// Right poster
	float v12[3] = { poster_x + 0.1f, 4.5, f_x + (width / 2) };
	float v22[3] = { poster_x + 0.1f, 4.5, f_x + (width / 2) + 0.5f };
	float v32[3] = { poster_x + 0.1f, 0, f_x + (width / 2) + 0.5f };
	float v42[3] = { poster_x + 0.1f, 0, f_x + (width / 2) };

	glMaterialfv(GL_FRONT, GL_DIFFUSE, fuzzy_material);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular_material);
	glMaterialf(GL_FRONT, GL_SHININESS, 3);
	glBindTexture(GL_TEXTURE_2D, lamppost_texture);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

	quadtex(v42, v32, v22, v12, 0, 1, 0, 1);

	// Left poster
	float v13[3] = { poster_x + 0.1f, 4.5f, f_x - (width / 2) };
	float v23[3] = { poster_x + 0.1f, 4.5f, f_x - (width / 2) - 0.5f };
	float v33[3] = { poster_x + 0.1f, 0, f_x - (width / 2) - 0.5f };
	float v43[3] = { poster_x + 0.1f, 0, f_x - (width / 2) };

	glMaterialfv(GL_FRONT, GL_DIFFUSE, fuzzy_material);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular_material);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
	glMaterialf(GL_FRONT, GL_SHININESS, 3);
	glBindTexture(GL_TEXTURE_2D, lamppost_texture);

	quadtex(v13, v23, v33, v43, 0, 1, 0, 1);
	glPopAttrib();
}

void circuit() {
	glPushAttrib(GL_CURRENT_BIT);
	glColor3f(1, 1, 1);
	glPushMatrix();

	glMaterialfv(GL_FRONT, GL_DIFFUSE, fuzzy_material);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular_material);
	glMaterialf(GL_FRONT, GL_SHININESS, 3);

	glBindTexture(GL_TEXTURE_2D, road_texture);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

	float f_x;
	float aux;
	float v0[3] = { 0, 0, 0 };
	float v1[3] = { 0, 0, 0 };
	float v2[3] = { 0, 0, 0 };
	float v3[3] = { 0, 0, 0 };
	int cont = 0;

	for (float i = pos_cam[1] + ant_pos - 1; i < pos_cam[0] + Nquads * length; i += length) {
		++cont;
		glPushMatrix();
		f_x = layout(i, amplitude, period);
		vector_t[1] = tracing_derivative(i, amplitude, period);
		vector_n[0] = -vector_t[1];
		aux = (float) (sqrt(pow(vector_n[0], 2) + pow(vector_n[1], 2)));
		vector_n[0] = vector_n[0] / aux;
		vector_n[1] = vector_n[1] / aux;
		v2[0] = { i - vector_n[0] * (width / 2) };
		v2[2] = { f_x - vector_n[1] * (width / 2) };

		v3[0] = { i + vector_n[0] * (width / 2) };
		v3[2] = { f_x + vector_n[1] * (width / 2) };

		f_x = layout(i + length, amplitude, period);
		vector_t[1] = tracing_derivative(i + length, amplitude, period);
		vector_n[0] = -vector_t[1];
		aux = (float) (sqrt(pow(vector_n[0], 2) + pow(vector_n[1], 2)));
		vector_n[0] = vector_n[0] / aux;
		vector_n[1] = vector_n[1] / aux;

		v0[0] = { i + length + vector_n[0] * (width / 2) };
		v0[2] = { f_x + vector_n[1] * (width / 2) };

		v1[0] = { i + length - vector_n[0] * (width / 2) };
		v1[2] = { f_x - vector_n[1] * (width / 2) };

		quad(v0, v1, v2, v3, 30, 30);
		glPopMatrix();
	}

	glPopAttrib();
	glPopMatrix();
}


void countingPoints(int seg) {
	counting_points = true;
}

void posters() {
	int lights[4] = { GL_LIGHT2, GL_LIGHT3, GL_LIGHT4, GL_LIGHT5 };
	float f_x;
	double aux = 0;
	GLfloat focus_direction[] = { 0, -1, 0 };

	for (int i = 0; i < 4; ++i) {
		f_x = layout(streetlight_start[i], amplitude, period);
		vector_t[1] = tracing_derivative(streetlight_start[i], amplitude, period);
		vector_n[0] = -vector_t[1];
		aux = sqrt(pow(vector_n[0], 2) + pow(vector_n[1], 2));
		vector_n[0] = vector_n[0] / (float) aux;
		vector_n[1] = vector_n[1] / (float) aux;
		GLfloat pos[] = { streetlight_start[i], 4, f_x + vector_n[1] * (width / 2) - (width / 2), 1 };

		if (pos_cam[0] > streetlight_start[i] + 4) {
			streetlight_start[i] += 4 * streetlight_spacing;
		}

		glPushMatrix();
		glLightfv(lights[i], GL_POSITION, pos);
		glLightfv(lights[i], GL_SPOT_DIRECTION, focus_direction);
		glPopMatrix();
	}
}

void gen_spheres() {
	float f_x;
	double aux;

	for (int i = 0; i < 4; ++i) {
		f_x = layout(spheres_start[i], amplitude, period);
		aux = sqrt(pow(vector_n[0], 2) + pow(vector_n[1], 2));

		vector_t[1] = tracing_derivative(spheres_start[i], amplitude, period);
		vector_n[0] = -vector_t[1];
		vector_n[0] = vector_n[0] / (float) aux;
		vector_n[1] = vector_n[1] / (float) aux;


		if (pos_cam[0] > spheres_start[i] + 4) {
			spheres_start[i] += 4 * sphere_distance;
		}

		GLfloat pos[] = { spheres_start[i], 1, f_x + vector_n[1] * (width / 2) - (width / 2) };
		float distance = sqrt((pos_cam[0] - pos[0]) * (pos_cam[0] - pos[0]) + (pos_cam[2] - pos[2]) * (pos_cam[2] - pos[2]));

		if (distance <= sphere_size * 1.5 && counting_points) {
			counting_points = false;
			++points;
			glutTimerFunc(300, countingPoints, 300);
		}

		glPushMatrix();
		GLUquadric* quad;
		quad = gluNewQuadric();
		glBindTexture(GL_TEXTURE_2D, sphere_texture);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 10);
		gluQuadricTexture(quad, 1);
		glTranslatef(pos[0], pos[1], pos[2]);
		gluSphere(quad, sphere_size / 1.5, 20, 20);
		glPopMatrix();
	}
}

void load_background() {
	float x = 0;
	float z = 0;
	float section = 0;
	float radius = 90;
	double previous_x = radius * sin(rad(0)) + pos_cam[0];
	double previous_z = radius * cos(rad(0)) + pos_cam[2];
	float step = 0.1f;

	glDisable(GL_LIGHTING);
	glMaterialfv(GL_FRONT, GL_DIFFUSE, fuzzy_material);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular_material);
	glMaterialf(GL_FRONT, GL_SHININESS, 3);
	glBindTexture(GL_TEXTURE_2D, background_texture);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
	glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

	for (int i = 18; i <= 360; i += 18) {
		x = radius * (float) sin(rad(i)) + pos_cam[0];
		z = radius * (float) cos(rad(i)) + pos_cam[2];
		float v0[3] = { (float) previous_x, 55, (float) previous_z };
		float v1[3] = { x, 55, z };
		float v2[3] = { x, -40, z };
		float v3[3] = { (float) previous_x, -40, (float) previous_z };

		quadtex(v3, v2, v1, v0, section, section + step, 0, 1, 50, 50);
		previous_x = x;
		previous_z = z;
		section += step;
	}

	glEnable(GL_LIGHTING);
}

void headlamp_control() {
	glPushMatrix();
	GLfloat direction[] = { 0.2f, -0.8f, -1.8f };

	if (car_headlights) {
		glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, direction);
	}
	else {
		GLfloat direction[] = { 0.2f, -0.8f, -1.2f };
		glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, direction);
	}
	glPopMatrix();
}

void visibility_control() {
	switch (visibility) {
		case Visibility::High:
			glDisable(GL_FOG);
			break;
		case Visibility::Low:
			glEnable(GL_FOG);
			switch (day_time) {
			case Day_time::Morning:
				glFogfv(GL_FOG_COLOR, morning_fog);
				break;
			case Day_time::Evening:
				glFogfv(GL_FOG_COLOR, evening_fog);
				break;
			case Day_time::Night:
				glFogfv(GL_FOG_COLOR, night_fog);
				break;
			}
			glFogf(GL_FOG_DENSITY, 0.1f);
			break;
		default:
			break;
	}
}

void day_time_control() {
	load_background();

	switch (day_time) {
		case Day_time::Morning:
			glDisable(GL_LIGHTING);
			background_texture = morning_texture;
			break;
		case Day_time::Evening:
			posters();
			glEnable(GL_LIGHTING);
			glDisable(GL_LIGHT0);
			glEnable(GL_LIGHT1);
			glEnable(GL_LIGHT2);
			glEnable(GL_LIGHT3);
			glEnable(GL_LIGHT4);
			glEnable(GL_LIGHT5);
			glEnable(GL_LIGHT6);
			background_texture = evening_texture;
			break;
		case Day_time::Night:
			posters();
			glEnable(GL_LIGHTING);
			glEnable(GL_LIGHT0);
			glEnable(GL_LIGHT1);
			glEnable(GL_LIGHT2);
			glEnable(GL_LIGHT3);
			glEnable(GL_LIGHT4);
			glEnable(GL_LIGHT5);
			glDisable(GL_LIGHT6);
			background_texture = night_texture;
			break;
		default:
			break;
	}
}

void light_control() {
	// LIGHT 0: Moon
	float fuzzy0[] = { 0.05f, 0.05f, 0.1f, 1 };
	float specular0[] = { 0, 0, 0, 1 };
	float ambiental0[] = { 0.2f, 0.29f, 0.68f, 1 };
	float position0[4] = { 0, 10, 0, 0 };
	glLightfv(GL_LIGHT0, GL_DIFFUSE, fuzzy0);
	glLightfv(GL_LIGHT0, GL_SPECULAR, specular0);
	glLightfv(GL_LIGHT0, GL_AMBIENT, ambiental0);
	glLightfv(GL_LIGHT0, GL_POSITION, position0);

	// LIGHT 1: Focal
	float fuzzy1[] = { 1, 1, 1 };
	float specular1[] = { 0.3f, 0.3f, 0.3f };
	float ambiental1[] = { 0.2f, 0.2f, 0.2f };
	GLfloat position1[] = { -0.3f, 0.7f, 0, 1 };
	GLfloat direction1[] = { 0, -0.4f, -0.8f };
	glLightfv(GL_LIGHT1, GL_AMBIENT, ambiental1);
	glLightfv(GL_LIGHT1, GL_DIFFUSE, fuzzy1);
	glLightfv(GL_LIGHT1, GL_SPECULAR, specular1);
	glLightf(GL_LIGHT1, GL_SPOT_CUTOFF, 25);
	glLightf(GL_LIGHT1, GL_SPOT_EXPONENT, 5);
	glLightfv(GL_LIGHT1, GL_POSITION, position1);
	glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION, direction1);

	// LIGHTS 2-5: Streetlamps
	float fuzzyF[] = { 0, 1, 0 };
	float specularF[] = { 0, 0, 0 };
	float ambientalF[] = { 0, 0, 0 };
	glLightfv(GL_LIGHT2, GL_DIFFUSE, fuzzyF);
	glLightfv(GL_LIGHT2, GL_SPECULAR, specularF);
	glLightfv(GL_LIGHT2, GL_AMBIENT, ambientalF);
	glLightf(GL_LIGHT2, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT2, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT3, GL_DIFFUSE, fuzzyF);
	glLightfv(GL_LIGHT3, GL_SPECULAR, specularF);
	glLightfv(GL_LIGHT3, GL_AMBIENT, ambientalF);
	glLightf(GL_LIGHT3, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT3, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT4, GL_DIFFUSE, fuzzyF);
	glLightfv(GL_LIGHT4, GL_SPECULAR, specularF);
	glLightfv(GL_LIGHT4, GL_AMBIENT, ambientalF);
	glLightf(GL_LIGHT4, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT4, GL_SPOT_EXPONENT, 10);

	glLightfv(GL_LIGHT5, GL_DIFFUSE, fuzzyF);
	glLightfv(GL_LIGHT5, GL_SPECULAR, specularF);
	glLightfv(GL_LIGHT5, GL_AMBIENT, ambientalF);
	glLightf(GL_LIGHT5, GL_SPOT_CUTOFF, 45);
	glLightf(GL_LIGHT5, GL_SPOT_EXPONENT, 10);

	// LIGHT 6: Evening 
	float fuzzy6[] = { 0.05f, 0.05f, 0.1f, 1 };
	float specular6[] = { 0.05f, 0.05f, 0.1f, 1 };
	float ambiental6[] = { 1, 0.64f, 0.43f, 1 };
	float position6[4] = { 0, 7, 0, 0 };
	glLightfv(GL_LIGHT6, GL_DIFFUSE, fuzzy6);
	glLightfv(GL_LIGHT6, GL_SPECULAR, specular6);
	glLightfv(GL_LIGHT6, GL_AMBIENT, ambiental6);
	glLightfv(GL_LIGHT6, GL_POSITION, position6);
}

void mode_control()
{
	switch (mode) {
	case Mode::Complete:
		glEnable(GL_TEXTURE_2D);
		glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
		glColor3f(1, 1, 1);
		break;
	case Mode::Wired:
		glDisable(GL_TEXTURE_2D);
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
		glColor3f(0, 0, 0);
		break;
	default:
		break;
	}
}

void HUD_control() {
	if (improved_interface) {
		glPushMatrix();
		glPushAttrib(GL_DEPTH_BUFFER_BIT | GL_ENABLE_BIT | GL_CURRENT_BIT);
		glDisable(GL_LIGHTING);
		glDisable(GL_DEPTH_TEST);
		glDisable(GL_TEXTURE_2D);

		texto(700, (unsigned int) (cap_h * 0.9), (char*) "Velocidad: ", BLANCO, GLUT_BITMAP_TIMES_ROMAN_24, false);
		stringstream aux;
		aux << speed << " m/s";
		texto(850, (unsigned int) (cap_h * 0.9), (char*) aux.str().c_str(), AZUL, GLUT_BITMAP_TIMES_ROMAN_24, false);

		texto(700, (unsigned int) (cap_h * 0.95), (char*) "Puntos: ", BLANCO, GLUT_BITMAP_TIMES_ROMAN_24, false);
		stringstream aux1;
		aux1 << points << " ";
		texto(850, (unsigned int) (cap_h * 0.95), (char*) aux1.str().c_str(), AZUL, GLUT_BITMAP_TIMES_ROMAN_24, false);

		glPushMatrix();
		glLoadIdentity();
		glMatrixMode(GL_PROJECTION);
		glPushMatrix();
		glLoadIdentity();
		glOrtho(-1, 1, -1, 1, -1, 1);
		glMatrixMode(GL_MODELVIEW);
		gluLookAt(0, 0, 0, 0, 0, -1, 0, 1, 0);

		// Bars
		glEnable(GL_BLEND);

		// Speed
		glColor4f(0.3f, 0.4f, 0, 0.7f);
		glBegin(GL_POLYGON);
		glVertex2f(-1, -1);
		glVertex2f(-1.0, -0.95f);
		glVertex2f(-0.8f + (speed / 60), -0.95f + (speed / 60));
		glVertex2f(-0.8f + (speed / 60), -1);
		glEnd();

		// Rotation
		glColor4f(0, 0, 1, 0.7f);

		glPushMatrix();
		glScalef(2, 2, 1);
		glTranslatef(0.3f, -0.4f, 0);
		glRotated((double) -direction[2] * 90, 0, 0, 1);

		glCallList(arrow);
		glPopMatrix();

		glDisable(GL_BLEND);

		glMatrixMode(GL_PROJECTION);
		glPopMatrix();
		glMatrixMode(GL_MODELVIEW);
		glPopMatrix();

		glPopAttrib();
		glPopMatrix();
	}
}

void car_HUD_control() {
	float v0[3] = { -1, -1, 0 };
	float v1[3] = { 1, -1, 0 };
	float v2[3] = { 1, 1.1f, 0 };
	float v3[3] = { -1, 1.1f, 0 };

	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	glEnable(GL_BLEND);

	switch (HUD) {
	case HUD::Hidden:
		break;
	case HUD::Complete:
		glPushMatrix();
		glLoadIdentity();
		glMatrixMode(GL_PROJECTION);
		glPushMatrix();
		glLoadIdentity();
		glOrtho(-1, 1, -1, 1, -1, 1);
		glMatrixMode(GL_MODELVIEW);
		gluLookAt(0, 0, 0, 0, 0, -1, 0, 1, 0);

		glBindTexture(GL_TEXTURE_2D, HUD_texture);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);

		quadtex(v0, v1, v2, v3);

		glMatrixMode(GL_PROJECTION);
		glPopMatrix();
		glMatrixMode(GL_MODELVIEW);
		glPopMatrix();
		break;
	}

	glDisable(GL_BLEND);
}

void camera_control() {
	if (bird_view) {
		gluLookAt(pos_cam[0], 20, static_cast<double>(pos_cam[2]) - 1,
			static_cast<double>(direction[0]) + pos_cam[0], 1, static_cast<double>(direction[2]) + pos_cam[2],
			0, 1, 0);

		ejes();
	}
	else {
		gluLookAt(pos_cam[0], pos_cam[1], pos_cam[2],
			static_cast<double>(direction[0]) + pos_cam[0], 1, static_cast<double>(direction[2]) + pos_cam[2],
			0, 1, 0);
	}
}

void display()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	mode_control();

	headlamp_control();

	camera_control();

	day_time_control();

	visibility_control();

	// Progress control
	if (pos_cam[0] >= ant_pos + length) {
		ant_pos = pos_cam[0];
	}

	// Floor generation
	sand();

	// Circuit generation
	circuit();

	// Posters generation
	poster();

	// Spheres generation
	gen_spheres();

	// Car HUD
	glPushAttrib(GL_CURRENT_BIT);
	glColor3f(1, 1, 1);
	car_HUD_control();
	glPopAttrib();

	// Advanced interface
	HUD_control();

	glutSwapBuffers();
}


void onKey(unsigned char key, int x, int y) {
	switch (key)
	{
	case 'a':
	case 'A':
		if (mode == Mode::Complete) {
			mode = Mode::Wired;
		}
		else {
			mode = Mode::Complete;
		}
		break;
	case 'l':
	case 'L':
		if (day_time == Day_time::Morning) {
			day_time = Day_time::Evening;
		}
		else if (day_time == Day_time::Evening) {
			day_time = Day_time::Night;
		}
		else {
			day_time = Day_time::Morning;
		}
		break;
	case 'n':
	case 'N':
		if (visibility == Visibility::High) {
			visibility = Visibility::Low;
		}
		else {
			visibility = Visibility::High;
		}
		break;
	case 'h':
	case 'H':
		switch (HUD) {
		case HUD::Hidden:
			HUD = HUD::Complete;
			break;
		case HUD::Complete:
			HUD = HUD::Hidden;
			break;
		}
		break;
	case 'd':
	case 'D':
		bird_view = !bird_view;
		break;
	case 'g':
	case 'G':
		dynamic_rotation = !dynamic_rotation;
		break;
	case 'c':
	case 'C':
		improved_interface = !improved_interface;
		break;
	case 'u':
	case 'U':
		car_headlights = !car_headlights;
		break;
	default:
		break;
	}
}

void onSpecialKey(int specialKey, int x, int y)
{
	switch (specialKey) {
		case GLUT_KEY_UP:
			speed += 0.1f;
			break;
		case GLUT_KEY_DOWN:
			if (speed > 0) {
				speed -= 0.1f;
			}
			break;
		case GLUT_KEY_LEFT:
			if (dynamic_rotation) {
				direction[2] -= (float) rad(0.05 * speed);
			}
			else {
				direction[2] -= (float) rad(0.1);
			}
			break;
		case GLUT_KEY_RIGHT:
			if (dynamic_rotation) {
				direction[2] += (float) rad(0.05 * speed);
			}
			else {
				direction[2] += (float) rad(0.1);
			}
			break;
		default:
			break;
		}

		glutPostRedisplay();
}

void onTimer(int valor)
{
	// Soluciona error con valores negativos de velocidad
	if (speed <= 0) {
		speed = 0;
	}

	// Actualizar posición camara
	static double before = 0;
	double now = glutGet(GLUT_ELAPSED_TIME);
	double elapsed_time = (now - before) / 1000;

	pos_cam[0] += (float) (speed * direction[0] * elapsed_time);
	pos_cam[2] += (float) (speed * direction[2] * elapsed_time);


	stringstream titulo;
	titulo << "Velocidad: " << speed << "m/s" << "  Puntos: " << points << " obtenidos";
	glutSetWindowTitle(titulo.str().c_str());

	before = now;

	glutTimerFunc(1000 / 60, onTimer, 60);
	glutPostRedisplay();
}

void reshape(int w, int h)
{
	cap_w = (float) w;
	cap_h = (float) h;
	glViewport(0, 0, (GLsizei) w, (GLsizei) h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	float aspect_ratio = (float) w / h;
	gluPerspective(45, aspect_ratio, 1, max_vision);
}

void init()
{
	glClearColor(1, 1, 1, 1);
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_NORMALIZE);

	texture_loading();
	light_control();

	// HUD
	arrow = glGenLists(2);
	glNewList(arrow, GL_COMPILE);
	glPolygonMode(GL_FRONT, GL_FILL);
	glLineWidth(1.0);
	glBegin(GL_POLYGON);
	glVertex2f(-0.02f, 0.09f);
	glVertex2f(-0.02f, 0);
	glVertex2f(0.02f, 0);
	glVertex2f(0.02f, 0.09f);
	glVertex2f(0.04f, 0.09f);
	glVertex2f(0, 0.12f);
	glVertex2f(-0.04f, 0.09f);
	glEnd();
	glEndList();

	cout << "Flecha izquierda/derecha: cambiar giro del vehiculo" << endl;
	cout << "Flecha arriba/abajo: aumentar/disminuir velocidad" << endl;
	cout << "N/n: Activar/desactivar niebla" << endl;
	cout << "D/d: Alternar entre la camara normal y la camara con vista de pajaro" << endl;
	cout << "C/c: Cambiar visibilidad de elementos solidarios a la camara -HUD- (on/off)" << endl;
	cout << "H/h: Activar/desactivar visibilidad del HUD coche" << endl;
	cout << "A/a: Activar/desactivar modo alambrico" << endl;
	cout << "L/l: Cambiar entre modo amanecer/tarde/anochecer" << endl;
	cout << "U/u: Alternar entre luces largas y cortas" << endl;
	cout << "G/g: Activar/desactivar modo de giro segun la velocidad" << endl;
}

int main(int argc, char** argv)
{
	FreeImage_Initialise();
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize((int) cap_w, (int) cap_h);
	glutCreateWindow(NULL);
	cout << "Driving videogame" << endl;
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutSpecialFunc(onSpecialKey);
	glutKeyboardFunc(onKey);
	glutTimerFunc(1000 / 60, onTimer, 60);
	init();
	glutMainLoop();
	FreeImage_DeInitialise();
}