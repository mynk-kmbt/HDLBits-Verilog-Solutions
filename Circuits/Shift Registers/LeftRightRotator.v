module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @(posedge clk, posedge areset)
        if (areset)
            q<=4'd0;
    	else if (load)
        	q<=data;
    	else if (ena)
            q<=q[3:1]; //RHS is 3bits and LHS is 4 bits , 3bits of RHS will be assigned to lower 3 bits of RHS and leftover bits will be assigned 0
		else
            q<=q;
endmodule
