module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @(posedge clk)
        if (reset )
            q<=4'b0;
    	else if (slowena)
            if (q==4'd9)
                q<=4'b0;
    		else
                q<=q+1'b1;
    	else
            q<=q;
endmodule
