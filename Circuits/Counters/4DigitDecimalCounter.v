module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena={q[11:0]==12'h999,q[7:0]==8'h99,q[3:0]==4'h9};
    
    BCD inst0 (clk,reset,1'b1,q[3:0]);
    BCD inst1 (clk,reset,ena[1],q[7:4]);
    BCD inst2 (clk,reset,ena[2],q[11:8]);
    BCD inst3 (clk,reset,ena[3],q[15:12]);
    
endmodule

module BCD(input clk, reset, en, output reg [3:0] Q);
    always@ (posedge clk)
        if (reset)
            Q<=0;
    	else
            if(en)
                if (Q==4'h9)
                    Q<=4'b0;
    			else
	                Q<=Q+1'b1;
    		else
                Q<=Q;
endmodule
