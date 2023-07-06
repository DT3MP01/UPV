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
#include <stdbool.h>
extern ADC_HandleTypeDef hadc1;
void put_leds(float dato);
void Check_buzzer(float valor, bool *state, int *count);

void Boton_derecho(int *v_index,bool *bt2_lock,bool *state );
void Boton_izquierdo(int *v_index,bool *bt1_lock );

void pot_led_threshold(float dato,GPIO_PinState action);
uint32_t ConvertidorA_D(uint8_t channel);
float Valor_pot();
float Valor_lum();
float Valor_temp();

#endif /* INC_HW_H_ */
