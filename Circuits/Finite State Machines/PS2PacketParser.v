module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter [1:0] A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    reg [1:0] state, next_state;
    // State transition logic (combinational)
    always@(*)
        case(state)
            A: if (in[3]) next_state=B; else next_state=A;
            B: next_state=C;
            C: next_state=D;
            D: if (in[3]) next_state=B; else next_state=A;
        endcase
    // State flip-flops (sequential)
    always @(posedge clk)
        if (reset)
            state<=A;
        else
            state<=next_state;
             
    // Output logic
    assign done=(state==D);
            

endmodule
