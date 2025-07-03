module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging );
    
    parameter [2:0] left=3'b00, right=3'b01, leftgnd=3'b10, rightgnd=3'b11, digleft=3'd4, digright=3'd5;
    
    reg [2:0] state, next_state;
    
    always@ (*)
        case(state)
            left: 
                	begin
                        if (dig&ground)
                            next_state=digleft;                          
                        else if (ground)
                            if (bump_left) next_state=right; else next_state=left;
                        else
                            next_state=leftgnd;
                    end
            right:
                	begin
                        if (dig&ground)
                            next_state=digright;                          
                        else if (ground)
                            if (bump_right) next_state=left; else next_state=right;
                        else
                            next_state=rightgnd;
                    end
            leftgnd: if (ground) next_state=left; else next_state=leftgnd;
            rightgnd: if (ground) next_state=right; else next_state=rightgnd;
            
            digleft: if (ground) next_state=digleft; else next_state=leftgnd;
            digright: if (ground) next_state=digright; else next_state=rightgnd;
        endcase
    
    always@(posedge clk, posedge areset)
        if (areset)
            state<=left;
    	else
            state<=next_state;
    
    assign walk_left=(state==left);
    assign walk_right=(state==right);
    
    assign aaah=(state==leftgnd)|(state==rightgnd);
    assign digging= (state==digleft)|(state==digright);

endmodule
