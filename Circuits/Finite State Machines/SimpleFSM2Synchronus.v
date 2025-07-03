module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out);

    parameter OFF=1'b0, ON=1'b1;
    
    reg state, next_state;
    
    always @  (posedge clk)
        if (reset) state<=OFF;
    	else state<=next_state;
    
    always  @ (*)
        case (state)
            OFF: if (j) next_state<=ON;  else next_state<=OFF;
            ON: if (k) next_state<=OFF ; else next_state<=ON;
        endcase
    
    assign out= (state==ON);

endmodule
