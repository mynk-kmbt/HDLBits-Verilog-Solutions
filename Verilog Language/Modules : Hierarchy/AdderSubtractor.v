module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire low_cout, no_use;
    wire [31:0] b1;
    
    assign b1= {32{sub}}^b;
    
    add16 lower_bytes (a[15:0], b1[15:0], sub, sum[15:0], low_cout);
    add16 higer_bytes (a[31:16], b1[31:16], low_cout, sum[31:16], no_use);
    
endmodule
