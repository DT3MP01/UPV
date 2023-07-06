/*
 * HW.c
 *
 *  Created on: Mar 24, 2023
 *      Author: luialza1
 */
#include <HW.h>
#ifndef min
    #define min(a,b) ((a) < (b) ? (a) : (b))
#endif
#ifndef max
    #define max(a,b) ((a) > (b) ? (a) : (b))
#endif

void put_leds_uint(uint8_t dato){

	if (dato&0x01)
		  HAL_GPIO_WritePin(GPIOB, LED1_Pin, GPIO_PIN_SET);
	else
		  HAL_GPIO_WritePin(GPIOB, LED1_Pin, GPIO_PIN_RESET);

	if (dato&0x02)
			  HAL_GPIO_WritePin(GPIOB, LED2_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED2_Pin, GPIO_PIN_RESET);
	if (dato&0x04)
			  HAL_GPIO_WritePin(GPIOA, LED3_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOA, LED3_Pin, GPIO_PIN_RESET);
	if (dato&0x08)
			  HAL_GPIO_WritePin(GPIOB, LED4_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED4_Pin, GPIO_PIN_RESET);
	if (dato&0x010)
			  HAL_GPIO_WritePin(GPIOB, LED5_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED5_Pin, GPIO_PIN_RESET);
	if (dato&0x020)
			  HAL_GPIO_WritePin(GPIOA, LED6_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOA, LED6_Pin, GPIO_PIN_RESET);
	if (dato&0x040)
			  HAL_GPIO_WritePin(GPIOB, LED7_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED7_Pin, GPIO_PIN_RESET);
	if (dato&0x080)
			  HAL_GPIO_WritePin(GPIOA, LED8_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOA, LED8_Pin, GPIO_PIN_RESET);
}


void put_leds(float dato){
	float threshold= 12.5;
	if (dato>=threshold)
		  HAL_GPIO_WritePin(GPIOB, LED1_Pin, GPIO_PIN_SET);
	else
		  HAL_GPIO_WritePin(GPIOB, LED1_Pin, GPIO_PIN_RESET);

	if (dato>=threshold*2)
			  HAL_GPIO_WritePin(GPIOB, LED2_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED2_Pin, GPIO_PIN_RESET);
	if (dato>=threshold*3)
			  HAL_GPIO_WritePin(GPIOA, LED3_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOA, LED3_Pin, GPIO_PIN_RESET);
	if (dato>=threshold*4)
			  HAL_GPIO_WritePin(GPIOB, LED4_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED4_Pin, GPIO_PIN_RESET);
	if (dato>=threshold*5)
			  HAL_GPIO_WritePin(GPIOB, LED5_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED5_Pin, GPIO_PIN_RESET);
	if (dato>=threshold*6)
			  HAL_GPIO_WritePin(GPIOA, LED6_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOA, LED6_Pin, GPIO_PIN_RESET);
	if (dato>=threshold*7)
			  HAL_GPIO_WritePin(GPIOB, LED7_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOB, LED7_Pin, GPIO_PIN_RESET);
	if (dato>=threshold*8)
			  HAL_GPIO_WritePin(GPIOA, LED8_Pin, GPIO_PIN_SET);
		else
			  HAL_GPIO_WritePin(GPIOA, LED8_Pin, GPIO_PIN_RESET);
}

float Valor_pot(){
	float valor = (ConvertidorA_D(ADC_CHANNEL_4)*255)/4095.0;
	/*if(valor>(255/2)){
		HAL_GPIO_WritePin(GPIOA,BUZZER_Pin, GPIO_PIN_SET);
	}
	else{
		  HAL_GPIO_WritePin(GPIOA,BUZZER_Pin, GPIO_PIN_RESET);
	}*/
	return valor;
}


float Valor_temp(){
	float beta =3900;
	float res = 10000;
	float temp =298;
	float valor =beta/(log((3.3*10000/(3.3-(float)ConvertidorA_D(ADC_CHANNEL_1)/4095*3.3)-10000)/res)+beta/temp);
	valor = (valor-278);
	return valor ;
}

float Valor_lum(){
	float valor =  ConvertidorA_D(ADC_CHANNEL_0);
	valor = min(valor , 3000);
	valor = (1- ((valor) /3000 ))*100;
	return valor;
}

uint32_t ConvertidorA_D(uint8_t channel){
	  // configuración del canal de entrada A/D
	uint32_t valueAD;
	ADC_ChannelConfTypeDef sConfig;
	sConfig.Channel = channel;
	sConfig.Rank = 1;
	sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
	HAL_ADC_ConfigChannel(&hadc1, &sConfig);
	// Disparo la conversion
	HAL_ADC_Start(&hadc1);
	// Espero la finalización
	HAL_ADC_PollForConversion(&hadc1, 10000);
	// Leo el valor de la conversión 4095 y 0
	valueAD=HAL_ADC_GetValue(&hadc1);
	return valueAD;
}


