`timescale 1ns/1ns
module Project_tb();
reg[3:0]datain;
reg wr;
reg rd;
reg sel;
reg[1:0]math;
reg clk,rst_n;
wire[3:0]dataout;
wire full;
wire empty;
wire [7:0]result;

PJ p1(.datain(datain),.dataout(dataout),.wr(wr),.rd(rd),.sel(sel),.math(math),.clk(clk),.rst_n(rst_n),.full(full),.empty(empty),.result(result));
initial begin
    #0  datain=0;wr=0;rd=0;sel=0;math=0;clk=0;rst_n=1;
    #5 rst_n=0;
    #5 rst_n=1;
    #10 datain=4'b1000;wr=1;rd=0;sel=0;math=0;
    #10 datain=4'b0100;wr=1;rd=0;sel=0;
    #10 datain=4'b1110;wr=1;rd=0;sel=0;
    #10 datain=4'b0101;wr=1;rd=0;sel=0;
    #10 datain=4'b0011;wr=1;rd=0;sel=0;
    #10 datain=4'b0110;wr=1;rd=0;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0010;wr=1;rd=0;sel=0;
    #10 datain=4'b0011;wr=1;rd=0;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b1011;wr=1;rd=0;sel=1;math=1;
    #10 datain=4'b0001;wr=1;rd=0;sel=1;
    #10 datain=4'b1010;wr=1;rd=0;sel=1;
    #10 datain=4'b1100;wr=1;rd=0;sel=1;
    #10 datain=4'b0111;wr=1;rd=0;sel=1;
    #10 datain=4'b1111;wr=1;rd=0;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b1001;wr=1;rd=0;sel=1;
    #10 datain=4'b0110;wr=1;rd=0;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0010;wr=1;rd=0;sel=1;math=2;
    #10 datain=4'b1110;wr=1;rd=0;sel=1;
    #10 datain=4'b1111;wr=1;rd=0;sel=1;
    #10 datain=4'b0100;wr=1;rd=0;sel=1;
    #10 datain=4'b0110;wr=1;rd=0;sel=1;
    #10 datain=4'b1011;wr=1;rd=0;sel=1;
    #10 datain=4'b1000;wr=1;rd=0;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b0000;wr=0;rd=1;sel=1;
    #10 datain=4'b1010;wr=1;rd=0;sel=0;math=3;
    #10 datain=4'b1001;wr=1;rd=0;sel=0;
    #10 datain=4'b1110;wr=1;rd=0;sel=0;
    #10 datain=4'b1100;wr=1;rd=0;sel=0;
    #10 datain=4'b0111;wr=1;rd=0;sel=0;
    #10 datain=4'b0100;wr=1;rd=0;sel=0;
    #10 datain=4'b0011;wr=1;rd=0;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    #10 datain=4'b0000;wr=0;rd=1;sel=0;
    $stop;
end
always #5 clk=~clk;
endmodule

