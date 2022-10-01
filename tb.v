module test_div();
reg [7:0]dividend ,divisor;
wire [11:0]quotient ;
wire [7:0] remainder;
int_div dut(dividend,divisor,quotient,remainder);
wire [6:0] dx=dut.x;
wire [6:0] dy=dut.y;
initial
begin
dividend = 8'b0000_1010 ; divisor = 8'b0101_0000;
#10 dividend = 8'b01111000 ; divisor = 8'b00100010;
#10 dividend = -8'd49 ; divisor = -8'd8;
#10 dividend = 8'b11100000 ; divisor = 8'b00010000;
#10 dividend = 8'd48 ; divisor = -8'd16;
#10 $stop;
end
endmodule
