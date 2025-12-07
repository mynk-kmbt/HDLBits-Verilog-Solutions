module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
	
    wire [99:-1] carry;
    assign carry[-1]=cin;
    assign cout=carry[99];
    genvar i;
    generate
        for (i=0; i<100; i++)
            begin: BCD_ADDERS
                bcd_fadd inst (a[4*i +3: 4*i],b[4*i +3: 4*i],carry[i-1],carry[i],sum[4*i +3: 4*i]);
            end
    endgenerate
    
endmodule
