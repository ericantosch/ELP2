#include<stdio.h>
#include<stdint.h>
#include "/home/akku/ti/TivaWare_C_Series-2.2.0.295/inc/tm4c1294ncpdt.h"

void init_port(void);
void init_adc(void);
unsigned int read_adc();

int main(void){
    
    unsigned short int da_increase = 0;
    unsigned int adc_value = 0;
    unsigned int last_adc_value = da_increase-1;
    while (1)
    {
        ADC0_PSSI_R = 0x0001;
        last_adc_value = adc_value;
        adc_value = read_adc();
        if(adc_value <= 0.1){
            //GPIO_PORTM_DATA_R = (last_adc_value % 10) | (((last_adc_value / 10) % 10) << 4);
            //GPIO_PORTL_DATA_R = ((last_adc_value / 100) % 10) & 0x03;
            GPIO_PORTM_DATA_R = ((int)(last_adc_value * 19.53125) % 10) | ((((int)(last_adc_value * 19.53125) / 10) % 10) << 4);
            GPIO_PORTL_DATA_R = (((int)(last_adc_value * 19.53125) / 100) % 10) & 0x03;
            GPIO_PORTL_DATA_R |= 0x04;
        }
        if(GPIO_PORTD_AHB_DATA_R & 0x02 == 1){
            GPIO_PORTK_DATA_R = da_increase;
            da_increase++;
        }
    }
}


void init_port(void){

    SYSCTL_RCGCGPIO_R |= 0x0E08;
    while((SYSCTL_PRGPIO_R & 0x0E08) == 0){}
    

    GPIO_PORTD_AHB_DEN_R = 0x02;
    GPIO_PORTD_AHB_AFSEL_R |= 0x01;
    GPIO_PORTD_AHB_DEN_R &= ~0x01;
    GPIO_PORTD_AHB_AMSEL_R |= 0x01;
    GPIO_PORTD_AHB_PUR_R = 0x02;

    GPIO_PORTK_DEN_R = 0xFF;
    GPIO_PORTK_DIR_R = 0xFF;
    
    GPIO_PORTM_DEN_R = 0xFF;
    GPIO_PORTM_DIR_R = 0xFF;
    
    GPIO_PORTL_DEN_R = 0x07;
    GPIO_PORTL_DIR_R = 0x07;
    GPIO_PORTL_DATA_R = 0x00;
}


void init_adc(void){
    SYSCTL_RCGCADC_R |= 0x01;
    while((SYSCTL_PRADC_R & 0x01) == 0){}
    ADC0_ACTSS_R &= ~0x0F;
    ADC0_SSMUX0_R |= 0x0F;
    ADC0_SSCTL0_R |= 0x02;
    ADC0_ACTSS_R |= 0x01;
}

unsigned int read_adc(){
    unsigned int result = 0;
    while((ADC0_SSFSTAT0_R & (1<<8)) == 0){}

    result = (unsigned int)ADC0_SSFIFO0_R * 5000 / 4095;
    return result;
}
