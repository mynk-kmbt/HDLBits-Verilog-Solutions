module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    
    always @(posedge clk)
        if (~q&a&b | q&~a&~b)
            state<=~state;
    	else 
            state<=state;
    assign q= state? ~(a^b) :a^b;


endmodule
