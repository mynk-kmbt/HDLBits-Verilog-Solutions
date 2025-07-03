module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter [1:0] A=2'b0, B=2'd1, C=2'd2, D=2'd3;

    // State transition logic: next_state = f(state, in)
    assign next_state[0]=in;
    assign next_state[1]= (~in&state[0])| (in&state[1]&~state[0]);
    // Output logic:  out = f(state) for a Moore state machine
    assign out =(state==D);

endmodule
