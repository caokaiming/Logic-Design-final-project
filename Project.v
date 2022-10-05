module PJ(datain,dataout,wr,rd,sel,math,clk,rst_n,full,empty,result);
input [3:0]datain;
input wr;//write 
input rd;//read
input sel;//sel FIFO or LIFO
input [1:0]math;
input clk,rst_n;
output reg [3:0]dataout;
output full;
output empty;
output reg [7:0]result;

parameter F=0,L=1;
reg [3:0]mem[6:0];//4x7 fifo memory spacce
reg [2:0]wrptr,rdptr;//write pointer and read pointer
reg [2:0]Length;
reg mode;
reg [4:0]tmp1,tmp2,tmp3,tmp4,tmp5;
reg [2:0]index;
integer i;
assign full=(Length==3'b111)?1:0;
assign empty=(Length==3'b000)?1:0;

always@(*)begin
    case(sel)
	0:mode<=F;//mode0=>FIFO 
	default:mode<=L;//mode1=>LIFO
    endcase
end
always@(*)begin
     if(empty) 
         dataout<=4'bxxxx;
     else
         dataout<=dataout;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
	wrptr<=0;
    if(wr && (wrptr==3'b110))
	wrptr<=0;
    else if(wr)
	wrptr<=wrptr+1;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
	rdptr<=0;
    else if(rd && (rdptr==3'b110))
	rdptr<=0;
    else if(rd)
	rdptr<=rdptr+1;
end
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
	Length<=0;
    else begin
        if(wr && ~rd)
	   Length<=Length+1;
        else if(~wr && rd)
	   Length<=Length-1;
    end
end
always@(posedge clk)begin
    if(wr)
        case(mode)
           F:mem[wrptr]<=datain;
           L:mem[Length]<=datain;
        endcase
end

always@(posedge clk)begin
    index<=Length;
    if(rd && (mode==L))
        index<=index-1;
end

always@(negedge clk)begin
    if(rd)begin
	case(mode)
            F:begin 
                 dataout=mem[rdptr];
            end
            L:begin
                 dataout=mem[index];                
            end
        endcase
    end
    else 
        dataout=4'bxxxx;
end
always@(*)begin
    if(empty)begin
        wrptr<=0;
        rdptr<=0;
    end
end
always@(*)begin
     if(full) begin
        case(math)
            0:begin
         	tmp1=mem[0]+mem[1];
         	tmp2=mem[2]+mem[3];
         	tmp3=mem[4]+mem[5];
         	result=mem[6]+tmp1+tmp2+tmp3;
            end
            1:begin
         	if(mem[0]>=mem[1])
             	    tmp1=mem[0];
         	else
             	    tmp1=mem[1];
         	if(mem[2]>=mem[3])
                    tmp2=mem[2];
         	else
             	    tmp2=mem[3];
         	if(mem[4]>mem[5])
                    tmp3=mem[4];
         	else
                    tmp3=mem[5];
         	if(mem[6]>=tmp1)
                    tmp4=mem[6];
         	else
                    tmp4=tmp1;
         	if(tmp2>=tmp3)
                    tmp5=tmp2;
                else
                    tmp5=tmp3;
                if(tmp4>=tmp5)
                    result=tmp4;
                else
                    result=tmp5;
            end
            2:begin
         	if(mem[0]<=mem[1])
                    tmp1=mem[0];
         	else
             	    tmp1=mem[1];
         	if(mem[2]<=mem[3])
                    tmp2=mem[2];
         	else
                    tmp2=mem[3];
         	if(mem[4]<mem[5])
                    tmp3=mem[4];
         	else
                    tmp3=mem[5];
         	if(mem[6]<=tmp1)
                    tmp4=mem[6];
          	else
                    tmp4=tmp1;
         	if(tmp2<=tmp3)
                    tmp5=tmp2;
         	else
                    tmp5=tmp3;
         	if(tmp4<=tmp5)
                    result=tmp4;
          	else
                    result=tmp5;
            end
            default:begin
                tmp1=0;
                for(i=0;i<7;i=i+1)begin
                    if(mem[i]%2==0)
                        tmp1=tmp1+1;
                end
                result=tmp1;
            end                
        endcase
     end
     else
         result=8'bxxxxxxxx;
end

endmodule
