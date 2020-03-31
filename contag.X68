*------------------------------------------------------------------
* Program    : Countgs
* Written by : Lucio Schenkel
* Date       : 03/29/2020
* Description: This program takes in a string and returns the 
*              number of gs on it.
*------------------------------------------------------------------
START   ORG     $1000
        LEA     MESSAGE,A1      Loads message in a1
        MOVE.B  #14,D0          Loads 14 in d0
        TRAP    #15             Displays the content of a1
        
        MOVE.B  #2,D0           Loads 2 in d0
        TRAP    #15             Get string input from user
      
LOOP:        
        CMP.L   D1,D3           Compares d3 to d1 wich is the number of characters
        BEQ     DONE            If thei're equal, jump to finish
        
        MOVE.B  (A1)+,D4        Loads one byte from the string        
        CMP.B   #$47,D4         Is uppercase G
        BEQ     COUNT           Counts if yes
        
        CMP.B   #$67,D4         Is lowercase g
        BEQ     COUNT           Counts if yes
NEXT:        
        ADD.L   #1,D3           Increments iterations
        BRA     LOOP            Go to next iteration

DONE:
        LEA     FINAL,A1        Loads the final message at a1
        MOVE.B  #14,D0          Loads 14 in d0
        TRAP    #15             Displays the message at a1

        MOVE.L  D5,D1           Loads the number of gs in d1
        MOVE.B  #3,D0           Loads 3 in d0
        TRAP    #15             Displays the number in d0
         
        MOVE.B  #9,D0           Loads 9 in d0
        TRAP    #15             Halts the simulator
        
COUNT:
        ADDI.L  #1,D5           Increments number of gs
        BRA     NEXT            Go to the end of the iteration
        
MESSAGE DC.B    'Digite uma frase para contar as letras g: ',0
FINAL   DC.B    'Numero de Gs: ',0

        END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
