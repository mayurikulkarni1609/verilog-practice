module mux21(a,b,sel,q);
 input a,b,sel;
 output q;
 assign q=(~sel&a)|(sel&b);
endmodule
module mux41_usingmux21(i,s,y);
 input [3:0]i;
 input [1:0]s;
 output y;
 wire q0,q1;
 mux21 m1(i[3],i[2],s[1],q0);
 mux21 m2(i[1],i[0],s[1],q1);
 mux21 m3(q0,q1,s[0],y);
endmodule