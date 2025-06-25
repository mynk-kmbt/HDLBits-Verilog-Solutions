module top_module (
    input clk,
    input reset,       
    output [3:0] q);

    always  @(posedge clk)
        if (reset | q==4'd10)
            q<=1;
    	else 
            q<=q+1'b1;
    
endmodule

