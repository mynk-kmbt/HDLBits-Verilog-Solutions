module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    always@(posedge clk, posedge areset)
        if(areset) state<=2'b01;
    else if(train_valid & train_taken) 
        if (state==3'b11) state<=3'b11;
    	else state<=state+1'b1;
    else if(train_valid & ~train_taken) 
        if (state==3'b00) state<=3'b00;
    	else state<=state-1'b1;
    else state<=state;

endmodule
