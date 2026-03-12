module m_bit_adder #(parameter m = 8)
(
    input cin,
    input [m-1:0]a,b,
    output cout,
    output [m-1:0]sum
);
    wire [m:0]C;
    assign C[0]=cin;
    genvar n;
    generate
    for(n=0;n<m;n=n+1)
        begin
           assign sum[n]=a[n]^b[n]^C[n];
           assign C[n+1]=(a[n]&b[n])|(b[n]&C[n])|(C[n]&a[n]);
        end  
    endgenerate    
    assign cout=C[m];
endmodule            