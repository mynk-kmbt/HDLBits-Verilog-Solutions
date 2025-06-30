module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    wire [511:0] Left, Right, Centre;
    assign Right={q[510:0],1'b0};
    assign Left={1'b0,q[511:1]};
    assign Centre=q;
    
    always@(posedge clk)
        if (load)
            q<=data;
    	else
            q<=  (Left&(Centre^Right)) | ((~Left)&(Centre|Right));
endmodule
