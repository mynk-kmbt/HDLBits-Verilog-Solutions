module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 
    
    wire [17:0] graph [0:17];
    wire [15:0] tabl [0:15];
    
    assign tabl[0]=q[15:0];     assign tabl[1]=q[31:16];     assign tabl[2]=q[47:32];     assign tabl[3]=q[63:48];     assign tabl[4]=q[79:64];     assign tabl[5]=q[95:80];     assign tabl[6]=q[111:96];     assign tabl[7]=q[127:112];     assign tabl[8]=q[143:128];     assign tabl[9]=q[159:144];     assign tabl[10]=q[175:160];     assign tabl[11]=q[191:176];     assign tabl[12]=q[207:192];     assign tabl[13]=q[223:208];     assign tabl[14]=q[239:224];     assign tabl[15]=q[255:240];
    
    assign graph[0]= {tabl[15][0],tabl[15],tabl[15][15]};
    assign graph[1]= {tabl[0][0],tabl[0],tabl[0][15]};
    assign graph[2]= {tabl[1][0],tabl[1],tabl[1][15]};
    assign graph[3]= {tabl[2][0],tabl[2],tabl[2][15]};
    assign graph[4]= {tabl[3][0],tabl[3],tabl[3][15]};
    assign graph[5]= {tabl[4][0],tabl[4],tabl[4][15]};
    assign graph[6]= {tabl[5][0],tabl[5],tabl[5][15]};
    assign graph[7]= {tabl[6][0],tabl[6],tabl[6][15]};
    assign graph[8]= {tabl[7][0],tabl[7],tabl[7][15]};
    assign graph[9]= {tabl[8][0],tabl[8],tabl[8][15]};
    assign graph[10]= {tabl[9][0],tabl[9],tabl[9][15]};
    assign graph[11]= {tabl[10][0],tabl[10],tabl[10][15]};
    assign graph[12]= {tabl[11][0],tabl[11],tabl[11][15]};
    assign graph[13]= {tabl[12][0],tabl[12],tabl[12][15]};
    assign graph[14]= {tabl[13][0],tabl[13],tabl[13][15]};
    assign graph[15]= {tabl[14][0],tabl[14],tabl[14][15]};
    assign graph[16]= {tabl[15][0],tabl[15],tabl[15][15]};
    assign graph[17]= {tabl[0][0],tabl[0],tabl[0][15]};
    
    integer i,j,k;
    
    always @ (posedge clk)
        if(load) q<=data;
    	else 
            for (i=1;i<17;i=i+1)
                begin
                    for(j=1;j<17;j=j+1)
                        begin
	                        k=graph[i+1][j]+graph[i-1][j]+graph[i][j+1]+graph[i][j-1]+graph[i+1][j+1]+graph[i+1][j-1]+graph[i-1][j+1]+graph[i-1][j-1];
                            case (k)
                                0:q[16*(i-1) + (j-1)]<=0;
                                1:q[16*(i-1) + (j-1)]<=0;
                                2:q[16*(i-1) + (j-1)]<=q[16*(i-1) + (j-1)];
                                3:q[16*(i-1) + (j-1)]<=1;
                                default: q[16*(i-1) + (j-1)]<=0;
                            endcase
                        end
                end

endmodule
