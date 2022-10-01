module int_div(dividend,divisor,quotient,remainder);
input [7:0]dividend ,divisor;
output reg[11:0]quotient;
output reg[7:0]remainder;
reg [6:0]x,y,A;
reg [10:0] Q;
integer n ;
always @(dividend,divisor,quotient,remainder)
begin
A=0;Q=0;
if(dividend[7]==1'b1 && divisor[7]==1'b1) // if both numbers are negative
begin
x = ~(dividend[6:0]) +1;
y = ~(divisor[6:0]) + 1;
for (n=0;n<=10;n=n+1)
begin
{A,x} = {A,x} << 1;
Q = Q << 1;
if (A>=y)
begin
A=A-y;
Q[0]=1;
end
if (n==6)
begin
remainder = A;
end
end
quotient = {dividend[7]^divisor[7],Q};
end
else if(dividend[7]==1'b0 && divisor[7]==1'b0) // if both numbers are positive
begin
y=divisor[6:0];
x=dividend[6:0];
for (n=0;n<=10;n=n+1)
begin
{A,x} = {A,x} << 1;
Q = Q << 1;
if (A>=y)
begin
A=A-y;
Q[0]=1;
end
if (n==6)
begin
remainder = A;
end
end
quotient = {dividend[7]^divisor[7],Q};
end

else //if either of them is negative
begin
if(dividend[7]==1'b1)
begin
y=divisor[6:0];
x= ~(dividend[6:0]) +1'b1;
end
else
begin
y=~(divisor[6:0]) +1;
x=dividend[6:0];
end
for (n=0;n<=10;n=n+1)
begin
{A,x} = {A,x} << 1;
Q = Q << 1;
if (A>=y)
begin
A=A-y;
Q[0]=1;
end
if (n==6)
begin
remainder = A;
end
end
Q=(~Q)+1'b1;
quotient = {dividend[7]^divisor[7],Q};
end
end
endmodule

