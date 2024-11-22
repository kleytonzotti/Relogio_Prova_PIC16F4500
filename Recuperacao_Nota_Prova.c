// LCD module connections
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
// End LCD module connections

//variaveis dos estremos
int segundo = 0, minuto = 6, hora = 8, ano = 2025;
int dia_semana = 3;//0 = sabado, 1 = domingo, 2 = segunda, 3 = terca, 4 = quarta, 5 = quinta, 6 = sexta
int mes = 0;//10 = janeiro, 2 = fevereiro, 3 = marco ... 10 = outubro, 11 = novembro, 12 = dezembro
int txt[7];//vetor para converter inteiros em string
int contador = 0;//contador de interrup??es, com 122 interrup??es passou o tempo de 1 segundo com clock de 8MHZ no simulador!
int conta_menu = 0;//seleciona o menu de op??es, 0 menu desativado, 1 ajusta minuto, 2 ajusta hora, 3 ajusta dia semana
//, 4 ajusta dia, 5 ajusta mes, 6 ajusta ano
char bissexto = 0; //não é bissexto
int dia = 20;// dia aniversário
int dia_mes =0;//armazena os dias do mes


void setup_inicial();
void escreve_lcd();
void escreve_dia();
void escreve_mes();
void escreve_ano();
void escreve_dia_semana();
void escreve_hora();
void relogio();

//Programa principal
void main(){
    setup_inicial();
    lcd_init();
    lcd_cmd(_LCD_CURSOR_OFF);
    lcd_cmd(_LCD_CLEAR);
    while(1){
        relogio();//atualiza o rel?gio
        escreve_lcd();//escreve no LCD os dados do rel?gio
        if(rb0_bit==0){//menu de op??es
            while(rb0_bit == 0) delay_ms(100);
            if(conta_menu < 7) conta_menu ++;
            if(conta_menu == 7) conta_menu = 0;
        }
        if(rb1_bit == 0){//ok
            while(rb1_bit == 0) delay_ms(100);
            conta_menu = 0;//menu desligado
        }
        if(conta_menu == 1){
            //atualiza minuto
            if(rb2_bit==0){//sobe
                while(rb2_bit == 0) delay_ms(100);
                if(minuto < 60) minuto ++;
            }
            //bit rb3 desce//
            if(rb3_bit==0){//sobe
                while(rb3_bit == 0) delay_ms(100);
                if(minuto > 0) minuto --;
            }
        }
        if(conta_menu == 2){

            //atualiza hora
            if(rb2_bit==0){//sobe
                while(rb2_bit == 0) delay_ms(100);
                if(hora < 24) hora ++;
            }
            //bit rb3 desce//
            if(rb3_bit==0){//sobe
                while(rb3_bit == 0) delay_ms(100);
                if(hora > 0) hora --;
            }
        }
        if(conta_menu == 3){
            //atualiza dia_semana
            if(rb2_bit==0){//sobe
                while(rb2_bit == 0) delay_ms(100);
                if(dia_semana < 6) dia_semana ++; else dia_semana = 0;
            }
            //bit rb3 desce//
            if(rb3_bit==0){//sobe
                while(rb3_bit == 0) delay_ms(100);
                if(dia_semana > 0) dia_semana --; else dia_semana = 6;
            }
        }
        if(conta_menu == 4){
        //atualiza dia do mes
            if(mes == 0)dia_mes = 31;//janeiro 31 dias
            if(mes == 2)dia_mes = 31;//Março 31 dias
            if(mes == 3)dia_mes = 30;//Abril 30 dias
            if(mes == 4)dia_mes = 31;//maio 31 dias
            if(mes == 5)dia_mes = 30;//junho 30 dias
            if(mes == 6)dia_mes = 31;//julho 31 dias
            if(mes == 7)dia_mes = 31;//Agosto 31 dias
            if(mes == 8)dia_mes = 30;//Setembro 30 dias
            if(mes == 9)dia_mes = 31;//Outubro 31 dias
            if(mes == 10)dia_mes = 30;//Novembro 30 dias
            if(mes == 11)dia_mes = 31;//Dezembro 31 dias
            
            if(mes == 1){  //fevereiro filtra bissexto
                if((ano % 400 == 0)&& (ano/100 != 0)){
                     dia_mes = 29 ;;//bissexto
                }else dia_mes = 28;
                if(ano % 4 == 0)dia_mes = 29; else dia_mes = 28;
           }
           if(rb2_bit==0){//sobe
                while(rb2_bit == 0) delay_ms(100);
                if(dia < dia_mes) dia ++;
           }
                  //bit rb3 desce//
          if(rb3_bit==0){//sobe
               while(rb3_bit == 0) delay_ms(100);
               if(dia > bissexto) dia--;
           }
        }
        if(conta_menu == 5){
             //atualiza mes
           //if(mes == 2) lcd_out_cp(mes,txt);
            if(rb2_bit==0){//sobe
                while(rb2_bit == 0) delay_ms(100);
                if(mes < 11) mes ++;else  mes = 0;

            }
            //bit rb3 desce//
            if(rb3_bit==0){//sobe
                while(rb3_bit == 0) delay_ms(100);
                if(mes > 0) mes --; else mes = 11;
            }
        }
        if(conta_menu == 6){
        //atualiza ano
            if(rb2_bit==0){//sobe
                while(rb2_bit == 0) delay_ms(100);
                if(ano < 9999) ano ++;else ano = 2024;

            }
            //bit rb3 desce//
            if(rb3_bit==0){//sobe
                while(rb3_bit == 0) delay_ms(100);
                if(ano > 2024) ano --;else ano = 9999;

            }
        }
    }
}

void setup_inicial(){
    //porta = 0;
    portb = 0;
    //portc = 0;
    //portd = 0;
    //porte = 0;
    //trisa = 0;
    trisb = 15; //RB0,RB1,RB2 e RB3 como entradas
    //trisc = 0;
    //trisd = 0;
    //trise = 0;
    adcon1 = 15; //Configura como portas digitais
    cmcon = 7;   //desliga os comparadores
    intcon2 = 0; //liga resistor pull up do portb
    T0CON = 197;
    INTCON.TMR0IE = 1; //enable TMR0
    INTCON.GIE = 1; //liga global interrupt enable
}

void interrupt(){
    if(tmr0if_bit == 1){
        tmr0if_bit = 0;
        contador ++;
        if(contador == 122){
        //quando contador == 122 passou um segundo
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
       //escreve hora
    inttostr(hora,txt);
    if(hora < 10)lcd_out_cp("0");
    lcd_out_cp(ltrim(txt));
    if(contador < 61)lcd_out_cp(":");//pisca dois pontos antes do minuto
    else lcd_out_cp(" ");

    //se conta_menu == 1, (atualiza minuto foi selecionado) e contador < 61 (passou meio segundo)
    if((conta_menu == 1)&&(contador < 61))lcd_out_cp("  ");
    else{
        inttostr(minuto,txt);
        if(minuto < 10)lcd_out_cp("0");
        lcd_out_cp(ltrim(txt));
    }

    //pisca dois pontos antes do segundo
    if(contador < 61)lcd_out_cp(":");
    else lcd_out_cp(" ");

    //escreve segundos
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