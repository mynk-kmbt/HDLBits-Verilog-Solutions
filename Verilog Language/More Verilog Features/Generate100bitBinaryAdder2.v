module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    adder inst0 (a[0],b[0],cin,sum[0],cout[0]);
    genvar i ;
    generate
        for( i=1; i<100; i++ ) 
            begin : ADDER
            adder inst (a[i],b[i],cout[i-1],sum[i],cout[i]);
            end
        endgenerate
    
endmodule

module adder(input a,b,cin, output sum, cout);
    assign {cout,sum}=a+b+cin;
endmodule
