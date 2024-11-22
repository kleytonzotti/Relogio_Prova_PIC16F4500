
_main:

;Recuperacao_Nota_Prova.c,40 :: 		void main(){
;Recuperacao_Nota_Prova.c,41 :: 		setup_inicial();
	CALL        _setup_inicial+0, 0
;Recuperacao_Nota_Prova.c,42 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;Recuperacao_Nota_Prova.c,43 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Recuperacao_Nota_Prova.c,44 :: 		lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Recuperacao_Nota_Prova.c,45 :: 		while(1){
L_main0:
;Recuperacao_Nota_Prova.c,46 :: 		relogio();//atualiza o rel?gio
	CALL        _relogio+0, 0
;Recuperacao_Nota_Prova.c,47 :: 		escreve_lcd();//escreve no LCD os dados do rel?gio
	CALL        _escreve_lcd+0, 0
;Recuperacao_Nota_Prova.c,48 :: 		if(rb0_bit==0){//menu de op??es
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main2
;Recuperacao_Nota_Prova.c,49 :: 		while(rb0_bit == 0) delay_ms(100);
L_main3:
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main4
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	GOTO        L_main3
L_main4:
;Recuperacao_Nota_Prova.c,50 :: 		if(conta_menu < 7) conta_menu ++;
	MOVLW       128
	XORWF       _conta_menu+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main141
	MOVLW       7
	SUBWF       _conta_menu+0, 0 
L__main141:
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
	INFSNZ      _conta_menu+0, 1 
	INCF        _conta_menu+1, 1 
L_main6:
;Recuperacao_Nota_Prova.c,51 :: 		if(conta_menu == 7) conta_menu = 0;
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVLW       7
	XORWF       _conta_menu+0, 0 
L__main142:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
	CLRF        _conta_menu+0 
	CLRF        _conta_menu+1 
L_main7:
;Recuperacao_Nota_Prova.c,52 :: 		}
L_main2:
;Recuperacao_Nota_Prova.c,53 :: 		if(rb1_bit == 0){//ok
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main8
;Recuperacao_Nota_Prova.c,54 :: 		while(rb1_bit == 0) delay_ms(100);
L_main9:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main10
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
	GOTO        L_main9
L_main10:
;Recuperacao_Nota_Prova.c,55 :: 		conta_menu = 0;//menu desligado
	CLRF        _conta_menu+0 
	CLRF        _conta_menu+1 
;Recuperacao_Nota_Prova.c,56 :: 		}
L_main8:
;Recuperacao_Nota_Prova.c,57 :: 		if(conta_menu == 1){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVLW       1
	XORWF       _conta_menu+0, 0 
L__main143:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;Recuperacao_Nota_Prova.c,59 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main13
;Recuperacao_Nota_Prova.c,60 :: 		while(rb2_bit == 0) delay_ms(100);
L_main14:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main15
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
	NOP
	GOTO        L_main14
L_main15:
;Recuperacao_Nota_Prova.c,61 :: 		if(minuto < 60) minuto ++;
	MOVLW       128
	XORWF       _minuto+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main144
	MOVLW       60
	SUBWF       _minuto+0, 0 
L__main144:
	BTFSC       STATUS+0, 0 
	GOTO        L_main17
	INFSNZ      _minuto+0, 1 
	INCF        _minuto+1, 1 
L_main17:
;Recuperacao_Nota_Prova.c,62 :: 		}
L_main13:
;Recuperacao_Nota_Prova.c,64 :: 		if(rb3_bit==0){//sobe
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main18
;Recuperacao_Nota_Prova.c,65 :: 		while(rb3_bit == 0) delay_ms(100);
L_main19:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main20
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	GOTO        L_main19
L_main20:
;Recuperacao_Nota_Prova.c,66 :: 		if(minuto > 0) minuto --;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _minuto+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main145
	MOVF        _minuto+0, 0 
	SUBLW       0
L__main145:
	BTFSC       STATUS+0, 0 
	GOTO        L_main22
	MOVLW       1
	SUBWF       _minuto+0, 1 
	MOVLW       0
	SUBWFB      _minuto+1, 1 
L_main22:
;Recuperacao_Nota_Prova.c,67 :: 		}
L_main18:
;Recuperacao_Nota_Prova.c,68 :: 		}
L_main12:
;Recuperacao_Nota_Prova.c,69 :: 		if(conta_menu == 2){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main146
	MOVLW       2
	XORWF       _conta_menu+0, 0 
L__main146:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Recuperacao_Nota_Prova.c,72 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main24
;Recuperacao_Nota_Prova.c,73 :: 		while(rb2_bit == 0) delay_ms(100);
L_main25:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main26
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	GOTO        L_main25
L_main26:
;Recuperacao_Nota_Prova.c,74 :: 		if(hora < 24) hora ++;
	MOVLW       128
	XORWF       _hora+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVLW       24
	SUBWF       _hora+0, 0 
L__main147:
	BTFSC       STATUS+0, 0 
	GOTO        L_main28
	INFSNZ      _hora+0, 1 
	INCF        _hora+1, 1 
L_main28:
;Recuperacao_Nota_Prova.c,75 :: 		}
L_main24:
;Recuperacao_Nota_Prova.c,77 :: 		if(rb3_bit==0){//sobe
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main29
;Recuperacao_Nota_Prova.c,78 :: 		while(rb3_bit == 0) delay_ms(100);
L_main30:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main31
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
	GOTO        L_main30
L_main31:
;Recuperacao_Nota_Prova.c,79 :: 		if(hora > 0) hora --;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _hora+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main148
	MOVF        _hora+0, 0 
	SUBLW       0
L__main148:
	BTFSC       STATUS+0, 0 
	GOTO        L_main33
	MOVLW       1
	SUBWF       _hora+0, 1 
	MOVLW       0
	SUBWFB      _hora+1, 1 
L_main33:
;Recuperacao_Nota_Prova.c,80 :: 		}
L_main29:
;Recuperacao_Nota_Prova.c,81 :: 		}
L_main23:
;Recuperacao_Nota_Prova.c,82 :: 		if(conta_menu == 3){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main149
	MOVLW       3
	XORWF       _conta_menu+0, 0 
L__main149:
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
;Recuperacao_Nota_Prova.c,84 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main35
;Recuperacao_Nota_Prova.c,85 :: 		while(rb2_bit == 0) delay_ms(100);
L_main36:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main37
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	DECFSZ      R11, 1, 1
	BRA         L_main38
	NOP
	GOTO        L_main36
L_main37:
;Recuperacao_Nota_Prova.c,86 :: 		if(dia_semana < 6) dia_semana ++; else dia_semana = 0;
	MOVLW       128
	XORWF       _dia_semana+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main150
	MOVLW       6
	SUBWF       _dia_semana+0, 0 
L__main150:
	BTFSC       STATUS+0, 0 
	GOTO        L_main39
	INFSNZ      _dia_semana+0, 1 
	INCF        _dia_semana+1, 1 
	GOTO        L_main40
L_main39:
	CLRF        _dia_semana+0 
	CLRF        _dia_semana+1 
L_main40:
;Recuperacao_Nota_Prova.c,87 :: 		}
L_main35:
;Recuperacao_Nota_Prova.c,89 :: 		if(rb3_bit==0){//sobe
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main41
;Recuperacao_Nota_Prova.c,90 :: 		while(rb3_bit == 0) delay_ms(100);
L_main42:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main43
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 1
	BRA         L_main44
	DECFSZ      R12, 1, 1
	BRA         L_main44
	DECFSZ      R11, 1, 1
	BRA         L_main44
	NOP
	GOTO        L_main42
L_main43:
;Recuperacao_Nota_Prova.c,91 :: 		if(dia_semana > 0) dia_semana --; else dia_semana = 6;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _dia_semana+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main151
	MOVF        _dia_semana+0, 0 
	SUBLW       0
L__main151:
	BTFSC       STATUS+0, 0 
	GOTO        L_main45
	MOVLW       1
	SUBWF       _dia_semana+0, 1 
	MOVLW       0
	SUBWFB      _dia_semana+1, 1 
	GOTO        L_main46
L_main45:
	MOVLW       6
	MOVWF       _dia_semana+0 
	MOVLW       0
	MOVWF       _dia_semana+1 
L_main46:
;Recuperacao_Nota_Prova.c,92 :: 		}
L_main41:
;Recuperacao_Nota_Prova.c,93 :: 		}
L_main34:
;Recuperacao_Nota_Prova.c,94 :: 		if(conta_menu == 4){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main152
	MOVLW       4
	XORWF       _conta_menu+0, 0 
L__main152:
	BTFSS       STATUS+0, 2 
	GOTO        L_main47
;Recuperacao_Nota_Prova.c,96 :: 		if(mes == 0)dia_mes = 31;//janeiro 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main153
	MOVLW       0
	XORWF       _mes+0, 0 
L__main153:
	BTFSS       STATUS+0, 2 
	GOTO        L_main48
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main48:
;Recuperacao_Nota_Prova.c,97 :: 		if(mes == 2)dia_mes = 31;//Março 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main154
	MOVLW       2
	XORWF       _mes+0, 0 
L__main154:
	BTFSS       STATUS+0, 2 
	GOTO        L_main49
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main49:
;Recuperacao_Nota_Prova.c,98 :: 		if(mes == 3)dia_mes = 30;//Abril 30 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main155
	MOVLW       3
	XORWF       _mes+0, 0 
L__main155:
	BTFSS       STATUS+0, 2 
	GOTO        L_main50
	MOVLW       30
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main50:
;Recuperacao_Nota_Prova.c,99 :: 		if(mes == 4)dia_mes = 31;//maio 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main156
	MOVLW       4
	XORWF       _mes+0, 0 
L__main156:
	BTFSS       STATUS+0, 2 
	GOTO        L_main51
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main51:
;Recuperacao_Nota_Prova.c,100 :: 		if(mes == 5)dia_mes = 30;//junho 30 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main157
	MOVLW       5
	XORWF       _mes+0, 0 
L__main157:
	BTFSS       STATUS+0, 2 
	GOTO        L_main52
	MOVLW       30
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main52:
;Recuperacao_Nota_Prova.c,101 :: 		if(mes == 6)dia_mes = 31;//julho 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main158
	MOVLW       6
	XORWF       _mes+0, 0 
L__main158:
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main53:
;Recuperacao_Nota_Prova.c,102 :: 		if(mes == 7)dia_mes = 31;//Agosto 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main159
	MOVLW       7
	XORWF       _mes+0, 0 
L__main159:
	BTFSS       STATUS+0, 2 
	GOTO        L_main54
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main54:
;Recuperacao_Nota_Prova.c,103 :: 		if(mes == 8)dia_mes = 30;//Setembro 30 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main160
	MOVLW       8
	XORWF       _mes+0, 0 
L__main160:
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
	MOVLW       30
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main55:
;Recuperacao_Nota_Prova.c,104 :: 		if(mes == 9)dia_mes = 31;//Outubro 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main161
	MOVLW       9
	XORWF       _mes+0, 0 
L__main161:
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main56:
;Recuperacao_Nota_Prova.c,105 :: 		if(mes == 10)dia_mes = 30;//Novembro 30 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main162
	MOVLW       10
	XORWF       _mes+0, 0 
L__main162:
	BTFSS       STATUS+0, 2 
	GOTO        L_main57
	MOVLW       30
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main57:
;Recuperacao_Nota_Prova.c,106 :: 		if(mes == 11)dia_mes = 31;//Dezembro 31 dias
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main163
	MOVLW       11
	XORWF       _mes+0, 0 
L__main163:
	BTFSS       STATUS+0, 2 
	GOTO        L_main58
	MOVLW       31
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main58:
;Recuperacao_Nota_Prova.c,108 :: 		if(mes == 1){  //fevereiro filtra bissexto
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main164
	MOVLW       1
	XORWF       _mes+0, 0 
L__main164:
	BTFSS       STATUS+0, 2 
	GOTO        L_main59
;Recuperacao_Nota_Prova.c,109 :: 		if((ano % 400 == 0)&& (ano/100 != 0)){
	MOVLW       144
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main165
	MOVLW       0
	XORWF       R0, 0 
L__main165:
	BTFSS       STATUS+0, 2 
	GOTO        L_main62
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main166
	MOVLW       0
	XORWF       R0, 0 
L__main166:
	BTFSC       STATUS+0, 2 
	GOTO        L_main62
L__main138:
;Recuperacao_Nota_Prova.c,110 :: 		dia_mes = 1 ;;//bissexto
	MOVLW       1
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
;Recuperacao_Nota_Prova.c,111 :: 		}else dia_mes = 28;
	GOTO        L_main63
L_main62:
	MOVLW       28
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main63:
;Recuperacao_Nota_Prova.c,112 :: 		if(ano % 4 == 0)dia_mes = 29; else dia_mes = 28;
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main167
	MOVLW       0
	XORWF       R0, 0 
L__main167:
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
	MOVLW       29
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
	GOTO        L_main65
L_main64:
	MOVLW       28
	MOVWF       _dia_mes+0 
	MOVLW       0
	MOVWF       _dia_mes+1 
L_main65:
;Recuperacao_Nota_Prova.c,113 :: 		}
L_main59:
;Recuperacao_Nota_Prova.c,114 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main66
;Recuperacao_Nota_Prova.c,115 :: 		while(rb2_bit == 0) delay_ms(100);
L_main67:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main68
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main69:
	DECFSZ      R13, 1, 1
	BRA         L_main69
	DECFSZ      R12, 1, 1
	BRA         L_main69
	DECFSZ      R11, 1, 1
	BRA         L_main69
	NOP
	GOTO        L_main67
L_main68:
;Recuperacao_Nota_Prova.c,116 :: 		if(dia < dia_mes) dia ++;
	MOVLW       128
	XORWF       _dia+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _dia_mes+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main168
	MOVF        _dia_mes+0, 0 
	SUBWF       _dia+0, 0 
L__main168:
	BTFSC       STATUS+0, 0 
	GOTO        L_main70
	INFSNZ      _dia+0, 1 
	INCF        _dia+1, 1 
L_main70:
;Recuperacao_Nota_Prova.c,117 :: 		}
L_main66:
;Recuperacao_Nota_Prova.c,119 :: 		if(rb3_bit==0){//sobe
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main71
;Recuperacao_Nota_Prova.c,120 :: 		while(rb3_bit == 0) delay_ms(100);
L_main72:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main73
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main74:
	DECFSZ      R13, 1, 1
	BRA         L_main74
	DECFSZ      R12, 1, 1
	BRA         L_main74
	DECFSZ      R11, 1, 1
	BRA         L_main74
	NOP
	GOTO        L_main72
L_main73:
;Recuperacao_Nota_Prova.c,121 :: 		if(dia > bissexto) dia--;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _dia+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main169
	MOVF        _dia+0, 0 
	SUBWF       _bissexto+0, 0 
L__main169:
	BTFSC       STATUS+0, 0 
	GOTO        L_main75
	MOVLW       1
	SUBWF       _dia+0, 1 
	MOVLW       0
	SUBWFB      _dia+1, 1 
L_main75:
;Recuperacao_Nota_Prova.c,122 :: 		}
L_main71:
;Recuperacao_Nota_Prova.c,123 :: 		}
L_main47:
;Recuperacao_Nota_Prova.c,124 :: 		if(conta_menu == 5){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main170
	MOVLW       5
	XORWF       _conta_menu+0, 0 
L__main170:
	BTFSS       STATUS+0, 2 
	GOTO        L_main76
;Recuperacao_Nota_Prova.c,127 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main77
;Recuperacao_Nota_Prova.c,128 :: 		while(rb2_bit == 0) delay_ms(100);
L_main78:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main79
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main80:
	DECFSZ      R13, 1, 1
	BRA         L_main80
	DECFSZ      R12, 1, 1
	BRA         L_main80
	DECFSZ      R11, 1, 1
	BRA         L_main80
	NOP
	GOTO        L_main78
L_main79:
;Recuperacao_Nota_Prova.c,129 :: 		if(mes < 11) mes ++;else  mes = 0;
	MOVLW       128
	XORWF       _mes+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main171
	MOVLW       11
	SUBWF       _mes+0, 0 
L__main171:
	BTFSC       STATUS+0, 0 
	GOTO        L_main81
	INFSNZ      _mes+0, 1 
	INCF        _mes+1, 1 
	GOTO        L_main82
L_main81:
	CLRF        _mes+0 
	CLRF        _mes+1 
L_main82:
;Recuperacao_Nota_Prova.c,131 :: 		}
L_main77:
;Recuperacao_Nota_Prova.c,133 :: 		if(rb3_bit==0){//sobe
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main83
;Recuperacao_Nota_Prova.c,134 :: 		while(rb3_bit == 0) delay_ms(100);
L_main84:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main85
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main86:
	DECFSZ      R13, 1, 1
	BRA         L_main86
	DECFSZ      R12, 1, 1
	BRA         L_main86
	DECFSZ      R11, 1, 1
	BRA         L_main86
	NOP
	GOTO        L_main84
L_main85:
;Recuperacao_Nota_Prova.c,135 :: 		if(mes > 0) mes --; else mes = 11;
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _mes+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main172
	MOVF        _mes+0, 0 
	SUBLW       0
L__main172:
	BTFSC       STATUS+0, 0 
	GOTO        L_main87
	MOVLW       1
	SUBWF       _mes+0, 1 
	MOVLW       0
	SUBWFB      _mes+1, 1 
	GOTO        L_main88
L_main87:
	MOVLW       11
	MOVWF       _mes+0 
	MOVLW       0
	MOVWF       _mes+1 
L_main88:
;Recuperacao_Nota_Prova.c,136 :: 		}
L_main83:
;Recuperacao_Nota_Prova.c,137 :: 		}
L_main76:
;Recuperacao_Nota_Prova.c,138 :: 		if(conta_menu == 6){
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main173
	MOVLW       6
	XORWF       _conta_menu+0, 0 
L__main173:
	BTFSS       STATUS+0, 2 
	GOTO        L_main89
;Recuperacao_Nota_Prova.c,140 :: 		if(rb2_bit==0){//sobe
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main90
;Recuperacao_Nota_Prova.c,141 :: 		while(rb2_bit == 0) delay_ms(100);
L_main91:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main92
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main93:
	DECFSZ      R13, 1, 1
	BRA         L_main93
	DECFSZ      R12, 1, 1
	BRA         L_main93
	DECFSZ      R11, 1, 1
	BRA         L_main93
	NOP
	GOTO        L_main91
L_main92:
;Recuperacao_Nota_Prova.c,142 :: 		if(ano < 9999) ano ++;else ano = 2024;
	MOVLW       128
	XORWF       _ano+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       39
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main174
	MOVLW       15
	SUBWF       _ano+0, 0 
L__main174:
	BTFSC       STATUS+0, 0 
	GOTO        L_main94
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
	GOTO        L_main95
L_main94:
	MOVLW       232
	MOVWF       _ano+0 
	MOVLW       7
	MOVWF       _ano+1 
L_main95:
;Recuperacao_Nota_Prova.c,144 :: 		}
L_main90:
;Recuperacao_Nota_Prova.c,146 :: 		if(rb3_bit==0){//sobe
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main96
;Recuperacao_Nota_Prova.c,147 :: 		while(rb3_bit == 0) delay_ms(100);
L_main97:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main98
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main99:
	DECFSZ      R13, 1, 1
	BRA         L_main99
	DECFSZ      R12, 1, 1
	BRA         L_main99
	DECFSZ      R11, 1, 1
	BRA         L_main99
	NOP
	GOTO        L_main97
L_main98:
;Recuperacao_Nota_Prova.c,148 :: 		if(ano > 2024) ano --;else ano = 9999;
	MOVLW       128
	XORLW       7
	MOVWF       R0 
	MOVLW       128
	XORWF       _ano+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main175
	MOVF        _ano+0, 0 
	SUBLW       232
L__main175:
	BTFSC       STATUS+0, 0 
	GOTO        L_main100
	MOVLW       1
	SUBWF       _ano+0, 1 
	MOVLW       0
	SUBWFB      _ano+1, 1 
	GOTO        L_main101
L_main100:
	MOVLW       15
	MOVWF       _ano+0 
	MOVLW       39
	MOVWF       _ano+1 
L_main101:
;Recuperacao_Nota_Prova.c,150 :: 		}
L_main96:
;Recuperacao_Nota_Prova.c,151 :: 		}
L_main89:
;Recuperacao_Nota_Prova.c,152 :: 		}
	GOTO        L_main0
;Recuperacao_Nota_Prova.c,153 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_setup_inicial:

;Recuperacao_Nota_Prova.c,155 :: 		void setup_inicial(){
;Recuperacao_Nota_Prova.c,157 :: 		portb = 0;
	CLRF        PORTB+0 
;Recuperacao_Nota_Prova.c,162 :: 		trisb = 15; //RB0,RB1,RB2 e RB3 como entradas
	MOVLW       15
	MOVWF       TRISB+0 
;Recuperacao_Nota_Prova.c,166 :: 		adcon1 = 15; //Configura como portas digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;Recuperacao_Nota_Prova.c,167 :: 		cmcon = 7;   //desliga os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;Recuperacao_Nota_Prova.c,168 :: 		intcon2 = 0; //liga resistor pull up do portb
	CLRF        INTCON2+0 
;Recuperacao_Nota_Prova.c,169 :: 		T0CON = 197;
	MOVLW       197
	MOVWF       T0CON+0 
;Recuperacao_Nota_Prova.c,170 :: 		INTCON.TMR0IE = 1; //enable TMR0
	BSF         INTCON+0, 5 
;Recuperacao_Nota_Prova.c,171 :: 		INTCON.GIE = 1; //liga global interrupt enable
	BSF         INTCON+0, 7 
;Recuperacao_Nota_Prova.c,172 :: 		}
L_end_setup_inicial:
	RETURN      0
; end of _setup_inicial

_interrupt:

;Recuperacao_Nota_Prova.c,174 :: 		void interrupt(){
;Recuperacao_Nota_Prova.c,175 :: 		if(tmr0if_bit == 1){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt102
;Recuperacao_Nota_Prova.c,176 :: 		tmr0if_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;Recuperacao_Nota_Prova.c,177 :: 		contador ++;
	INFSNZ      _contador+0, 1 
	INCF        _contador+1, 1 
;Recuperacao_Nota_Prova.c,178 :: 		if(contador == 122){
	MOVLW       0
	XORWF       _contador+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt179
	MOVLW       122
	XORWF       _contador+0, 0 
L__interrupt179:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt103
;Recuperacao_Nota_Prova.c,180 :: 		contador = 0;
	CLRF        _contador+0 
	CLRF        _contador+1 
;Recuperacao_Nota_Prova.c,181 :: 		segundo ++;
	INFSNZ      _segundo+0, 1 
	INCF        _segundo+1, 1 
;Recuperacao_Nota_Prova.c,182 :: 		}
L_interrupt103:
;Recuperacao_Nota_Prova.c,183 :: 		}
L_interrupt102:
;Recuperacao_Nota_Prova.c,184 :: 		}
L_end_interrupt:
L__interrupt178:
	RETFIE      1
; end of _interrupt

_escreve_lcd:

;Recuperacao_Nota_Prova.c,187 :: 		void escreve_lcd(){
;Recuperacao_Nota_Prova.c,188 :: 		lcd_out(1,1,"");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Recuperacao_Nota_Prova.c,189 :: 		escreve_dia();
	CALL        _escreve_dia+0, 0
;Recuperacao_Nota_Prova.c,190 :: 		escreve_mes();
	CALL        _escreve_mes+0, 0
;Recuperacao_Nota_Prova.c,191 :: 		escreve_ano();
	CALL        _escreve_ano+0, 0
;Recuperacao_Nota_Prova.c,192 :: 		lcd_out(2,1,"");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Recuperacao_Nota_Prova.c,193 :: 		escreve_dia_semana();
	CALL        _escreve_dia_semana+0, 0
;Recuperacao_Nota_Prova.c,194 :: 		escreve_hora();
	CALL        _escreve_hora+0, 0
;Recuperacao_Nota_Prova.c,195 :: 		}
L_end_escreve_lcd:
	RETURN      0
; end of _escreve_lcd

_escreve_dia:

;Recuperacao_Nota_Prova.c,196 :: 		void escreve_dia(){
;Recuperacao_Nota_Prova.c,197 :: 		inttostr(dia,txt);
	MOVF        _dia+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _dia+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_Nota_Prova.c,198 :: 		if(dia < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _dia+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia182
	MOVLW       10
	SUBWF       _dia+0, 0 
L__escreve_dia182:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_dia104
	MOVLW       ?lstr3_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr3_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia104:
;Recuperacao_Nota_Prova.c,199 :: 		lcd_out_cp(ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_Nota_Prova.c,200 :: 		lcd_out_cp(" ");
	MOVLW       ?lstr4_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr4_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_Nota_Prova.c,201 :: 		}
L_end_escreve_dia:
	RETURN      0
; end of _escreve_dia

_escreve_mes:

;Recuperacao_Nota_Prova.c,202 :: 		void escreve_mes(){
;Recuperacao_Nota_Prova.c,203 :: 		if(mes == 0) lcd_out_cp("Janeiro  ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes184
	MOVLW       0
	XORWF       _mes+0, 0 
L__escreve_mes184:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes105
	MOVLW       ?lstr5_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr5_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes105:
;Recuperacao_Nota_Prova.c,204 :: 		if(mes == 1) lcd_out_cp("Fevereiro");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes185
	MOVLW       1
	XORWF       _mes+0, 0 
L__escreve_mes185:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes106
	MOVLW       ?lstr6_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr6_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes106:
;Recuperacao_Nota_Prova.c,205 :: 		if(mes == 2) lcd_out_cp("Marco    ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes186
	MOVLW       2
	XORWF       _mes+0, 0 
L__escreve_mes186:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes107
	MOVLW       ?lstr7_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr7_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes107:
;Recuperacao_Nota_Prova.c,206 :: 		if(mes == 3) lcd_out_cp("Abril    ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes187
	MOVLW       3
	XORWF       _mes+0, 0 
L__escreve_mes187:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes108
	MOVLW       ?lstr8_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr8_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes108:
;Recuperacao_Nota_Prova.c,207 :: 		if(mes == 4) lcd_out_cp("Maio     ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes188
	MOVLW       4
	XORWF       _mes+0, 0 
L__escreve_mes188:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes109
	MOVLW       ?lstr9_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr9_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes109:
;Recuperacao_Nota_Prova.c,208 :: 		if(mes == 5) lcd_out_cp("Junho    ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes189
	MOVLW       5
	XORWF       _mes+0, 0 
L__escreve_mes189:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes110
	MOVLW       ?lstr10_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr10_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes110:
;Recuperacao_Nota_Prova.c,209 :: 		if(mes == 6) lcd_out_cp("Julho    ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes190
	MOVLW       6
	XORWF       _mes+0, 0 
L__escreve_mes190:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes111
	MOVLW       ?lstr11_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr11_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes111:
;Recuperacao_Nota_Prova.c,210 :: 		if(mes == 7) lcd_out_cp("Agosto   ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes191
	MOVLW       7
	XORWF       _mes+0, 0 
L__escreve_mes191:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes112
	MOVLW       ?lstr12_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr12_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes112:
;Recuperacao_Nota_Prova.c,211 :: 		if(mes == 8) lcd_out_cp("Setembro ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes192
	MOVLW       8
	XORWF       _mes+0, 0 
L__escreve_mes192:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes113
	MOVLW       ?lstr13_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr13_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes113:
;Recuperacao_Nota_Prova.c,212 :: 		if(mes == 9) lcd_out_cp("Outubro  ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes193
	MOVLW       9
	XORWF       _mes+0, 0 
L__escreve_mes193:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes114
	MOVLW       ?lstr14_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr14_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes114:
;Recuperacao_Nota_Prova.c,213 :: 		if(mes == 10) lcd_out_cp("Novembro ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes194
	MOVLW       10
	XORWF       _mes+0, 0 
L__escreve_mes194:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes115
	MOVLW       ?lstr15_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr15_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes115:
;Recuperacao_Nota_Prova.c,214 :: 		if(mes == 11) lcd_out_cp("Dezembro ");
	MOVLW       0
	XORWF       _mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_mes195
	MOVLW       11
	XORWF       _mes+0, 0 
L__escreve_mes195:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_mes116
	MOVLW       ?lstr16_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr16_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_mes116:
;Recuperacao_Nota_Prova.c,215 :: 		}
L_end_escreve_mes:
	RETURN      0
; end of _escreve_mes

_escreve_ano:

;Recuperacao_Nota_Prova.c,216 :: 		void escreve_ano(){
;Recuperacao_Nota_Prova.c,217 :: 		inttostr(ano,txt);
	MOVF        _ano+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _ano+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_Nota_Prova.c,218 :: 		lcd_out_cp(ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_Nota_Prova.c,219 :: 		}
L_end_escreve_ano:
	RETURN      0
; end of _escreve_ano

_escreve_dia_semana:

;Recuperacao_Nota_Prova.c,221 :: 		void escreve_dia_semana(){
;Recuperacao_Nota_Prova.c,222 :: 		if(dia_semana == 0)lcd_out_cp("Sabado  ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana198
	MOVLW       0
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana198:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana117
	MOVLW       ?lstr17_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr17_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana117:
;Recuperacao_Nota_Prova.c,223 :: 		if(dia_semana == 1)lcd_out_cp("Domingo ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana199
	MOVLW       1
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana199:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana118
	MOVLW       ?lstr18_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr18_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana118:
;Recuperacao_Nota_Prova.c,224 :: 		if(dia_semana == 2)lcd_out_cp("Segunda ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana200
	MOVLW       2
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana200:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana119
	MOVLW       ?lstr19_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr19_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana119:
;Recuperacao_Nota_Prova.c,225 :: 		if(dia_semana == 3)lcd_out_cp("Terca   ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana201
	MOVLW       3
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana201:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana120
	MOVLW       ?lstr20_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr20_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana120:
;Recuperacao_Nota_Prova.c,226 :: 		if(dia_semana == 4)lcd_out_cp("Quarta  ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana202
	MOVLW       4
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana202:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana121
	MOVLW       ?lstr21_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr21_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana121:
;Recuperacao_Nota_Prova.c,227 :: 		if(dia_semana == 5)lcd_out_cp("Quinta  ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana203
	MOVLW       5
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana203:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana122
	MOVLW       ?lstr22_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr22_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana122:
;Recuperacao_Nota_Prova.c,228 :: 		if(dia_semana == 6)lcd_out_cp("Sexta   ");
	MOVLW       0
	XORWF       _dia_semana+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_dia_semana204
	MOVLW       6
	XORWF       _dia_semana+0, 0 
L__escreve_dia_semana204:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_dia_semana123
	MOVLW       ?lstr23_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr23_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_dia_semana123:
;Recuperacao_Nota_Prova.c,229 :: 		}
L_end_escreve_dia_semana:
	RETURN      0
; end of _escreve_dia_semana

_escreve_hora:

;Recuperacao_Nota_Prova.c,230 :: 		void escreve_hora(){
;Recuperacao_Nota_Prova.c,232 :: 		inttostr(hora,txt);
	MOVF        _hora+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _hora+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_Nota_Prova.c,233 :: 		if(hora < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _hora+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora206
	MOVLW       10
	SUBWF       _hora+0, 0 
L__escreve_hora206:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora124
	MOVLW       ?lstr24_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr24_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora124:
;Recuperacao_Nota_Prova.c,234 :: 		lcd_out_cp(ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_Nota_Prova.c,235 :: 		if(contador < 61)lcd_out_cp(":");//pisca dois pontos antes do minuto
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora207
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora207:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora125
	MOVLW       ?lstr25_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr25_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora126
L_escreve_hora125:
;Recuperacao_Nota_Prova.c,236 :: 		else lcd_out_cp(" ");
	MOVLW       ?lstr26_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr26_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora126:
;Recuperacao_Nota_Prova.c,239 :: 		if((conta_menu == 1)&&(contador < 61))lcd_out_cp("  ");
	MOVLW       0
	XORWF       _conta_menu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora208
	MOVLW       1
	XORWF       _conta_menu+0, 0 
L__escreve_hora208:
	BTFSS       STATUS+0, 2 
	GOTO        L_escreve_hora129
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora209
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora209:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora129
L__escreve_hora139:
	MOVLW       ?lstr27_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr27_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora130
L_escreve_hora129:
;Recuperacao_Nota_Prova.c,241 :: 		inttostr(minuto,txt);
	MOVF        _minuto+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _minuto+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_Nota_Prova.c,242 :: 		if(minuto < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _minuto+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora210
	MOVLW       10
	SUBWF       _minuto+0, 0 
L__escreve_hora210:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora131
	MOVLW       ?lstr28_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr28_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora131:
;Recuperacao_Nota_Prova.c,243 :: 		lcd_out_cp(ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_Nota_Prova.c,244 :: 		}
L_escreve_hora130:
;Recuperacao_Nota_Prova.c,247 :: 		if(contador < 61)lcd_out_cp(":");
	MOVLW       128
	XORWF       _contador+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora211
	MOVLW       61
	SUBWF       _contador+0, 0 
L__escreve_hora211:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora132
	MOVLW       ?lstr29_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr29_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
	GOTO        L_escreve_hora133
L_escreve_hora132:
;Recuperacao_Nota_Prova.c,248 :: 		else lcd_out_cp(" ");
	MOVLW       ?lstr30_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr30_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora133:
;Recuperacao_Nota_Prova.c,251 :: 		inttostr(segundo,txt);
	MOVF        _segundo+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _segundo+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Recuperacao_Nota_Prova.c,252 :: 		if(segundo < 10)lcd_out_cp("0");
	MOVLW       128
	XORWF       _segundo+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escreve_hora212
	MOVLW       10
	SUBWF       _segundo+0, 0 
L__escreve_hora212:
	BTFSC       STATUS+0, 0 
	GOTO        L_escreve_hora134
	MOVLW       ?lstr31_Recuperacao_Nota_Prova+0
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVLW       hi_addr(?lstr31_Recuperacao_Nota_Prova+0)
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
L_escreve_hora134:
;Recuperacao_Nota_Prova.c,253 :: 		lcd_out_cp(ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;Recuperacao_Nota_Prova.c,254 :: 		}
L_end_escreve_hora:
	RETURN      0
; end of _escreve_hora

_relogio:

;Recuperacao_Nota_Prova.c,255 :: 		void relogio(){
;Recuperacao_Nota_Prova.c,256 :: 		if(segundo == 60){
	MOVLW       0
	XORWF       _segundo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio214
	MOVLW       60
	XORWF       _segundo+0, 0 
L__relogio214:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio135
;Recuperacao_Nota_Prova.c,257 :: 		segundo = 0;
	CLRF        _segundo+0 
	CLRF        _segundo+1 
;Recuperacao_Nota_Prova.c,258 :: 		minuto ++;
	INFSNZ      _minuto+0, 1 
	INCF        _minuto+1, 1 
;Recuperacao_Nota_Prova.c,259 :: 		}
L_relogio135:
;Recuperacao_Nota_Prova.c,260 :: 		if(minuto == 60){
	MOVLW       0
	XORWF       _minuto+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio215
	MOVLW       60
	XORWF       _minuto+0, 0 
L__relogio215:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio136
;Recuperacao_Nota_Prova.c,261 :: 		minuto = 0;
	CLRF        _minuto+0 
	CLRF        _minuto+1 
;Recuperacao_Nota_Prova.c,262 :: 		hora ++;
	INFSNZ      _hora+0, 1 
	INCF        _hora+1, 1 
;Recuperacao_Nota_Prova.c,263 :: 		}
L_relogio136:
;Recuperacao_Nota_Prova.c,264 :: 		if(hora == 24){
	MOVLW       0
	XORWF       _hora+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__relogio216
	MOVLW       24
	XORWF       _hora+0, 0 
L__relogio216:
	BTFSS       STATUS+0, 2 
	GOTO        L_relogio137
;Recuperacao_Nota_Prova.c,265 :: 		hora = 0;
	CLRF        _hora+0 
	CLRF        _hora+1 
;Recuperacao_Nota_Prova.c,266 :: 		segundo ++;
	INFSNZ      _segundo+0, 1 
	INCF        _segundo+1, 1 
;Recuperacao_Nota_Prova.c,267 :: 		dia_semana ++;
	INFSNZ      _dia_semana+0, 1 
	INCF        _dia_semana+1, 1 
;Recuperacao_Nota_Prova.c,268 :: 		dia++;
	INFSNZ      _dia+0, 1 
	INCF        _dia+1, 1 
;Recuperacao_Nota_Prova.c,269 :: 		}
L_relogio137:
;Recuperacao_Nota_Prova.c,270 :: 		}
L_end_relogio:
	RETURN      0
; end of _relogio
