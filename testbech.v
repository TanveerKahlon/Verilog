module self_check_tb ();
reg [3:0] A, B;
reg Ci;
wire [3:0]S;
wire PG, GG, Co;
CLA4 test (.A(A), .B(B), .Ci(Ci), .S(S), .Co(Co), .PG(PG), .GG(GG));
initial begin
A = 4'b0001;

B = 4'b1010;
Ci = 1;
#10;
if ((S !== 4'b1100) && (Co!=0)) $display("sum failed.");
A = 4'b0011;
B = 4'b1001;
Ci = 1;
#10;
if ((S !== 4'b1101) && (Co!=0)) $display("sum failed.");
A = 4'b0111;
B = 4'b0010;
Ci = 0;
#10;
if ((S !== 4'b1001) && (Co!=0)) $display("sum failed.");
A = 4'b0001;
B = 4'b1000;
Ci = 1;
#10;
if ((S !== 4'b1010) && (Co!=0)) $display("sum failed.");
end
endmodule