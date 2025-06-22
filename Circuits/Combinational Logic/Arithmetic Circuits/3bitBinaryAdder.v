module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    fadder inst0 (a[0], b[0], cin, sum[0], cout[0]);
    fadder inst1 (a[1], b[1], cout[0], sum[1], cout[1]);
    fadder inst2 (a[2], b[2], cout[1], sum[2], cout[2]);
endmodule

module fadder(input a, b, cin, output sum, cout);
    assign cout= (cin&(a^b)) | (a&b);
    assign sum= a^b^cin;
endmodule
