#line 1 "C:/pic_project/Recuperacao_Nota_Prova/Recuperacao_Nota_Prova.c"

sbit LCD_RS at RE0_bit;
sbit LCD_EN at RE1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISE0_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;



int segundo = 0, minuto = 6, hora = 8, ano = 2025;
int dia_semana = 3;
int mes = 0;
int txt[7];
int contador = 0;
int conta_menu = 0;

char bissexto = 0;
int dia = 20;
int dia_mes =0;


void setup_inicial();
void escreve_lcd();
void escreve_dia();
void escreve_mes();
void escreve_ano();
void escreve_dia_semana();
void escreve_hora();
void relogio();


void main(){
 setup_inicial();
 lcd_init();
 lcd_cmd(_LCD_CURSOR_OFF);
 lcd_cmd(_LCD_CLEAR);
 while(1){
 relogio();
 escreve_lcd();
 if(rb0_bit==0){
 while(rb0_bit == 0) delay_ms(100);
 if(conta_menu < 7) conta_menu ++;
 if(conta_menu == 7) conta_menu = 0;
 }
 if(rb1_bit == 0){
 while(rb1_bit == 0) delay_ms(100);
 conta_menu = 0;
 }
 if(conta_menu == 1){

 if(rb2_bit==0){
 while(rb2_bit == 0) delay_ms(100);
 if(minuto < 60) minuto ++;
 }

 if(rb3_bit==0){
 while(rb3_bit == 0) delay_ms(100);
 if(minuto > 0) minuto --;
 }
 }
 if(conta_menu == 2){


 if(rb2_bit==0){
 while(rb2_bit == 0) delay_ms(100);
 if(hora < 24) hora ++;
 }

 if(rb3_bit==0){
 while(rb3_bit == 0) delay_ms(100);
 if(hora > 0) hora --;
 }
 }
 if(conta_menu == 3){

 if(rb2_bit==0){
 while(rb2_bit == 0) delay_ms(100);
 if(dia_semana < 6) dia_semana ++; else dia_semana = 0;
 }

 if(rb3_bit==0){
 while(rb3_bit == 0) delay_ms(100);
 if(dia_semana > 0) dia_semana --; else dia_semana = 6;
 }
 }
 if(conta_menu == 4){

 if(mes == 0)dia_mes = 31;
 if(mes == 2)dia_mes = 31;
 if(mes == 3)dia_mes = 30;
 if(mes == 4)dia_mes = 31;
 if(mes == 5)dia_mes = 30;
 if(mes == 6)dia_mes = 31;
 if(mes == 7)dia_mes = 31;
 if(mes == 8)dia_mes = 30;
 if(mes == 9)dia_mes = 31;
 if(mes == 10)dia_mes = 30;
 if(mes == 11)dia_mes = 31;

 if(mes == 1){
 if((ano % 400 == 0)&& (ano/100 != 0)){
 dia_mes = 1 ;;
 }else dia_mes = 28;
 if(ano % 4 == 0)dia_mes = 29; else dia_mes = 28;
 }
 if(rb2_bit==0){
 while(rb2_bit == 0) delay_ms(100);
 if(dia < dia_mes) dia ++;
 }

 if(rb3_bit==0){
 while(rb3_bit == 0) delay_ms(100);
 if(dia > bissexto) dia--;
 }
 }
 if(conta_menu == 5){


 if(rb2_bit==0){
 while(rb2_bit == 0) delay_ms(100);
 if(mes < 11) mes ++;else mes = 0;

 }

 if(rb3_bit==0){
 while(rb3_bit == 0) delay_ms(100);
 if(mes > 0) mes --; else mes = 11;
 }
 }
 if(conta_menu == 6){

 if(rb2_bit==0){
 while(rb2_bit == 0) delay_ms(100);
 if(ano < 9999) ano ++;else ano = 2024;

 }

 if(rb3_bit==0){
 while(rb3_bit == 0) delay_ms(100);
 if(ano > 2024) ano --;else ano = 9999;

 }
 }
 }
}

void setup_inicial(){

 portb = 0;




 trisb = 15;



 adcon1 = 15;
 cmcon = 7;
 intcon2 = 0;
 T0CON = 197;
 INTCON.TMR0IE = 1;
 INTCON.GIE = 1;
}

void interrupt(){
 if(tmr0if_bit == 1){
 tmr0if_bit = 0;
 contador ++;
 if(contador == 122){

 contador = 0;
 segundo ++;
 }
 }
}


void escreve_lcd(){
 lcd_out(1,1,"");
 escreve_dia();
 escreve_mes();
 escreve_ano();
 lcd_out(2,1,"");
 escreve_dia_semana();
 escreve_hora();
}
void escreve_dia(){
 inttostr(dia,txt);
 if(dia < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
 lcd_out_cp(" ");
}
void escreve_mes(){
 if(mes == 0) lcd_out_cp("Janeiro  ");
 if(mes == 1) lcd_out_cp("Fevereiro");
 if(mes == 2) lcd_out_cp("Marco    ");
 if(mes == 3) lcd_out_cp("Abril    ");
 if(mes == 4) lcd_out_cp("Maio     ");
 if(mes == 5) lcd_out_cp("Junho    ");
 if(mes == 6) lcd_out_cp("Julho    ");
 if(mes == 7) lcd_out_cp("Agosto   ");
 if(mes == 8) lcd_out_cp("Setembro ");
 if(mes == 9) lcd_out_cp("Outubro  ");
 if(mes == 10) lcd_out_cp("Novembro ");
 if(mes == 11) lcd_out_cp("Dezembro ");
}
void escreve_ano(){
 inttostr(ano,txt);
 lcd_out_cp(ltrim(txt));
}

void escreve_dia_semana(){
 if(dia_semana == 0)lcd_out_cp("Sabado  ");
 if(dia_semana == 1)lcd_out_cp("Domingo ");
 if(dia_semana == 2)lcd_out_cp("Segunda ");
 if(dia_semana == 3)lcd_out_cp("Terca   ");
 if(dia_semana == 4)lcd_out_cp("Quarta  ");
 if(dia_semana == 5)lcd_out_cp("Quinta  ");
 if(dia_semana == 6)lcd_out_cp("Sexta   ");
}
void escreve_hora(){

 inttostr(hora,txt);
 if(hora < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
 if(contador < 61)lcd_out_cp(":");
 else lcd_out_cp(" ");


 if((conta_menu == 1)&&(contador < 61))lcd_out_cp("  ");
 else{
 inttostr(minuto,txt);
 if(minuto < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
 }


 if(contador < 61)lcd_out_cp(":");
 else lcd_out_cp(" ");


 inttostr(segundo,txt);
 if(segundo < 10)lcd_out_cp("0");
 lcd_out_cp(ltrim(txt));
}
void relogio(){
 if(segundo == 60){
 segundo = 0;
 minuto ++;
 }
 if(minuto == 60){
 minuto = 0;
 hora ++;
 }
 if(hora == 24){
 hora = 0;
 segundo ++;
 dia_semana ++;
 dia++;
 }
}
