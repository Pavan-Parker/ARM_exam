     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg
	 IMPORT printMsg2p
	 IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	
;load given inputs
        VLDR.F32  S11, = 6.2857142857142857142857142857143; 2*pi
        VLDR.F32  S10, = 0.01746031746031746031746031746032; 2*pi / 360
        VLDR.F32  S0, = 0 ;load THETA
        VLDR.F32  S12, = 100;load R
        
        
;define outputs
         VLDR.F32  S13, = 1; r*sinx
         VLDR.F32  S14, = 1; r*cosx
         VLDR.F32  S15, = 1; VGA-x
         VLDR.F32  S16, = 1; VGA-y
         VLDR.F32  S17, = 320; VGA-X-ORIGIN-OFFSET 
         VLDR.F32  S18, = 240; VGA-Y-ORIGIN-OFFSET
         
         
       
        
        B start
;initialize
start       
        VLDR.F32  S2, = 1.0   ; i = for tracking the term currently being calculated 
        VLDR.F32  S3, = 1.0   
        VLDR.F32  S1, = 0.0   
        VLDR.F32  S5, = 1.0   ; for incrementing in future
        VLDR.F32  S4, = 1.0   ; temp
        VLDR.F32  S8, = 1.0   ; temp with sign
        VLDR.F32  S9, = 0.0   ; const 0

        VLDR.F32  S6, = 0.0   ; sin THETA
        VLDR.F32  S7, = 1.0   ; cos THETA
    
        MOV       R6, #0x1   ; track if the term is for sin or cos
        MOV       R7, #0x0   ; track the sign
        
        
        
continue
		VCMP.F32 S3, S1       ; (i==n)
		VMRS APSR_nzcv, FPSCR 
        BEQ nextangle	      ; exit if equal
            
        VMOV.F32 S1, S3       ; copy previous result
        
        VMUL.F32 S4, S4, S0   ; temp = temp*THETA
        VDIV.F32 S4, S4, S2   ; temp = temp/i
            

        CBZ    R7, positive   ; check sign
        CBNZ   R7, negative   ; check sign
        
chalochalo
        
        CBZ    R6, cos             
        CBNZ   R6, sin        ; check sin or cos
        
        

result

        VDIV.F32 S3, S6, S7
        
        VADD.F32 S2, S2, S5   ; i++
        
        CMP   R6, #0x0
        ITE   EQ
        MOVEQ R6, #0x1
        MOVNE R6, #0x0
        
        B continue			  ; next iteration
positive
        VADD.F32 S8, S9, S4   ; signtemp=temp
        B chalochalo
negative
        VSUB.F32 S8, S9, S4   ;signtemp=-temp
        B chalochalo

sin
        VADD.F32 S6, S6, S8   ; sinresult += sinresult+signtemp 
        CMP R7, #0x0
        ITE    EQ
        MOVEQ R7, #0x1
        MOVNE R7, #0x0
        B result
 
cos
        VADD.F32 S7, S7, S8   ; cosresult += cosresult+signtemp 
        B result


nextangle
;PRINT
        VMUL.F32 S13 , S12 , S6  ; R*SINX
        VMUL.F32 S14 , S12 , S7  ; R*COSX
        VSUB.F32 S15 , S17 , S13 ; VGA-X
        VSUB.F32 S16 , S18 , S14 ; VGA-Y
        
        
        VMOV.F32 R3, S12        ;RADIUS
        VMOV.F32 R2, S0         ;THETA
        VMOV.F32 R1, S15        ;X
        VMOV.F32 R0, S16        ;Y
        BL printMsg             ; FORMAT - (r,theta,x,y)
        
;NEXT ANGLE OR DONE?        
        
        VCMP.F32 S0, S11 ;      THETA > 2*pi ?
        VMRS APSR_nzcv, FPSCR 
        BGT stop        ; YES, STOP.
        VADD.F32 S0, S0, S10    ; NO, next angle
        B start

stop    B stop ; stop program
     ENDFUNC
     END