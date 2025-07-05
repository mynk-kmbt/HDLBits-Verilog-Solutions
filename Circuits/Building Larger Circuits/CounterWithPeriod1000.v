module top_module (
    input clk,
    input reset,
    output [9:0] q);
    
    always @(posedge clk)
        if (reset)
            q<=10'd0;
    	else
            if (q==10'd999)
                q<=10'd0;
    		else
                q<=q+1'b1;
    

endmodule
