module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    parameter [1:0] A=2'b01, B=2'b10;
    
    reg [1:0] state, next_state;
    
    always@(*)
        case(state)
            A: 
                begin
                    next_state= x?B:A ;
                    z= x ;
            	end
            B: 
                begin
                    next_state= B ;
                    z= x?1'b0:1'b1 ;
            	end
        endcase
    
    always@(posedge clk, posedge areset)
        if (areset)
            state<=A;
    	else
            state<=next_state;

endmodule
