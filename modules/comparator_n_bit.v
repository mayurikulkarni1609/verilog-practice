module comparator #(parameter m = 2)
(
    input [m-1:0]a,b,
    output reg E,G,L
);
always@(*)
  begin
    E=0; G=0; L=0;
    if(a>b)
     G=1;
    else if(a<b)
     L=1;
    else
     E=1;
  end
endmodule