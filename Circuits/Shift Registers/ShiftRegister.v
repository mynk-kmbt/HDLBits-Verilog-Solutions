module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0]q;
    always@(posedge clk)
        if (~resetn)
            q<=4'b0;
    	else
            q<={in,q[3:1]};
    
    assign out = q[0];

endmodule
