/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_10 (
    input [7:0] a,
    input [7:0] b,
    input [5:0] alufn,
    output reg [7:0] out,
    output reg [0:0] zout,
    output reg [0:0] vout,
    output reg [0:0] nout
  );
  
  
  
  reg [7:0] bxor;
  
  reg [7:0] preout;
  
  always @* begin
    
    case (alufn[0+0-:1])
      1'h1: begin
        bxor = -b;
      end
      1'h0: begin
        bxor = b;
      end
      default: begin
        bxor = 8'bxxxxxxxx;
      end
    endcase
    preout = a + bxor;
    zout = (&(~preout));
    vout = ((~a[7+0-:1] & ~bxor[7+0-:1]) & preout[7+0-:1]) | ((a[7+0-:1] & bxor[7+0-:1]) & ~preout[7+0-:1]);
    nout = preout[7+0-:1];
    out = preout;
  end
endmodule