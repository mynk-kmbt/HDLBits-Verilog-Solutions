module top_module (
    input clk,
    input d,
    output q
);
	reg posq,negq;
    
    always@(posedge clk)
        posq<=d;
    always@(negedge clk)
        negq<=d;
    
    assign q=clk?posq:negq;
endmodule
