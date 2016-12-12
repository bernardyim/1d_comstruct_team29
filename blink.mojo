<?xml version="1.0" encoding="UTF-8"?>
<project name="blink" board="Mojo V3" language="Lucid">
  <files>
    <src>alu.luc</src>
    <src>boolean.luc</src>
    <src>multiplier.luc</src>
    <src>reg.luc</src>
    <src>compare.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>shifter.luc</src>
    <src>pc.luc</src>
    <src>adder.luc</src>
    <src>core.luc</src>
    <src>cu.luc</src>
    <src>division.luc</src>
    <src>blinker.luc</src>
    <src>rom.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>custom.ucf</ucf>
    <component>decoder.luc</component>
    <component>simple_ram.v</component>
    <component>reset_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
