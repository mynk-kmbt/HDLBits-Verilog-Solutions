module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire low_cout, no_use1, no_use0;
    wire [15:0] low_cin, high_cin ;
    
    add16 lower_bytes (a[15:0], b[15:0], 1'b0, sum[15:0], low_cout);
    
    add16 higer_bytes_cin1 (a[31:16], b[31:16], 1'b1, high_cin, no_use1);
    add16 higer_bytes_cin0 (a[31:16], b[31:16], 1'b0, low_cin, no_use0);
    
    assign sum[31:16] = low_cout? high_cin : low_cin ;


endmodule
