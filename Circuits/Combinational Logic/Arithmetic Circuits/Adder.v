module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [3:0]cout;
    
    fadder inst0 (x[0], y[0] , 1'b0, sum[0], cout[0]);
    fadder inst1 (x[1], y[1] , cout[0], sum[1], cout[1]);
    fadder inst2 (x[2], y[2] , cout[1], sum[2], cout[2]);
    fadder inst3 (x[3], y[3] , cout[2], sum[3], sum[4]);
    
    //assign sum=x+y; 
endmodule


module fadder(input a, b, cin, output sum, cout);
    assign cout= (cin&(a^b)) | (a&b);
    assign sum= a^b^cin;
endmodule
