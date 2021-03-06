/*
   This file was generated automatically by the Mojo IDE version B1.3.3.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input button,
    output reg dinoled,
    output reg [23:0] io_led
  );
  
  
  
  reg rst;
  
  wire [32-1:0] M_core_obstacle;
  wire [1-1:0] M_core_dinopos;
  reg [1-1:0] M_core_clk;
  reg [1-1:0] M_core_rst;
  reg [1-1:0] M_core_jumpDinoButton;
  core_1 core (
    .clk(M_core_clk),
    .rst(M_core_rst),
    .jumpDinoButton(M_core_jumpDinoButton),
    .obstacle(M_core_obstacle),
    .dinopos(M_core_dinopos)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_myBlinker_blink;
  blinker_3 myBlinker (
    .clk(clk),
    .rst(rst),
    .blink(M_myBlinker_blink)
  );
  reg [16:0] M_slowClock_d, M_slowClock_q = 1'h0;
  
  always @* begin
    M_slowClock_d = M_slowClock_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    io_led = 24'h000000;
    led = {4'h8{M_myBlinker_blink}};
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_slowClock_d = M_slowClock_q + 1'h1;
    M_core_clk = M_slowClock_q[16+0-:1];
    M_core_rst = rst;
    io_led[0+7-:8] = M_core_obstacle[0+7-:8];
    io_led[8+7-:8] = M_core_obstacle[8+7-:8];
    io_led[16+7-:8] = M_core_obstacle[16+7-:8];
    M_core_jumpDinoButton = button;
    io_led[8+7+0-:1] = rst;
    dinoled = M_core_dinopos;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_slowClock_q <= 1'h0;
    end else begin
      M_slowClock_q <= M_slowClock_d;
    end
  end
  
endmodule
