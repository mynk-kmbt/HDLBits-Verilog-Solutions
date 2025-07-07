module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0, mux1;  // wire has to 8 bits
    mux2 inst0 ( sel[0],    a,    b, mux0 ); // instance name can't be same as wire name
    mux2 inst1 ( sel[0],    c,    d, mux1 ); // sel[0] instead of sel[1]
    mux2 inst2 ( sel[1], mux0, mux1,  out );

endmodule
