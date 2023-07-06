/*
 * task_TIME.h
 *
 *  Created on: May 25, 2023
 *      Author: pperez
 */

#ifndef INC_TASK_TIME_H_
#define INC_TASK_TIME_H_

extern uint32_t global_time_it;

#define QUERY_HEADER "POST /v1/queryContext HTTP/1.1\r\nContent-Type: application/json\r\nAccept: application/json\r\nContent-Length: "
#define QUERY_BODY "{\"entities\": [{\"type\": \"Sensor\",\"isPattern\": \"false\",\"id\": \"%s\"}]}"
#define IoT_NAME "SensorSEU_PPB00"



#define POST_BODY "{ \"contextElements\": [{\"type\": \"Sensor\", \"isPattern\": \"false\",\"id\": \"SensorSEU_LAAZ\",\"attributes\": [{\"name\": \"temperature\",\"type\": \"float\",\"value\": \"44443\"}]}],\"updateAction\": \"APPEND\"}"
#define POST_HEADER "POST /v1/updateContext HTTP/1.1\r\nContent-Type: application/json\r\nAccept: application/json\r\nContent-Length:"




void Task_GETREQUEST_init(void);
void Task_GETREQUEST( void *pvParameters );





#endif /* INC_TASK_TIME_H_ */
