module four_bit_adder(input cin,input [3:0]a,b,output cout,output [3:0]sum);
    wire [4:0]C;
    assign C[0]=cin;
    genvar n;
    generate
    for(n=0;n<4;n=n+1)
        begin
           assign sum[n]=a[n]^b[n]^C[n];
           assign C[n+1]=(a[n]&b[n])|(b[n]&C[n])|(C[n]&a[n]);
        end  
    endgenerate    
    assign cout=C[4];
endmodule            