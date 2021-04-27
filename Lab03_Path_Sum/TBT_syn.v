/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu May  2 01:09:48 2019
/////////////////////////////////////////////////////////////


module full_adder_0 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n1;

  XOR2X1 U3 ( .A(cin), .B(n1), .Y(sum) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
  AO22X1 U5 ( .A0(b), .A1(a), .B0(n1), .B1(cin), .Y(cout) );
endmodule


module full_adder_19 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_18 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_17 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_16 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n2) );
  AO22X1 U5 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
endmodule


module adderSubtractor_0 ( a, b, cin, cout, sum );
  input [4:0] a;
  input [4:0] b;
  output [4:0] sum;
  input cin;
  output cout;
  wire   b0, b1, b2, b3, b4, c0, c1, c2, c3, c4;

  full_adder_0 f1 ( .a(a[0]), .b(b0), .cin(cin), .cout(c0), .sum(sum[0]) );
  full_adder_19 f2 ( .a(a[1]), .b(b1), .cin(c0), .cout(c1), .sum(sum[1]) );
  full_adder_18 f3 ( .a(a[2]), .b(b2), .cin(c1), .cout(c2), .sum(sum[2]) );
  full_adder_17 f4 ( .a(a[3]), .b(b3), .cin(c2), .cout(c3), .sum(sum[3]) );
  full_adder_16 f5 ( .a(a[4]), .b(b4), .cin(c3), .cout(c4), .sum(sum[4]) );
  XOR2X1 U1 ( .A(c4), .B(c3), .Y(cout) );
  XOR2X1 U2 ( .A(cin), .B(b[1]), .Y(b1) );
  XOR2X1 U3 ( .A(cin), .B(b[2]), .Y(b2) );
  XOR2X1 U4 ( .A(cin), .B(b[3]), .Y(b3) );
  XOR2X1 U5 ( .A(cin), .B(b[4]), .Y(b4) );
  XOR2X1 U6 ( .A(cin), .B(b[0]), .Y(b0) );
endmodule


module full_adder_15 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  AO22X1 U3 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U4 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_14 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_13 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_12 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_11 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n2) );
  AO22X1 U5 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
endmodule


module adderSubtractor_3 ( a, b, cin, cout, sum );
  input [4:0] a;
  input [4:0] b;
  output [4:0] sum;
  input cin;
  output cout;
  wire   b0, b1, b2, b3, b4, c0, c1, c2, c3, c4;

  full_adder_15 f1 ( .a(a[0]), .b(b0), .cin(cin), .cout(c0), .sum(sum[0]) );
  full_adder_14 f2 ( .a(a[1]), .b(b1), .cin(c0), .cout(c1), .sum(sum[1]) );
  full_adder_13 f3 ( .a(a[2]), .b(b2), .cin(c1), .cout(c2), .sum(sum[2]) );
  full_adder_12 f4 ( .a(a[3]), .b(b3), .cin(c2), .cout(c3), .sum(sum[3]) );
  full_adder_11 f5 ( .a(a[4]), .b(b4), .cin(c3), .cout(c4), .sum(sum[4]) );
  XOR2X1 U1 ( .A(c4), .B(c3), .Y(cout) );
  XOR2X1 U2 ( .A(cin), .B(b[0]), .Y(b0) );
  XOR2X1 U3 ( .A(cin), .B(b[1]), .Y(b1) );
  XOR2X1 U4 ( .A(cin), .B(b[2]), .Y(b2) );
  XOR2X1 U5 ( .A(cin), .B(b[3]), .Y(b3) );
  XOR2X1 U6 ( .A(cin), .B(b[4]), .Y(b4) );
endmodule


module full_adder_10 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  AO22X1 U3 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U4 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_9 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_8 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_7 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_6 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n2) );
  AO22X1 U5 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
endmodule


module adderSubtractor_2 ( a, b, cin, cout, sum );
  input [4:0] a;
  input [4:0] b;
  output [4:0] sum;
  input cin;
  output cout;
  wire   b0, b1, b2, b3, b4, c0, c1, c2, c3, c4;

  full_adder_10 f1 ( .a(a[0]), .b(b0), .cin(cin), .cout(c0), .sum(sum[0]) );
  full_adder_9 f2 ( .a(a[1]), .b(b1), .cin(c0), .cout(c1), .sum(sum[1]) );
  full_adder_8 f3 ( .a(a[2]), .b(b2), .cin(c1), .cout(c2), .sum(sum[2]) );
  full_adder_7 f4 ( .a(a[3]), .b(b3), .cin(c2), .cout(c3), .sum(sum[3]) );
  full_adder_6 f5 ( .a(a[4]), .b(b4), .cin(c3), .cout(c4), .sum(sum[4]) );
  XOR2X1 U1 ( .A(c4), .B(c3), .Y(cout) );
  XOR2X1 U2 ( .A(cin), .B(b[0]), .Y(b0) );
  XOR2X1 U3 ( .A(cin), .B(b[1]), .Y(b1) );
  XOR2X1 U4 ( .A(cin), .B(b[2]), .Y(b2) );
  XOR2X1 U5 ( .A(cin), .B(b[3]), .Y(b3) );
  XOR2X1 U6 ( .A(cin), .B(b[4]), .Y(b4) );
endmodule


module full_adder_5 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n2) );
  AO22X1 U5 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
endmodule


module full_adder_4 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_3 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_2 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  AO22X1 U4 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
  XOR2X1 U5 ( .A(a), .B(b), .Y(n2) );
endmodule


module full_adder_1 ( a, b, cin, cout, sum );
  input a, b, cin;
  output cout, sum;
  wire   n2;

  XOR2X1 U3 ( .A(cin), .B(n2), .Y(sum) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n2) );
  AO22X1 U5 ( .A0(b), .A1(a), .B0(n2), .B1(cin), .Y(cout) );
endmodule


module adderSubtractor_1 ( a, b, cin, cout, sum );
  input [4:0] a;
  input [4:0] b;
  output [4:0] sum;
  input cin;
  output cout;
  wire   b0, b1, b2, b3, b4, c0, c1, c2, c3, c4;

  full_adder_5 f1 ( .a(a[0]), .b(b0), .cin(cin), .cout(c0), .sum(sum[0]) );
  full_adder_4 f2 ( .a(a[1]), .b(b1), .cin(c0), .cout(c1), .sum(sum[1]) );
  full_adder_3 f3 ( .a(a[2]), .b(b2), .cin(c1), .cout(c2), .sum(sum[2]) );
  full_adder_2 f4 ( .a(a[3]), .b(b3), .cin(c2), .cout(c3), .sum(sum[3]) );
  full_adder_1 f5 ( .a(a[4]), .b(b4), .cin(c3), .cout(c4), .sum(sum[4]) );
  XOR2X1 U1 ( .A(c4), .B(c3), .Y(cout) );
  XOR2X1 U2 ( .A(cin), .B(b[1]), .Y(b1) );
  XOR2X1 U3 ( .A(cin), .B(b[2]), .Y(b2) );
  XOR2X1 U4 ( .A(cin), .B(b[3]), .Y(b3) );
  XOR2X1 U5 ( .A(cin), .B(b[4]), .Y(b4) );
  XOR2X1 U6 ( .A(cin), .B(b[0]), .Y(b0) );
endmodule


module TBT ( clk, rst, start, data, en, addr, fin, result );
  input [4:0] data;
  output [4:0] addr;
  output [4:0] result;
  input clk, rst, start;
  output en, fin;
  wire   state, N37, N38, N39, N40, N43, N182, n6, n8, n16, n17, n19, n20, n24,
         n25, n26, n27, n28, n29, n31, n32, n33, n34, n35, n36, n38, n39, n41,
         n42, n45, n46, n47, n49, n51, n52, n53, n54, n55, n57, n58, n60, n61,
         n63, n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n95, n96, n97, n98, n99, n100, n101, n102, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178;
  wire   [4:0] ans;
  wire   [4:0] temp2;
  wire   [4:0] temp1;
  wire   [4:0] temp11;
  wire   [4:0] temp12;
  wire   [4:0] leng;
  wire   [4:0] next_num;
  wire   [4:2] \add_112/carry ;
  assign en = 1'b1;

  adderSubtractor_0 a1 ( .a(ans), .b({1'b0, 1'b0, 1'b0, 1'b1, 1'b0}), .cin(
        1'b0), .sum(temp2) );
  adderSubtractor_3 a2 ( .a(ans), .b({1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .cin(
        1'b0), .sum(temp1) );
  adderSubtractor_2 a3 ( .a(ans), .b({1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .cin(
        1'b0), .sum(temp11) );
  adderSubtractor_1 a4 ( .a(ans), .b({1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), .cin(
        1'b0), .sum(temp12) );
  DFFRX1 state_reg ( .D(n135), .CK(clk), .RN(n156), .Q(state), .QN(n143) );
  DFFRX1 \ans_reg[4]  ( .D(n124), .CK(clk), .RN(n156), .Q(ans[4]), .QN(n109)
         );
  DFFRX1 \ans_reg[3]  ( .D(n123), .CK(clk), .RN(n156), .Q(ans[3]), .QN(n108)
         );
  DFFRX1 \leng_reg[0]  ( .D(n130), .CK(clk), .RN(n156), .Q(leng[0]), .QN(n115)
         );
  DFFRX1 \leng_reg[4]  ( .D(n134), .CK(clk), .RN(n156), .Q(leng[4]), .QN(n119)
         );
  DFFRX1 \leng_reg[3]  ( .D(n133), .CK(clk), .RN(n156), .QN(n118) );
  DFFRX1 \leng_reg[2]  ( .D(n132), .CK(clk), .RN(n156), .QN(n117) );
  DFFRX1 \leng_reg[1]  ( .D(n131), .CK(clk), .RN(n156), .Q(leng[1]), .QN(n116)
         );
  DFFSX1 \num_reg[4]  ( .D(next_num[4]), .CK(clk), .SN(n156), .Q(addr[4]), 
        .QN(n141) );
  DFFSX1 \num_reg[2]  ( .D(next_num[2]), .CK(clk), .SN(n156), .Q(addr[2]) );
  DFFSX1 \num_reg[3]  ( .D(next_num[3]), .CK(clk), .SN(n156), .Q(addr[3]) );
  DFFSX1 \num_reg[0]  ( .D(next_num[0]), .CK(clk), .SN(n156), .Q(addr[0]), 
        .QN(n144) );
  DFFRX1 \latt_reg[3]  ( .D(n129), .CK(clk), .RN(n156), .Q(n138), .QN(n114) );
  DFFSX1 \num_reg[1]  ( .D(next_num[1]), .CK(clk), .SN(n156), .Q(addr[1]), 
        .QN(n142) );
  DFFRX1 \ans_reg[0]  ( .D(n125), .CK(clk), .RN(n156), .Q(ans[0]), .QN(n110)
         );
  DFFRX1 \ans_reg[2]  ( .D(n122), .CK(clk), .RN(n156), .Q(ans[2]), .QN(n107)
         );
  DFFRX1 \ans_reg[1]  ( .D(n121), .CK(clk), .RN(n156), .Q(ans[1]), .QN(n106)
         );
  DFFSX1 \latt_reg[2]  ( .D(n127), .CK(clk), .SN(n156), .Q(n137), .QN(n112) );
  DFFSX1 \latt_reg[0]  ( .D(n126), .CK(clk), .SN(n156), .Q(n139), .QN(n111) );
  DFFRX1 \latt_reg[1]  ( .D(n128), .CK(clk), .RN(n156), .Q(n140), .QN(n113) );
  OAI31XL U131 ( .A0(n61), .A1(n143), .A2(n171), .B0(n8), .Y(n32) );
  NOR4X1 U132 ( .A(n138), .B(n139), .C(n137), .D(n113), .Y(n58) );
  NOR4X1 U133 ( .A(n138), .B(n139), .C(n113), .D(n112), .Y(n60) );
  NOR2X1 U134 ( .A(n89), .B(n113), .Y(n72) );
  NOR2X1 U135 ( .A(data[1]), .B(data[2]), .Y(n28) );
  NOR2X1 U136 ( .A(data[0]), .B(data[2]), .Y(n52) );
  CLKINVX1 U137 ( .A(data[2]), .Y(n165) );
  NOR2X1 U138 ( .A(n173), .B(n92), .Y(n42) );
  CLKINVX1 U139 ( .A(n90), .Y(n173) );
  OA21XL U140 ( .A0(n143), .A1(n54), .B0(n32), .Y(n17) );
  NAND2X1 U141 ( .A(n54), .B(n32), .Y(n29) );
  CLKINVX1 U142 ( .A(n32), .Y(n159) );
  CLKINVX1 U143 ( .A(n49), .Y(n163) );
  OAI21XL U144 ( .A0(n172), .A1(n168), .B0(n49), .Y(n76) );
  CLKINVX1 U145 ( .A(n27), .Y(n177) );
  NOR2BX1 U146 ( .AN(n54), .B(n75), .Y(n73) );
  OAI22XL U147 ( .A0(n164), .A1(n38), .B0(n39), .B1(n24), .Y(n33) );
  AOI21X1 U148 ( .A0(n28), .A1(n58), .B0(n33), .Y(n49) );
  NOR2X1 U149 ( .A(n89), .B(n140), .Y(n27) );
  CLKINVX1 U150 ( .A(N43), .Y(n171) );
  OAI211X1 U151 ( .A0(n63), .A1(n64), .B0(n161), .C0(n160), .Y(n61) );
  NOR4X1 U152 ( .A(n175), .B(n173), .C(n72), .D(n164), .Y(n63) );
  NAND4X1 U153 ( .A(n24), .B(n174), .C(n101), .D(n41), .Y(n71) );
  NOR2X1 U154 ( .A(n92), .B(n28), .Y(n101) );
  NAND4X1 U155 ( .A(n177), .B(n39), .C(n174), .D(n102), .Y(n54) );
  AND3X2 U156 ( .A(n42), .B(n70), .C(n68), .Y(n102) );
  NOR2X1 U157 ( .A(n137), .B(n140), .Y(n105) );
  NAND3X1 U158 ( .A(n138), .B(n139), .C(n105), .Y(n90) );
  AND2X2 U159 ( .A(n105), .B(n53), .Y(n92) );
  CLKINVX1 U160 ( .A(n39), .Y(n175) );
  CLKINVX1 U161 ( .A(n58), .Y(n174) );
  NOR2BX1 U162 ( .AN(n38), .B(n72), .Y(n70) );
  NAND2X1 U163 ( .A(n53), .B(n137), .Y(n89) );
  NOR3X1 U164 ( .A(n28), .B(n92), .C(n52), .Y(n69) );
  OAI2BB2XL U165 ( .B0(n159), .B1(n55), .A0N(n139), .A1N(n29), .Y(n126) );
  NOR4X1 U166 ( .A(n57), .B(n58), .C(n175), .D(n60), .Y(n55) );
  NAND2X1 U167 ( .A(n145), .B(n38), .Y(n57) );
  OAI21XL U168 ( .A0(n175), .A1(n71), .B0(n100), .Y(n99) );
  AOI33X1 U169 ( .A0(n69), .A1(n172), .A2(n70), .B0(n67), .B1(n38), .B2(n68), 
        .Y(n100) );
  OAI21XL U170 ( .A0(n52), .A1(n28), .B0(n27), .Y(n51) );
  CLKINVX1 U171 ( .A(n60), .Y(n172) );
  OA21XL U172 ( .A0(n167), .A1(n66), .B0(n165), .Y(n64) );
  CLKINVX1 U173 ( .A(n71), .Y(n167) );
  AO22X1 U174 ( .A0(n67), .A1(n68), .B0(n69), .B1(n70), .Y(n66) );
  CLKINVX1 U175 ( .A(n72), .Y(n178) );
  AND2X2 U176 ( .A(n41), .B(n172), .Y(n68) );
  OA21XL U177 ( .A0(n169), .A1(n178), .B0(n93), .Y(n25) );
  NAND4X1 U178 ( .A(n27), .B(n168), .C(n166), .D(n165), .Y(n93) );
  AND3X2 U179 ( .A(n24), .B(n168), .C(n90), .Y(n67) );
  AO22X1 U180 ( .A0(temp11[1]), .A1(n79), .B0(temp1[1]), .B1(n80), .Y(n86) );
  AO22X1 U181 ( .A0(temp11[2]), .A1(n79), .B0(temp1[2]), .B1(n80), .Y(n84) );
  AO22X1 U182 ( .A0(temp11[3]), .A1(n79), .B0(temp1[3]), .B1(n80), .Y(n82) );
  AO22X1 U183 ( .A0(temp11[4]), .A1(n79), .B0(temp1[4]), .B1(n80), .Y(n78) );
  OAI211X1 U184 ( .A0(n172), .A1(n24), .B0(n25), .C0(n26), .Y(n127) );
  AOI222XL U185 ( .A0(n27), .A1(n28), .B0(n29), .B1(n137), .C0(n31), .C1(n32), 
        .Y(n26) );
  OR4X1 U186 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n31) );
  OAI22XL U187 ( .A0(n166), .A1(n38), .B0(n39), .B1(n168), .Y(n36) );
  OAI22XL U188 ( .A0(n166), .A1(n39), .B0(n164), .B1(n172), .Y(n20) );
  OAI21XL U189 ( .A0(n164), .A1(n174), .B0(n145), .Y(n34) );
  OAI221XL U190 ( .A0(n24), .A1(n174), .B0(n38), .B1(n168), .C0(n162), .Y(n77)
         );
  CLKINVX1 U191 ( .A(n20), .Y(n162) );
  OAI2BB1X1 U192 ( .A0N(N39), .A1N(n145), .B0(n135), .Y(next_num[3]) );
  CLKINVX1 U193 ( .A(n53), .Y(n176) );
  CLKINVX1 U194 ( .A(n8), .Y(n158) );
  OAI2BB1X1 U195 ( .A0N(N37), .A1N(n145), .B0(n135), .Y(next_num[1]) );
  OAI2BB1X1 U196 ( .A0N(N38), .A1N(n145), .B0(n135), .Y(next_num[2]) );
  CLKINVX1 U197 ( .A(n28), .Y(n166) );
  CLKINVX1 U198 ( .A(n95), .Y(n164) );
  CLKINVX1 U199 ( .A(n52), .Y(n168) );
  CLKINVX1 U200 ( .A(n6), .Y(fin) );
  NAND3X1 U201 ( .A(N43), .B(n145), .C(n96), .Y(n75) );
  NOR3X1 U202 ( .A(n97), .B(data[4]), .C(data[3]), .Y(n96) );
  AOI32X1 U203 ( .A0(n67), .A1(n95), .A2(n98), .B0(n99), .B1(n165), .Y(n97) );
  NOR3X1 U204 ( .A(n58), .B(n175), .C(n72), .Y(n98) );
  NAND3X1 U205 ( .A(n105), .B(n138), .C(n111), .Y(n39) );
  NOR2X1 U206 ( .A(n138), .B(n111), .Y(n53) );
  OAI22XL U207 ( .A0(n165), .A1(n41), .B0(data[0]), .B1(n42), .Y(n35) );
  NAND4X1 U208 ( .A(n114), .B(n111), .C(n113), .D(n137), .Y(n38) );
  NAND3X1 U209 ( .A(n112), .B(n140), .C(n53), .Y(n41) );
  OAI22XL U210 ( .A0(n106), .A1(n73), .B0(n85), .B1(n75), .Y(n121) );
  AOI221XL U211 ( .A0(temp2[1]), .A1(n76), .B0(temp12[1]), .B1(n77), .C0(n86), 
        .Y(n85) );
  OAI22XL U212 ( .A0(n107), .A1(n73), .B0(n83), .B1(n75), .Y(n122) );
  AOI221XL U213 ( .A0(temp2[2]), .A1(n76), .B0(temp12[2]), .B1(n77), .C0(n84), 
        .Y(n83) );
  OAI22XL U214 ( .A0(n108), .A1(n73), .B0(n81), .B1(n75), .Y(n123) );
  AOI221XL U215 ( .A0(temp2[3]), .A1(n76), .B0(temp12[3]), .B1(n77), .C0(n82), 
        .Y(n81) );
  OAI22XL U216 ( .A0(n109), .A1(n73), .B0(n74), .B1(n75), .Y(n124) );
  AOI221XL U217 ( .A0(temp2[4]), .A1(n76), .B0(temp12[4]), .B1(n77), .C0(n78), 
        .Y(n74) );
  OAI22XL U218 ( .A0(n110), .A1(n73), .B0(n87), .B1(n75), .Y(n125) );
  AOI221XL U219 ( .A0(temp2[0]), .A1(n76), .B0(temp12[0]), .B1(n77), .C0(n88), 
        .Y(n87) );
  OAI211X1 U220 ( .A0(data[2]), .A1(n41), .B0(n25), .C0(n91), .Y(n79) );
  AOI21X1 U221 ( .A0(n52), .A1(n27), .B0(n92), .Y(n91) );
  OAI2BB2XL U222 ( .B0(n113), .B1(n17), .A0N(n145), .A1N(n45), .Y(n128) );
  OAI221XL U223 ( .A0(n159), .A1(n46), .B0(n172), .B1(n168), .C0(n41), .Y(n45)
         );
  AOI211X1 U224 ( .A0(n173), .A1(n170), .B0(n47), .C0(n163), .Y(n46) );
  OAI31XL U225 ( .A0(n176), .A1(n170), .A2(n137), .B0(n51), .Y(n47) );
  AO22X1 U226 ( .A0(temp11[0]), .A1(n79), .B0(temp1[0]), .B1(n80), .Y(n88) );
  OAI32X1 U227 ( .A0(n143), .A1(n159), .A2(n16), .B0(n114), .B1(n17), .Y(n129)
         );
  AOI211X1 U228 ( .A0(n173), .A1(data[0]), .B0(n19), .C0(n20), .Y(n16) );
  OAI22XL U229 ( .A0(data[1]), .A1(n178), .B0(n165), .B1(n177), .Y(n19) );
  NAND2X1 U230 ( .A(start), .B(n143), .Y(n8) );
  OAI22XL U231 ( .A0(n115), .A1(n158), .B0(n8), .B1(n170), .Y(n130) );
  OAI22XL U232 ( .A0(n116), .A1(n158), .B0(n8), .B1(n169), .Y(n131) );
  OAI22XL U233 ( .A0(n117), .A1(n158), .B0(n8), .B1(n165), .Y(n132) );
  OAI22XL U234 ( .A0(n118), .A1(n158), .B0(n8), .B1(n161), .Y(n133) );
  OAI22XL U235 ( .A0(n119), .A1(n158), .B0(n8), .B1(n160), .Y(n134) );
  OAI221XL U236 ( .A0(n165), .A1(n41), .B0(data[1]), .B1(n89), .C0(n90), .Y(
        n80) );
  ADDHXL U237 ( .A(addr[1]), .B(addr[0]), .CO(\add_112/carry [2]), .S(N37) );
  ADDHXL U238 ( .A(addr[2]), .B(\add_112/carry [2]), .CO(\add_112/carry [3]), 
        .S(N38) );
  CLKBUFX3 U239 ( .A(state), .Y(n145) );
  OAI2BB1X1 U240 ( .A0N(n145), .A1N(N40), .B0(n135), .Y(next_num[4]) );
  ADDHXL U241 ( .A(addr[3]), .B(\add_112/carry [3]), .CO(\add_112/carry [4]), 
        .S(N39) );
  OR2X1 U242 ( .A(start), .B(n145), .Y(n135) );
  OAI2BB1X1 U243 ( .A0N(n144), .A1N(n145), .B0(n135), .Y(next_num[0]) );
  NAND2X1 U244 ( .A(start), .B(N182), .Y(n6) );
  NOR3X1 U245 ( .A(data[0]), .B(data[1]), .C(n165), .Y(n95) );
  CLKINVX1 U246 ( .A(rst), .Y(n156) );
  NAND2X1 U247 ( .A(data[0]), .B(data[1]), .Y(n24) );
  NOR2X1 U248 ( .A(n110), .B(n6), .Y(result[0]) );
  NOR2X1 U249 ( .A(n106), .B(n6), .Y(result[1]) );
  NOR2X1 U250 ( .A(n107), .B(n6), .Y(result[2]) );
  NOR2X1 U251 ( .A(n108), .B(n6), .Y(result[3]) );
  NOR2X1 U252 ( .A(n109), .B(n6), .Y(result[4]) );
  CLKINVX1 U253 ( .A(data[1]), .Y(n169) );
  CLKINVX1 U254 ( .A(data[0]), .Y(n170) );
  CLKINVX1 U255 ( .A(data[3]), .Y(n161) );
  CLKINVX1 U256 ( .A(data[4]), .Y(n160) );
  XOR2X1 U257 ( .A(\add_112/carry [4]), .B(addr[4]), .Y(N40) );
  NAND2X1 U258 ( .A(addr[2]), .B(n117), .Y(n155) );
  NAND2X1 U259 ( .A(addr[3]), .B(n118), .Y(n154) );
  NOR2BX1 U260 ( .AN(addr[0]), .B(leng[0]), .Y(n146) );
  OAI22XL U261 ( .A0(addr[1]), .A1(n146), .B0(n146), .B1(n116), .Y(n147) );
  OAI21XL U262 ( .A0(leng[4]), .A1(n141), .B0(n147), .Y(n153) );
  NOR2BX1 U263 ( .AN(leng[0]), .B(addr[0]), .Y(n149) );
  AO21X1 U264 ( .A0(n142), .A1(n149), .B0(leng[1]), .Y(n148) );
  OAI211X1 U265 ( .A0(n149), .A1(n142), .B0(n148), .C0(n155), .Y(n150) );
  OAI221XL U266 ( .A0(addr[2]), .A1(n117), .B0(addr[3]), .B1(n118), .C0(n150), 
        .Y(n151) );
  OAI211X1 U267 ( .A0(leng[4]), .A1(n141), .B0(n151), .C0(n154), .Y(n152) );
  OAI2BB1X1 U268 ( .A0N(n141), .A1N(leng[4]), .B0(n152), .Y(N43) );
  NOR4BBX1 U269 ( .AN(n155), .BN(n154), .C(n153), .D(N43), .Y(N182) );
endmodule

