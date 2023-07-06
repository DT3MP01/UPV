/*
 * task.h
 *
 *  Created on: May 10, 2023
 *      Author: luialza1
 */

#ifndef __TAREAS_H__
#define __TAREAS_H__
#include "FreeRTOS.h"
#include "semphr.h"
#include <stdio.h>
#include <HW.h>
#include <stdint.h>
#include <stdbool.h>


#define HIGH_PRIORITY (( configMAX_PRIORITIES - 1 )>>1)+1
#define NORMAL_PRIORITY (( configMAX_PRIORITIES - 1 )>>1)
#define LOW_PRIORITY (( configMAX_PRIORITIES - 1 )>>1)-1

void Task_HW( void *pvParameters );
void Task_WIFI( void *pvParameters );
void Task_COMM( void *pvParameters );
void Task_TIME( void *pvParameters );



struct Request {   // Structure declaration
  int status;
  char *dst;
  char *port;
  char *request;
  char *response;
}; // End the structure with a semicolon

static int assigned_ip=0;
static struct Request COMM_req;


#endif
