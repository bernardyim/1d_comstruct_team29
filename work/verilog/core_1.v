/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module core_1 (
    input clk,
    input rst,
    input jumpDinoButton,
    output reg [31:0] obstacle,
    output reg dinopos
  );
  
  
  
  wire [32-1:0] M_pc_pcC;
  wire [32-1:0] M_pc_pcN1;
  wire [8-1:0] M_pc_obs;
  reg [1-1:0] M_pc_clk;
  reg [1-1:0] M_pc_rst;
  reg [2-1:0] M_pc_pcSel;
  reg [32-1:0] M_pc_br;
  pc_4 pc (
    .clk(M_pc_clk),
    .rst(M_pc_rst),
    .pcSel(M_pc_pcSel),
    .br(M_pc_br),
    .pcC(M_pc_pcC),
    .pcN1(M_pc_pcN1),
    .obs(M_pc_obs)
  );
  
  wire [32-1:0] M_rom_instruction;
  reg [32-1:0] M_rom_address;
  rom_5 rom (
    .address(M_rom_address),
    .instruction(M_rom_instruction)
  );
  
  wire [2-1:0] M_cu_pcSel;
  wire [6-1:0] M_cu_alufn;
  wire [1-1:0] M_cu_waSel;
  wire [1-1:0] M_cu_regWE;
  wire [5-1:0] M_cu_regR2ASel;
  wire [2-1:0] M_cu_regW1DSel;
  wire [1-1:0] M_cu_bSel;
  wire [1-1:0] M_cu_ramWE;
  reg [32-1:0] M_cu_instruction;
  reg [32-1:0] M_cu_z;
  cu_6 cu (
    .instruction(M_cu_instruction),
    .z(M_cu_z),
    .pcSel(M_cu_pcSel),
    .alufn(M_cu_alufn),
    .waSel(M_cu_waSel),
    .regWE(M_cu_regWE),
    .regR2ASel(M_cu_regR2ASel),
    .regW1DSel(M_cu_regW1DSel),
    .bSel(M_cu_bSel),
    .ramWE(M_cu_ramWE)
  );
  
  wire [32-1:0] M_reg_regR1D;
  wire [32-1:0] M_reg_regR2D;
  wire [32-1:0] M_reg_obs;
  wire [1-1:0] M_reg_dinoPos;
  wire [32-1:0] M_reg_score;
  reg [1-1:0] M_reg_clk;
  reg [1-1:0] M_reg_rst;
  reg [1-1:0] M_reg_regWE;
  reg [5-1:0] M_reg_regR1A;
  reg [5-1:0] M_reg_regR2A;
  reg [5-1:0] M_reg_regW1A;
  reg [32-1:0] M_reg_regW1D;
  reg [1-1:0] M_reg_dinoJumpButton;
  reg_7 L_reg (
    .clk(M_reg_clk),
    .rst(M_reg_rst),
    .regWE(M_reg_regWE),
    .regR1A(M_reg_regR1A),
    .regR2A(M_reg_regR2A),
    .regW1A(M_reg_regW1A),
    .regW1D(M_reg_regW1D),
    .dinoJumpButton(M_reg_dinoJumpButton),
    .regR1D(M_reg_regR1D),
    .regR2D(M_reg_regR2D),
    .obs(M_reg_obs),
    .dinoPos(M_reg_dinoPos),
    .score(M_reg_score)
  );
  
  wire [8-1:0] M_alu_out;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_8 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out)
  );
  
  reg [4:0] rc;
  
  reg [4:0] ra;
  
  reg [4:0] rb;
  
  reg [15:0] rl;
  
  reg [4:0] rb1;
  
  reg [31:0] aluA;
  
  reg [31:0] aluB;
  
  reg [31:0] aluO;
  
  wire [32-1:0] M_ram_read_data;
  reg [8-1:0] M_ram_address;
  reg [32-1:0] M_ram_write_data;
  reg [1-1:0] M_ram_write_en;
  simple_ram_9 #(.SIZE(6'h20), .DEPTH(9'h100)) ram (
    .clk(clk),
    .address(M_ram_address),
    .write_data(M_ram_write_data),
    .write_en(M_ram_write_en),
    .read_data(M_ram_read_data)
  );
  
  always @* begin
    rc = M_rom_instruction[21+4-:5];
    ra = M_rom_instruction[16+4-:5];
    rb = M_rom_instruction[11+4-:5];
    rl = M_rom_instruction[0+15-:16];
    
    case (M_cu_regR2ASel)
      1'h0: begin
        rb1 = rb;
      end
      1'h1: begin
        rb1 = rc;
      end
      default: begin
        rb1 = 1'h0;
      end
    endcase
    M_pc_clk = clk;
    M_pc_rst = rst;
    M_pc_pcSel = M_cu_pcSel;
    M_pc_br[0+15-:16] = rl;
    M_pc_br[16+15-:16] = 1'h0;
    M_rom_address = M_pc_pcC;
    M_cu_instruction = M_rom_instruction;
    if (M_reg_regR1D == 1'h0) begin
      M_cu_z = 1'h1;
    end else begin
      M_cu_z = 1'h0;
    end
    M_reg_clk = clk;
    M_reg_rst = rst;
    M_reg_regWE = M_cu_regWE;
    M_reg_regR1A = ra;
    M_reg_regR2A = rb1;
    M_reg_regW1A = rc;
    M_reg_dinoJumpButton = jumpDinoButton;
    aluA = M_reg_regR1D;
    
    case (M_cu_bSel)
      1'h0: begin
        aluB = M_reg_regR2D;
      end
      1'h1: begin
        aluB = rl;
      end
      default: begin
        aluB = 1'h0;
      end
    endcase
    M_alu_alufn = M_cu_alufn;
    M_alu_a = aluA;
    M_alu_b = aluB;
    aluO = M_alu_out;
    M_ram_write_en = M_cu_ramWE;
    M_ram_address = aluO;
    M_ram_write_data = M_reg_regR2D;
    
    case (M_cu_regW1DSel)
      2'h0: begin
        M_reg_regW1D = M_pc_pcN1;
      end
      2'h1: begin
        M_reg_regW1D = aluO;
      end
      2'h2: begin
        M_reg_regW1D = M_ram_read_data;
      end
      default: begin
        M_reg_regW1D = 32'h00000000;
      end
    endcase
    obstacle[0+7-:8] = M_reg_obs[0+7-:8];
    obstacle[16+7-:8] = M_reg_score;
    dinopos = M_reg_dinoPos;
  end
endmodule
