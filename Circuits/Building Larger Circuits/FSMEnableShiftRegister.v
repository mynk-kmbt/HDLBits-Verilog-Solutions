module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    parameter A=0, B=1, C=2, D=3, E=4;
    
    reg [2:0] state, next_state;
    
    always @ (*)
        case(state)
            A: next_state<=B;
            B: next_state<=C;
            C: next_state<=D;
            D: next_state<=E;
            E: next_state<=E;
        endcase
    
    always@ (posedge clk)
        if (reset)
            state<=A;
    	else
            state<=next_state;
    
    assign shift_ena= (state==A | state==B | state==C |state==D );

endmodule
