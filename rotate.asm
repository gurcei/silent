"; ROTATE - ASSEMBLY VERSION""; 17/04/2024 - GURCE""""; ASSEMBLE WITH MEGA-A, THEN RUN WITH MEGA-R""""; IT WILL BUILD A FILE 'ASMROTATE' ON YOUR DISK""""; LOAD IT WITH BLOAD 'ASMROTATE',B0""""; RUN IT WITH BANK 0:SYS $1800""""ZPTR32 = $FC""""    *=$1800,'ASMROTATE'"".PAUSE""    ; BACKUP ZPTR32""      LDA ZPTR32""      STA ZBKP""      LDA ZPTR32+1""      STA ZBKP+1""      LDA ZPTR32+2""      STA ZBKP+2""      LDA ZPTR32+3""      STA ZBKP+3""""    ; INIT""      LDA #$00""      STA Y1ADD""      STA Y1ADD+1""""    ; FOR Y = 0 TO 49""      LDY #$00""""        ; CX = TX""LP1       LDA TX""          STA CX""          LDA TX+1""          STA CX+1""          LDA TX+2""          STA CX+2""          LDA #$00""          STA TX+3""          STA CX+3""""        ; CY = TY""          LDA TY""          STA CY""          LDA TY+1""          STA CY+1""          LDA TY+2""          STA CY+2""          LDA #$00""          STA TY+3""          STA CY+3""""        ; FOR X = 0 TO 79""          LDX #$00""""            ; POKE $FF80000 + X + Y1ADD, PEEK($40000 + CX/256 + CY/256 * 96)""                ; PUT $40000 IN ZPTR32""LP2               LDA #$00""                  STA ZPTR32""                  STA ZPTR32+1""                  STA ZPTR32+3""                  LDA #$04""                  STA ZPTR32+2""""                ; ADD CX HIGH BYTE INTO ZPTR32""                  LDA CX+2""                  CLC""                  ADC ZPTR32""                  STA ZPTR32""                  LDA #$00""                  ADC ZPTR32+1""                  STA ZPTR32+1""""                ; PUT CY HIGH BYTE INTO TMPW1 AND LEFT-SHIFT 5 TIMES""                  CLC""                  LDA CY+2""                  STA TMPW1""                  LDA #$00""                  STA TMPW1+1""                  STA TMPW1+2""                  STA TMPW1+3""                  ASW TMPW1""                  ASW TMPW1""                  ASW TMPW1""                  ASW TMPW1""                  ASW TMPW1""""                ; STORE THIS SHIFTED VALUE INTO TMPW2""                  LDA TMPW1""                  STA TMPW2""                  LDA TMPW1+1""                  STA TMPW2+1""                  LDA TMPW1+2""                  STA TMPW2+2""                  LDA TMPW1+3""                  STA TMPW2+3""""                ; ADD IT TO TMPW1 3 TIMES (TO GET MULTIPLE OF 96)""                  LDZ #$03""""LP3               CLC""                  LDA TMPW2""                  ADC TMPW1""                  STA TMPW1""                  LDA TMPW2+1""                  ADC TMPW1+1""                  STA TMPW1+1""                  LDA TMPW2+2""                  ADC TMPW1+2""                  STA TMPW1+2""                  LDA TMPW2+3""                  ADC TMPW1+3""                  STA TMPW1+3""""                  DEZ""                  BNE LP3""""                ; THEN ADD TMPW1 TO ZPTR32""                  CLC""                  LDA TMPW1""                  ADC ZPTR32""                  STA ZPTR32""                  LDA TMPW1+1""                  ADC ZPTR32+1""                  STA ZPTR32+1""                  LDA TMPW1+2""                  ADC ZPTR32+2""                  STA ZPTR32+2""""                ; PERFORM THE PEEK AND STORE IT IN PEEKVAL""                  LDZ #$00""                  LDA [ZPTR32],Z""                  STA PEEKVAL""""                ; PUT $FF80000 INTO ZPTR32""                  LDA #$00""                  STA ZPTR32""                  STA ZPTR32+1""                  LDA #$F8""                  STA ZPTR32+2""                  LDA #$0F""                  STA ZPTR32+3""""                ; ADD X TO ZPTR32""                  TXA""                  CLC""                  ADC ZPTR32""                  STA ZPTR32""                  LDA #$00""                  ADC ZPTR32+1""                  STA ZPTR32+1""""                ; ADD Y1ADD TO ZPTR32""                  CLC""                  LDA Y1ADD""                  ADC ZPTR32""                  STA ZPTR32""                  LDA Y1ADD+1""                  ADC ZPTR32+1""                  STA ZPTR32+1""""                ; POKE THIS ZPTR32 LOCATION WITH PEEKVAL""                  LDZ #$00""                  LDA PEEKVAL""                  STA [ZPTR32],Z""""            ; CX = CX + XINC""              CLC""              LDA XINC""              ADC CX""              STA CX""              LDA XINC+1""              ADC CX+1""              STA CX+1""              LDA XINC+2""              ADC CX+2""              STA CX+2""              LDA XINC+3""              ADC CX+3""              STA CX+3""""            ; CY = CY + YINC""              CLC""              LDA YINC""              ADC CY""              STA CY""              LDA YINC+1""              ADC CY+1""              STA CY+1""              LDA YINC+2""              ADC CY+2""              STA CY+2""              LDA YINC+3""              ADC CY+3""              STA CY+3""""        ; NEXT X""        INX""        CPX #80""        BNE !LP2""""        ; TX = TX + TXINC""          CLC""          LDA TXINC""          ADC TX""          STA TX""          LDA TXINC+1""          ADC TX+1""          STA TX+1""          LDA TXINC+2""          ADC TX+2""          STA TX+2""          LDA TXINC+3""          ADC TX+3""          STA TX+3""""        ; TY = TY + TYINC""          CLC""          LDA TYINC""          ADC TY""          STA TY""          LDA TYINC+1""          ADC TY+1""          STA TY+1""          LDA TYINC+2""          ADC TY+2""          STA TY+2""          LDA TYINC+3""          ADC TY+3""          STA TY+3""""        ; Y1ADD = Y1ADD + 80""          CLC""          LDA #80""          ADC Y1ADD""          STA Y1ADD""          LDA #$00""          ADC Y1ADD+1""          STA Y1ADD+1""""    INY""    CPY #50""    BNE !LP1""""    ; RESTORE ZPTR32""    LDA ZBKP""    STA ZPTR32""    LDA ZBKP+1""    STA ZPTR32+1""    LDA ZBKP+2""    STA ZPTR32+2""    LDA ZBKP+3""    STA ZPTR32+3""""    CLI""    RTS""""""    *=$1A00""TX           .LONG 0""TY           .LONG 0""XINC         .LONG 0""YINC         .LONG 0""TXINC        .LONG 0""TYINC        .LONG 0""""Y1ADD        .WORD 0""CX           .LONG 0""CY           .LONG 0""ZBKP         .LONG 0""PEEKVAL      .BYTE 0""TMPW1        .LONG 0""TMPW2        .LONG 0"*