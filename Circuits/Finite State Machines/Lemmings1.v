module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter left=1'b0, right= 1'b1;
    reg state, next_state;
    
    always@ (posedge clk, posedge areset)
        if (areset)
            state=left;
    	else 
            state=next_state;
    
    always@(*)
        case(state)
            left: if (bump_left) next_state=right; else next_state=left;
            right: if (bump_right) next_state=left; else next_state=right;
        endcase
    
    assign walk_left=(state==left);
    assign walk_right=(state==right);
        
endmodule
