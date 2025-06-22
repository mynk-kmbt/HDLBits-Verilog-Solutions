// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    //casex should be used instead of case for priorty encoder it will reduce the hassle.
    always @ (*)
        casex (in)
            4'bxxx1: pos=2'b0;
            4'bxx10: pos=2'b1;
            4'bx100: pos=2'b10;
            4'b1000: pos=2'b11;
			default : pos=0;
        endcase
endmodule
