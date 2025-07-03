module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    parameter IDLE=0 ,bit0=1,bit1=2,bit2=3,bit3=4,bit4=5,bit5=6,bit6=7,bit7=8,bit8=9,done1=10, IDLE1=11;
    reg [3:0] state, next_state;
    
    always@ (*)
        case(state)
            IDLE: if (in) next_state=IDLE; else next_state=bit0;
            bit0: next_state=bit1;
            bit1: next_state=bit2;
            bit2: next_state=bit3;
            bit3: next_state=bit4;
            bit4: next_state=bit5;
            bit5: next_state=bit6;
            bit6: next_state=bit7;
            bit7: next_state=bit8;
            bit8: if (in) next_state=done1; else next_state=IDLE1;
            IDLE1: if (in) next_state=IDLE; else next_state=IDLE1;
            done1: if (in) next_state=IDLE; else next_state=bit0;
        endcase
    
    
    always@ (posedge clk)
        if (reset)
            state<=IDLE;
    	else
            state<=next_state;
    assign done=(state==done1);
    
endmodule
