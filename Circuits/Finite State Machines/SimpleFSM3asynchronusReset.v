module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    parameter[1:0] A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    
    reg [1:0] state, next_state;
    // State transition logic
    assign next_state[0]=in;
    assign next_state[1]= (~in&state[0])| (in&state[1]&~state[0]);
    
    // State flip-flops with asynchronous reset
    always@ (posedge clk, posedge areset)
        if (areset)
            state<=A;
    	else
            state<=next_state;
    // Output logic
    assign out=(state==D);

endmodule
