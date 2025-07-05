module top_module (input a, input b, input c, output out);//
	
    wire out1; //will need because we have to flip ouput of AND gate before assigning to out
    andgate inst1 (out1,  a, b, c, 1'b1, 1'b1 ); // order of port should be same as that at the time of decleration, Also A.B.1.1 == A.B
    assign out=~out1;

endmodule
