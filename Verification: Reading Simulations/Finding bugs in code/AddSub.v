// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (~(|out)) // ~ out will complement bitwise and check if whole value is 0, this will work for singlw bit but not for multiple bit, for mutiple bit value we have to check that all bits should be 0, hence |out and then complement this 1 bit value 
            result_is_zero = 1;
        else
            result_is_zero = 0; // Add else condition, w/o it if result_is_zero becoms 1 once it will forever remain 1
            
    end

endmodule
