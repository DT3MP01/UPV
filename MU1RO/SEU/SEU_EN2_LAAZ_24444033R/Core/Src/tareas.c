/*
 * task.c
 *
 *  Created on: May 10, 2023
 *      Author: luialza1
 */
#include "FreeRTOS.h"
#include "tareas.h"

/*#include "semphr.h"
#include <stdio.h>
#include <HW.h>
#include <stdint.h>
#include <stdbool.h> */



 static SemaphoreHandle_t COMM_xSem = NULL;



void CONFIGURACION_INICIAL(void){
 BaseType_t res_task;
 COMM_xSem = xSemaphoreCreateMutex();

 if( COMM_xSem == NULL ){
			printf("PANIC: Error al crear el Semáforo ORION \r\n");
			fflush(NULL);
			while(1);
		}

 res_task=xTaskCreate(Task_HW,"HW",1024,NULL,	 NORMAL_PRIORITY,NULL);
 		if( res_task != pdPASS ){
 				printf("PANIC: Error al crear Tarea HW\r\n");
 				fflush(NULL);
 				while(1);
 		}

 res_task=xTaskCreate(Task_WIFI,"WIFI",1024,NULL,	 NORMAL_PRIORITY ,NULL);
 			if( res_task != pdPASS ){
 					printf("PANIC: Error al crear Tarea WIFI\r\n");
 					fflush(NULL);
 					while(1);
 			}
 res_task=xTaskCreate(Task_COMM,"COMM",1024,NULL,	 NORMAL_PRIORITY ,NULL);
 			 			if( res_task != pdPASS ){
 			 					printf("PANIC: Error al crear Tarea COMM\r\n");
 			 					fflush(NULL);
 			 					while(1);
 			 			}
 res_task=xTaskCreate(Task_TIME,"TIME",1024,NULL,	 NORMAL_PRIORITY ,NULL);
						if( res_task != pdPASS ){
								printf("PANIC: Error al crear Tarea COMM\r\n");
								fflush(NULL);
								while(1);
						}
}

void Task_HW(void *argument)
{
  /* USER CODE BEGIN 5 */
  /* Infinite loop */
   bool bt1_lock = true;
   bool bt2_lock = true;
   int state = GPIO_PIN_SET;

   float (*valores[2])();
   valores[0] = &Valor_lum;
   valores[1] = &Valor_temp;
   bool buzzer_state=false;
   int buzzer_counter=0;
   int v_index= 0;


  for(;;)
  {
	  Boton_izquierdo( &v_index, &bt1_lock);
	  Boton_derecho( &v_index, &bt2_lock,&buzzer_state);
	  put_leds(valores[v_index]());
	  pot_led_threshold(Valor_pot(),state);
	  state = !state;
	  Check_buzzer( valores[v_index](), &buzzer_state, &buzzer_counter);
	  osDelay(120);
  }
  /* USER CODE END 5 */
}

void Task_WIFI(void *argument)
{
	if(xSemaphoreTake(COMM_xSem, 20000/portTICK_RATE_MS  ) != pdTRUE ){
  // si en 20 segundos no he continuado entrado en orion mmm mal rollito harakiri
	printf("\r\n\n\nHARAKIRI desde WIFI!!\r\n");
	HAL_NVIC_SystemReset();
	}

	ESP8266_Boot();
	osDelay(1000);
	xSemaphoreGive(COMM_xSem);
	  for(;;)
	  {
		  /*assigned_ip=CHECK_IP();
		  if(assigned_ip==0){
			  printf("NO HAY INTERNET");
		  }*/
		  osDelay(2000);
	  }
  /* USER CODE END 5 */
}

void Task_COMM(void *argument)
{

	  for(;;)
	  {
			  if(xSemaphoreTake(COMM_xSem, 20000/portTICK_RATE_MS  ) != pdTRUE ){
			  // si en 20 segundos no he continuado entrado en orion mmm mal rollito harakiri
						printf("\r\n\n\nHARAKIRI desde COMM!!\r\n");
						HAL_NVIC_SystemReset();
			  }
				  // aquí tengo la exclusión mutua asegurada.
			  if(COMM_req.status==1){ //nada quiere nada
					//printf("TASKCOMM :Nueva peticion\r\n");
						Open_HTTP( COMM_req.dst,COMM_req.port,COMM_req.request);
						COMM_req.status=0;

				 }
			  else{
				 // printf("TASKCOMM:Esperando peticion....\r\n");
			  }
			  xSemaphoreGive(COMM_xSem); // i’m going out critical section
			  osDelay(500);
	  }

  /* USER CODE END 5 */
}

void Task_TIME(void *argument)
{

	  for(;;)
	  {
			  if(xSemaphoreTake(COMM_xSem, 20000/portTICK_RATE_MS  ) != pdTRUE ){
				  // si en 20 segundos no he continuado entrado en orion mmm mal rollito harakiri
				  printf("\r\n\n\nHARAKIRI!! desde TIME\r\n");
				  HAL_NVIC_SystemReset();
			  }
			  //printf("TASKTIME:ENVIANDO PETICION \r\n");
			  COMM_req.dst="worldtimeapi.org";
			  COMM_req.port="80";
			  COMM_req.request="GET /api/timezone/Europe/Madrid HTTP/1.1\r\n\r\n";
			  COMM_req.status=1;
			  xSemaphoreGive(COMM_xSem);
			  osDelay(2000);

	  }
  /* USER CODE END 5 */
}

