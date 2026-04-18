module fulladder(a,b,cin,sum,co);
 input a,b,cin;
 output sum,co;
 assign sum = a^b^cin;
 assign co = (a&b)|(b&cin)|(a&cin);
endmodule