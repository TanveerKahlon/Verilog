module test_vector_tb();
reg [3:0] A, B;
reg Ci, clk, reset;
reg [3:0]Sumexpected;
wire [3:0] S;
reg [31:0] vectornum, errors;
reg[13:0] testvectors[10000:0];
CLA4 test (.A(A), .B(B), .Ci(Ci), .S(S) );
always
begin
clk= 1; #5; clk= 0; #5;
end
initial
begin
$readmemb("test_vectors.tv", testvectors);
vectornum= 0; errors = 0;
reset = 1; #27; reset = 0;
end
always @(posedge clk)
begin
#1; {A, B, Ci, Sumexpected} = testvectors[vectornum];

end
always @(negedge clk)
if (~reset) begin // skip cycles during reset
if (S !== Sumexpected) begin // check result
$display("Error: inputs = %b", {A, B, Ci});
$display(" outputs = %b (%b expected)", S, Sumexpected);
errors = errors + 1;
end
vectornum= vectornum+ 1;
if (testvectors[vectornum] === 13'bx) begin
$display("%d tests completed with %d errors",vectornum, errors);
$finish;
end
end
endmodule