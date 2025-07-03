module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
    
    parameter IDLE=0 ,bit0=1,bit1=2,bit2=3,bit3=4,bit4=5,bit5=6,bit6=7,bit7=8,bit8=9, bit9=10, done1=11, IDLE1=12;
    reg [3:0] state, next_state;
    reg [8:0] bytes; 
    always@ (*)
        case(state)
            IDLE: if (in) next_state=IDLE; else next_state=bit0;
            bit0: begin bytes[0]=in; next_state=bit1; end
    		bit1: begin bytes[1]=in; next_state=bit2; end
    		bit2: begin bytes[2]=in; next_state=bit3; end
    		bit3: begin bytes[3]=in; next_state=bit4; end
    		bit4: begin bytes[4]=in; next_state=bit5; end
    		bit5: begin bytes[5]=in; next_state=bit6; end
    		bit6: begin bytes[6]=in; next_state=bit7; end
    		bit7: begin bytes[7]=in; next_state=bit8; end
            bit8: begin bytes[8]=in; 
                if (^bytes) next_state=bit9;
                else  next_state=IDLE1; end
            bit9: if (in) next_state=done1; else next_state=IDLE1;
            IDLE1: if (in) next_state=IDLE; else next_state=IDLE1;
            done1: if (in) next_state=IDLE; else next_state=bit0;
        endcase
    
    
    always@ (posedge clk)
        if (reset)
            state<=IDLE;
    	else
            state<=next_state;
    
    always@ (posedge clk)
       	out_byte<=bytes;
    
    assign done=(state==done1);
    
endmodule
