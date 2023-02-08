module exp (a ,b ,c);

    parameter m, n;
    input [n-1:0] a;
    input [m-1:0] b;
    output [(2**m)*n-1:0] c;
  
    wire [(2**m)*n-1:0] exp0 [m:0];
    assign exp0[0] = 1;
  
    genvar i;
    generate
    for(i = 1; i <= m; i = i + 1) begin
    assign exp0[i] = exp0[i - 1] *exp0[i - 1] * (b[m - i] == 1 ? a : 1 );
    end
    endgenerate
  
    assign c = exp0[m];
    
endmodule
