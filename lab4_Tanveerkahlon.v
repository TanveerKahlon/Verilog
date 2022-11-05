
module lab4_Tanveerkahlon(Ai, Bi, Cin, G, P, Sum); // GPFullAdder implementation
input Ai, Bi, Cin;
output G, P, Sum;

assign G = Ai & Bi;
assign P = Ai ^ Bi;
assign Sum = P ^ Cin;

endmodule

module CLALogic(G, P, Ci, C, Co, PG, GG);
input Ci;
input [3:0] G, P;
output PG, GG, Co;
output [2:0] C;

assign C[0] = G[0] | (P[0] & Ci);

assign C[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & Ci);

assign C[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & Ci);

assign Co = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] &  Ci);

assign PG = P[0] & P[1]  & P[2] & P[3];

assign GG = G[3] | (P[3] & G[2] ) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[0] & G[0]);



endmodule

module CLA4(A, B, Ci, S, Co, PG, GG);

input [3:0] A, B;
input Ci;
wire [3:0] P, G;
wire [2:0] C;
output [3:0] S;
output PG, GG, Co;

Lab4_Manmeet bit0 (.Ai(A[0]), .Bi(B[0]), .Cin(Ci), .G(G[0]), .P(P[0]), .Sum(S[0]));

Lab4_Manmeet bit1 (.Ai(A[1]), .Bi(B[1]), .Cin(C[0]), .G(G[1]), .P(P[1]), .Sum(S[1]));
Lab4_Manmeet bit2 (.Ai(A[2]), .Bi(B[2]), .Cin(C[1]), .G(G[2]), .P(P[2]), .Sum(S[2]));
Lab4_Manmeet bit3 (.Ai(A[3]), .Bi(B[3]), .Cin(C[2]), .G(G[3]), .P(P[3]), .Sum(S[3]));

CLALogic carry (.G(G), .P(P), .Ci(Ci), .C(C), .Co(Co), .PG(PG), .GG(GG));
endmodule
