/*
 * HW.h
 *
 *  Created on: Mar 24, 2023
 *      Author: luialza1
 */

#ifndef __HW_h_
#define __HW_h_

#include <main.h>
#include <stdint.h>
#include <math.h>
extern ADC_HandleTypeDef hadc1;
void put_leds(float dato);
void put_leds_uint(uint8_t dato);
uint32_t ConvertidorA_D(uint8_t channel);
float Valor_pot();
float Valor_lum();
float Valor_temp();

#endif /* INC_HW_H_ */
