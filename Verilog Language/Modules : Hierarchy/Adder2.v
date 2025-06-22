module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    
    wire low_cout, no_use;
    
    add16 lower_bytes (a[15:0], b[15:0], 1'b0, sum[15:0], low_cout);
    add16 higer_bytes (a[31:16], b[31:16], low_cout, sum[31:16], no_use);

endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

	assign sum=a^b^cin;
    assign cout= (a&b) | (b&cin) | (cin&a) ;
    
    // Easier Implementation
    // assign {cout,sum} = a+b+cin ;
endmodule
