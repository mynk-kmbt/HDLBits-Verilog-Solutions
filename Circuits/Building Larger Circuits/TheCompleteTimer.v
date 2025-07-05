module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    //1101 detector
    parameter [3:0] A=3'b0, B=3'b01, C=3'b10, D=3'b11, E=3'b100 ,A1=5, B1=6, C1=8, D1=9, E1=10, F1=11;
    reg [3:0] state, next_state;
	wire shift_ena, done_counting;
    always@(*)
        case(state)
            A:next_state=data?B:A;
            B:next_state=data?C:A;
            C:next_state=data?C:D;
            D:next_state=data?A1:A;
            //E:next_state=A1;
            A1:next_state=B1;
            B1:next_state=C1;
            C1:next_state=D1;
            D1:next_state=E1;
            E1:next_state=done_counting?F1:E1;
            F1:next_state=ack?A:F1;
        endcase
    
    always@(posedge clk)
        if (reset) state<=A;
    	else state<=next_state;
    
    reg [3:0] delay;
    
    always@(posedge clk)
        if (reset) delay<=0;
    	else if (shift_ena) delay<={delay[2],delay[1],delay[0],data};
    
    reg [9:0] counter0;
    reg [4:0] counter1;
    always@(posedge clk)
        if (reset) begin counter0<=0; counter1<=0; end
    	else if(counting)
            if (counter0==999) begin counter0<=0; counter1<=counter1+1; end
            else counter0<=counter0+1;
    	else begin counter0<=0; counter1<=0; end
            
            
    assign shift_ena= (state==A1) | (state==B1) | (state==C1) | (state==D1); 
    assign count = delay - counter1; 
    assign counting= (state==E1);
    assign done= (state==F1);
    assign done_counting= (count==0) & (counter0==10'd999);
    

endmodule
