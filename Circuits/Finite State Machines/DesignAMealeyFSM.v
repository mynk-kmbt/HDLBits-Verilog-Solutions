module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter A=2'd0, B=2'd1, C=2'd2;
    reg [1:0] state, next_state;
    
    always@ (*)
        case (state)
            A:	begin
            		next_state=x?B:A;
                	z=1'b0;
            	end
            B:
                begin
            		next_state=x?B:C;
                	z=1'b0;
            	end
            C:
                begin
            		next_state=x?B:A;
                	z=x?1'b1:1'b0;
            	end
        endcase
    
    
    always@(posedge clk, negedge aresetn)
        if (~aresetn)
            state<=A;
    	else 
            state<=next_state;
                        

endmodule
