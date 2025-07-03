module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter [1:0] left=2'b00, right=2'b01, leftgnd=2'b10, rightgnd=2'b11;
    
    reg [1:0] state, next_state;
    
    always@ (*)
        case(state)
            left: 
                	begin
                        if (ground)
                            if (bump_left) next_state=right; else next_state=left;
                        else
                            next_state=leftgnd;
                    end
            right:
                	begin
                        if (ground)
                            if (bump_right) next_state=left; else next_state=right;
                        else
                            next_state=rightgnd;
                    end
            leftgnd: if (ground) next_state=left; else next_state=leftgnd;
            rightgnd: if (ground) next_state=right; else next_state=rightgnd;
        endcase
    
    always@(posedge clk, posedge areset)
        if (areset)
            state=left;
    	else
            state=next_state;
    
    assign walk_left=(state==left);
    assign walk_right=(state==right);
    
    assign aaah=state[1];
                
            
            

endmodule
