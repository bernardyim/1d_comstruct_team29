/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module reg_7 (
    input clk,
    input rst,
    input regWE,
    input [4:0] regR1A,
    input [4:0] regR2A,
    output reg [31:0] regR1D,
    output reg [31:0] regR2D,
    input [4:0] regW1A,
    input [31:0] regW1D,
    output reg [31:0] obs,
    input dinoJumpButton,
    output reg dinoPos,
    output reg [31:0] score
  );
  
  
  
  reg [1023:0] M_ctr_d, M_ctr_q = 1'h0;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    obs = 1'h0;
    dinoPos = M_ctr_q[512+0+0-:1];
    if (dinoJumpButton == 1'h1) begin
      M_ctr_d[640+31-:32] = 1'h1;
    end
    if (regWE == 1'h1) begin
      M_ctr_d[(regW1A)*32+31-:32] = regW1D;
    end
    regR1D = M_ctr_q[(regR1A)*32+31-:32];
    regR2D = M_ctr_q[(regR2A)*32+31-:32];
    obs = M_ctr_q[256+31-:32];
    score = M_ctr_q[544+31-:32];
    if (rst) begin
      M_ctr_d = 1024'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule