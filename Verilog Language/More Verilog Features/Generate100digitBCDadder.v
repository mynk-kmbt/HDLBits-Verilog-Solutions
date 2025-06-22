module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
	wire [99:0] carry;
    
    bcd_fadd inst1 (a[3:0], b[3:0], cin,carry, sum[3:0] );
    
    genvar i;
    generate
        for(i=1;i<100;i=i+1)begin : gen_blck
            bcd_fadd inst (a[4*i+3:4*i], b[4*i+3:4*i], carry[i-1],carry[i], sum[4*i+3:4*i] );
        end
    endgenerate
    
    assign cout=carry[99];
    

endmodule
