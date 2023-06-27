#define PROYECTO "Reloj 3D" // NOMBRE DEL PROYECTO - Requisito 1

#define _USE_MATH_DEFINES 

#include <iostream>
#include <sstream>
#include <cmath>
#include <ctime>
#include "freeglut.h"

using namespace std;

static GLuint star;
static GLuint figure;
static GLuint timeCircle;
static GLuint minuteCircle;
static GLuint centre;
static GLuint hours;
static GLuint minuteTimer;
static GLuint secondTimer;
static GLuint hourStamp;
static GLuint minuteStamp;

// Perspective camera positions
static float x = 0;
static float y = 0;
static float z = 7;
static float radio = 1;

// Colours for the figure in the centre of the clock
double red = 0;
double green = 0;
double blue = 0;

// Rotation angles
double alpha = 0;
double hoursAlpha;
double minutesAlpha;
double secondsAlpha;

void init()
{
	glClearColor(1, 1, 1, 1); // COLOR DE FONDO - Requisito 4
	glEnable(GL_DEPTH_TEST); // Z-BUFFER ACTIVADO - Requisito 8

	// David's star
	star = glGenLists(1); 
	glNewList(star, GL_COMPILE); 
	glPushAttrib(GL_CURRENT_BIT);

	glPushMatrix(); 
	glBegin(GL_TRIANGLE_STRIP);
	glVertex3f((GLfloat) (1 * cos(0 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(0 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(0 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(0 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (1 * cos(2 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(2 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(2 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(2 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (1 * cos(4 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(4 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(4 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(4 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (1 * cos(0 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(0 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(0 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(0 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glEnd();

	glBegin(GL_TRIANGLE_STRIP);
	glVertex3f((GLfloat) (1 * cos(1 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(1 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(1 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(1 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (1 * cos(3 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(3 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(3 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(3 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (1 * cos(5 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(5 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(5 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(5 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (1 * cos(1 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (1 * sin(1 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glVertex3f((GLfloat) (0.7 * cos(1 * (2 * M_PI / 6) + (M_PI / 2))), (GLfloat) (0.7 * sin(1 * (2 * M_PI / 6) + (M_PI / 2))), 0);
	glEnd();

	glPopMatrix();
	glPopAttrib();
	glEndList(); 

	// Practice 4 figure
	figure = glGenLists(1); 
	glNewList(figure, GL_COMPILE); 
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix();

	for (int i = 0; i < 6; ++i) {
		glRotatef(30, 0, 1, 0);
		glCallList(star);
	}

	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Centre with figure and sphere
	centre = glGenLists(1); 
	glNewList(centre, GL_COMPILE); 
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix(); 
	glRotatef(45, 0, 0, 1);
	glScalef((GLfloat) 0.2, (GLfloat) 0.2, (GLfloat) 0.2);
	glCallList(figure);
	glutWireSphere(1, 20, 20);
	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Hour hand: a cylinder with a cone at the tip
	hours = glGenLists(1);
	glNewList(hours, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix();
	glColor3f((GLfloat) 0.2, 1, 1); // Colour: light blue
	glTranslatef(0, (GLfloat) 0.4, 0); // 0.4 cone translation on the Y-axis
	glRotatef(270, 1, 0, 0); // 270º rotation on the X-axis
	glutSolidCone(0.05, 0.15, 100, 100); // Rendering a solid cone with base of radius 0.05 and height of radius 0.15
	glPopMatrix();
	glPushMatrix();
	glColor3f((GLfloat) 0.2, 1, 1); // Colour: light blue
	glTranslatef(0, (GLfloat) 0.3, 0);
	glRotatef(270, 1, 0, 0);
	glutSolidCylinder(0.02, 0.15, 100, 100); // Rendering a solid cylinder with base of radius 0.02 and height of radius 0.15
	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Minute hand: a cylinder with a cone at the tip larger than the previous one
	minuteTimer = glGenLists(1);
	glNewList(minuteTimer, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix();
	glColor3f((GLfloat) 0.3, (GLfloat) 0.3, 1); // Colour: dark blue
	glTranslatef(0, 0.5, 0);
	glRotatef(270, 1, 0, 0);
	glutSolidCone(0.05, 0.30, 100, 100);
	glPopMatrix();
	glPushMatrix();
	glColor3f((GLfloat) 0.3, (GLfloat) 0.3, 1); // Colour: dark blue
	glTranslatef(0.0, (GLfloat) 0.3, 0.0);
	glRotatef(270, 1, 0, 0);
	glutSolidCylinder(0.02, 0.3, 100, 100);
	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Second hand: a cylinder with a narrower cone at the tip than the previous ones
	secondTimer = glGenLists(1);
	glNewList(secondTimer, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix();
	glColor3f(1, (GLfloat) 0.2, (GLfloat) 0.3); // Colour: light red
	glTranslatef(0, (GLfloat) 0.85, 0);
	glRotatef(-90, 1, 0, 0);
	glutSolidCone(0.01, 0.05, 100, 100);
	glPopMatrix();
	glPushMatrix();
	glColor3f(1, (GLfloat) 0.2, (GLfloat) 0.3); // Colour: light red
	glRotatef(-90, 1, 0, 0);
	glutSolidCylinder(0.01, 0.85, 100, 100);
	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Creation of the timestamps
	hourStamp = glGenLists(1);
	glNewList(hourStamp, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix();
	glTranslatef(0, (GLfloat) 0.85, 0);
	glRotatef(270, 1, 0, 0);
	glutSolidCone(0.01, 0.1, 100, 100);
	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Creating circumference with the 12 hours of the clock, being "3, 6, 9, 12" black, while the others grey
	timeCircle = glGenLists(1);
	glNewList(timeCircle, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);

	for (float i = 0; i < 12; ++i) {
		float angle = i * 360 / 12;

		glPushMatrix();
		if (i == 0 || i == 3 || i == 6 || i == 9) {
			glColor3f(0, 0, 0); // Colour: black
		} else {
			glColor3f(0.75, 0.75, 0.75); // Colour: grey
		}

		glRotatef(angle, 0, 0, 1); // Circumferential distribution
		if (i == 0 || i == 3 || i == 6 || i == 9) {
			glScalef(5, 1, 5);
		} else {
			glScalef(2.5, 1, 2.5);
		}
		glCallList(hourStamp);
		glPopMatrix();
	}

	glPopAttrib();
	glEndList();

	// Creating minute stamps
	minuteStamp = glGenLists(1);
	glNewList(minuteStamp, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);
	glPushMatrix();
	glColor3f((GLfloat) 0.8, (GLfloat) 0.8, (GLfloat) 0.8);
	glTranslatef(0, (GLfloat) 0.9, 0);
	glRotatef(90, 1, 0, 0); // Cone orientation
	glutSolidCone(0.01, 0.1, 100, 100);
	glPopMatrix();
	glPopAttrib();
	glEndList();

	// Creating the circumference with the 60 minutes of the clock
	minuteCircle = glGenLists(1);
	glNewList(minuteCircle, GL_COMPILE);
	glPushAttrib(GL_CURRENT_BIT);
	for (int i = 0; i < 60; ++i) {
		float angle = (float) i * 360 / 60;
		if (i % 5 != 0) { // Not for the marks which coincide with the hours
			glPushMatrix();
			glRotatef(angle, 0, 0, 1); // Circumferential distribution
			glCallList(minuteStamp);
			glPopMatrix();
		}
	}
	glPopAttrib();
	glEndList();
}

void display()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // Cleaning the display
	glMatrixMode(GL_MODELVIEW); // Specifying the display matrix
	glLoadIdentity();

	// CÁMARA PERSPECTIVA, PUNTA DE VISTA SITUADO FUERA DE LA ESFEREA UNIDAD MIRANDO AL ORIGEN y CÁMARA VERTICAL EN EL EJE Y - Requisito 3
	gluLookAt(x, y, z, 0, 0, 0, 0, 1, 0);

	// UN OBJETO DEBE MOVERSE CONTINUAMENTE - Requisito 7a
	glPushMatrix();
	glColor3f((GLfloat) red, (GLfloat) green, (GLfloat) blue);
	glRotatef((GLfloat) alpha, 1, 1, 1);
	glCallList(centre);
	glPopMatrix();

	// UN OBJETO DEBE CAMBIAR CADA SEGUNDO - Requisito 7b
	glPushMatrix();
	glRotatef((GLfloat) -secondsAlpha, 0, 0, 1);
	glCallList(secondTimer);
	glPopMatrix();

	// UN OBJETO DEBE CAMBIAR CADA MINUTO - Requisito 7c
	glPushMatrix();
	glRotatef((GLfloat) -minutesAlpha, 0, 0, 1);
	glCallList(minuteTimer);
	glPopMatrix();

	// UN OBJETO DEBE CAMBIAR CADA HORA - Requisito 7d
	glPushMatrix();
	glRotatef((GLfloat) -hoursAlpha, 0, 0, 1);
	glCallList(hours);
	glPopMatrix();

	// UN OBJETO DEBE MOVERSE CONTINUAMENTE - Requisito 7a
	glPushMatrix();
	glRotatef((GLfloat) alpha, 1, 1, 0);
	glCallList(timeCircle);
	glPopMatrix();

	// UN OBJETO DEBE MOVERSE CONTINUAMENTE - Requisito 7a
	glPushMatrix();
	glRotatef((GLfloat) alpha, -1, 1, 0);
	glCallList(minuteCircle);
	glPopMatrix();

	// SE DEBE USAR DOBLE BUFFER - Requisito 10
	glutSwapBuffers(); 

	// Altering the colours of the figure in the centre
	red += 0.05; 
	if (red > 1) {
		red = 0;
	}

	green += 0.1; 
	if (green > 1) {
		green = 0;
	}

	blue += 0.15; 
	if (blue > 1) {
		blue = 0;
	}

	// Checking with the sphere unit if everything stays in - Requisite 5
	/*
	glPushMatrix();
	glColor3f(0.36, 0.25, 0.20);
	glRotatef(45, 1, 1, 0);
	glutWireSphere(1, 100, 100);
	glPopMatrix();
	*/
}

void reshape(GLint width, GLint height)
{
	glViewport(0, 0, width, height);
	float aspectRatio = (float) width / (float) height;

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	float distance = sqrt(x*x + y*y + z*z);
	float angle = (float) ((asin(1 / distance) * 2.0) * 180 / M_PI);

	gluPerspective(angle, aspectRatio, 1, 10); // LA ESFERA UNIDAD TIENE QUE TOCAR LOS LÍMITES SUPERIOR E INFERIOR - Requisito 6
}

void update() 
{
	static const double speed = 0.1;

	// ANIMACIÓN TEMPORALMENTE COHERENTE - Requisito 9

	struct tm newtime;
	time_t now = time(0);
	localtime_s(&newtime, &now);
	tm *time = &newtime;

	static int previousTime = glutGet(GLUT_ELAPSED_TIME);
	int actualTime = glutGet(GLUT_ELAPSED_TIME);
	double timeElapsed = (float) (((double) actualTime - (double) previousTime) / 1000);
	previousTime = actualTime;

	alpha += speed * (double) 360 * timeElapsed;
	secondsAlpha = 360 / 60.0 * time->tm_sec;
	minutesAlpha = 360 / 60.0 * time->tm_min;
	hoursAlpha = 360 / 12.0 * (time->tm_hour % 12);

	glutPostRedisplay();
}

void onTimer(int time) 
{
	glutTimerFunc(time, onTimer, time);
	update();
}

int main(int argc, char **argv)
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(600, 600); // CUALQUIER TIPO DE DIMESIONES DE DIBUJO - Requisito 2

	glutCreateWindow(PROYECTO);
	init();
	cout << PROYECTO << " running" << endl;

	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutTimerFunc(1000 / 60, onTimer, 1000 / 60); // 60 FPS

	glutMainLoop();
	return 0;
}