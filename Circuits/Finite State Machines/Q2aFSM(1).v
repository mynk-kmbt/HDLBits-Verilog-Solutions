module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    reg [1:0] state, next_state;
    
    always @ (*)
        case(state)
            A:
                if (r[1]) next_state<=B;
            	else if (r[2]) next_state<=C;
            	else if (r[3]) next_state<=D;
            	else next_state<=A;
            
            B: if (r[1]) next_state<=B; else next_state<=A;
            C: if (r[2]) next_state<=C; else next_state<=A;
            D: if (r[3]) next_state<=D; else next_state<=A;
        endcase
    
    always@ (posedge clk )
        if (~resetn)
            state<=A;
    	else 
            state<=next_state;
    
    assign g= {(state==D),(state==C),(state==B) };
                
                
                    
endmodule
