module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
  output [7:0] out  ); // out should also be 8 bits

  assign out = ({8{sel}} & a) | (~{8{sel}} & b); // convert sel from 1 bit to 8 bits then apply bitwise operator
  // Also for some reason they expect b when sel =0 and a when sel=1

  // this will also work
  // assign out = sel ? a : b;

endmodule
