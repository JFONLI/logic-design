/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed May 22 16:09:21 2019
/////////////////////////////////////////////////////////////


module queue ( clk, reset, go, cmd, r_num, ready, w_en, r_en, full, 
        almost_full, empty, almost_empty, error, w_num, addr );
  input [17:0] cmd;
  input [15:0] r_num;
  output [15:0] w_num;
  output [4:0] addr;
  input clk, reset, go;
  output ready, w_en, r_en, full, almost_full, empty, almost_empty, error;
  wire   next_error, N23, N24, N25, N26, N27, N28, N32, N33, N34, N35, N36,
         N50, N51, N52, N53, N64, N65, N66, N67, N68, N82, N83, N84, N85, N155,
         N156, N157, N158, N159, N160, N239, N240, N241, N242, N243, N244,
         N245, N246, N247, N248, n25, n27, n28, n31, n33, n35, n37, n39, n40,
         n41, n42, n44, n45, n49, n50, n52, n53, n54, n55, n57, n58, n59, n61,
         n64, n65, n66, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n130, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n154;
  wire   [1:0] state;
  wire   [5:0] total;
  wire   [4:2] \add_96/carry ;
  wire   [5:2] \add_70/carry ;
  wire   [4:2] \r350/carry ;
  wire   [5:2] \r345/carry ;

  EDFFX1 \last_reg[0]  ( .D(r_num[0]), .E(n152), .CK(clk), .QN(n76) );
  EDFFX1 \last_reg[1]  ( .D(r_num[1]), .E(n152), .CK(clk), .QN(n83) );
  EDFFX1 \last_reg[2]  ( .D(r_num[2]), .E(n152), .CK(clk), .QN(n84) );
  EDFFX1 \last_reg[3]  ( .D(r_num[3]), .E(n152), .CK(clk), .QN(n85) );
  EDFFX1 \last_reg[4]  ( .D(r_num[4]), .E(n152), .CK(clk), .QN(n86) );
  EDFFX1 \last_reg[5]  ( .D(r_num[5]), .E(n152), .CK(clk), .QN(n87) );
  EDFFX1 \last_reg[6]  ( .D(r_num[6]), .E(n152), .CK(clk), .QN(n88) );
  EDFFX1 \last_reg[7]  ( .D(r_num[7]), .E(n152), .CK(clk), .QN(n89) );
  EDFFX1 \last_reg[8]  ( .D(r_num[8]), .E(n152), .CK(clk), .QN(n90) );
  EDFFX1 \last_reg[9]  ( .D(r_num[9]), .E(n152), .CK(clk), .QN(n91) );
  EDFFX1 \last_reg[10]  ( .D(r_num[10]), .E(n152), .CK(clk), .QN(n77) );
  EDFFX1 \last_reg[11]  ( .D(r_num[11]), .E(n152), .CK(clk), .QN(n78) );
  EDFFX1 \last_reg[12]  ( .D(r_num[12]), .E(n152), .CK(clk), .QN(n79) );
  EDFFX1 \last_reg[13]  ( .D(r_num[13]), .E(n152), .CK(clk), .QN(n80) );
  EDFFX1 \last_reg[14]  ( .D(r_num[14]), .E(n152), .CK(clk), .QN(n81) );
  EDFFX1 \last_reg[15]  ( .D(r_num[15]), .E(n152), .CK(clk), .QN(n82) );
  DFFRX1 error_reg ( .D(next_error), .CK(clk), .RN(n146), .Q(error), .QN(n75)
         );
  DFFSX1 ready_reg ( .D(n123), .CK(clk), .SN(n146), .Q(ready) );
  DFFRX1 \push_reg[4]  ( .D(n112), .CK(clk), .RN(n146), .Q(N244), .QN(n100) );
  DFFRX1 \pop_reg[4]  ( .D(n108), .CK(clk), .RN(n146), .Q(N239), .QN(n96) );
  DFFRX1 \push_reg[3]  ( .D(n111), .CK(clk), .RN(n146), .Q(N245), .QN(n99) );
  DFFRX1 \push_reg[2]  ( .D(n110), .CK(clk), .RN(n146), .Q(N246), .QN(n98) );
  DFFRX1 \push_reg[1]  ( .D(n109), .CK(clk), .RN(n146), .Q(N247), .QN(n97) );
  DFFRX1 \pop_reg[3]  ( .D(n107), .CK(clk), .RN(n146), .Q(N240), .QN(n95) );
  DFFRX1 \pop_reg[2]  ( .D(n106), .CK(clk), .RN(n146), .Q(N241), .QN(n94) );
  DFFRX1 \pop_reg[1]  ( .D(n105), .CK(clk), .RN(n146), .Q(N242), .QN(n93) );
  DFFRX1 \push_reg[0]  ( .D(n113), .CK(clk), .RN(n146), .Q(N248), .QN(n101) );
  DFFRX1 \pop_reg[0]  ( .D(n104), .CK(clk), .RN(n146), .Q(N243), .QN(n92) );
  DFFRX1 last_en_reg ( .D(n119), .CK(clk), .RN(n146), .Q(n136), .QN(n102) );
  DFFSX1 \state_reg[1]  ( .D(n121), .CK(clk), .SN(n146), .Q(state[1]), .QN(
        n132) );
  DFFRX1 \total_reg[0]  ( .D(n120), .CK(clk), .RN(n146), .Q(total[0]), .QN(
        n138) );
  DFFRX1 \total_reg[4]  ( .D(n115), .CK(clk), .RN(n146), .Q(total[4]), .QN(
        n130) );
  TLATX1 \addr_reg[4]  ( .G(N155), .D(N160), .Q(addr[4]) );
  TLATX1 \addr_reg[3]  ( .G(N155), .D(N159), .Q(addr[3]) );
  TLATX1 \addr_reg[2]  ( .G(N155), .D(N158), .Q(addr[2]) );
  TLATX1 \addr_reg[1]  ( .G(N155), .D(N157), .Q(addr[1]) );
  TLATX1 \addr_reg[0]  ( .G(N155), .D(N156), .Q(addr[0]) );
  DFFSX1 \state_reg[0]  ( .D(n122), .CK(clk), .SN(n146), .Q(state[0]), .QN(
        w_en) );
  DFFRX1 \total_reg[1]  ( .D(n118), .CK(clk), .RN(n146), .Q(total[1]), .QN(
        n134) );
  DFFRX1 \total_reg[2]  ( .D(n116), .CK(clk), .RN(n146), .Q(total[2]), .QN(
        n133) );
  DFFRX1 \total_reg[3]  ( .D(n114), .CK(clk), .RN(n146), .Q(total[3]), .QN(
        n137) );
  DFFRX1 \total_reg[5]  ( .D(n117), .CK(clk), .RN(n146), .Q(total[5]), .QN(
        n135) );
  CLKINVX1 U115 ( .A(reset), .Y(n146) );
  CLKINVX1 U116 ( .A(n68), .Y(n152) );
  AND2X2 U117 ( .A(n57), .B(n58), .Y(n50) );
  OA21XL U118 ( .A0(n40), .A1(n154), .B0(n71), .Y(n44) );
  CLKINVX1 U119 ( .A(N28), .Y(n154) );
  CLKINVX1 U120 ( .A(n40), .Y(n149) );
  NAND2X1 U121 ( .A(r_en), .B(n71), .Y(n68) );
  OAI21XL U122 ( .A0(w_en), .A1(n132), .B0(n44), .Y(n28) );
  NOR2BX1 U123 ( .AN(n42), .B(n28), .Y(n25) );
  OAI22XL U124 ( .A0(n25), .A1(n137), .B0(n33), .B1(n28), .Y(n114) );
  AOI222XL U125 ( .A0(N66), .A1(r_en), .B0(N25), .B1(n150), .C0(N34), .C1(n149), .Y(n33) );
  OAI22XL U126 ( .A0(n25), .A1(n138), .B0(n39), .B1(n28), .Y(n120) );
  AOI222XL U127 ( .A0(n138), .A1(r_en), .B0(n138), .B1(n150), .C0(n138), .C1(
        n149), .Y(n39) );
  NAND2X1 U128 ( .A(N28), .B(n132), .Y(n58) );
  CLKINVX1 U129 ( .A(n59), .Y(n151) );
  OAI211X1 U130 ( .A0(n136), .A1(n132), .B0(n58), .C0(w_en), .Y(n59) );
  NAND4X1 U131 ( .A(n134), .B(n133), .C(n137), .D(n130), .Y(n72) );
  NAND2X1 U132 ( .A(w_en), .B(n132), .Y(n40) );
  CLKINVX1 U133 ( .A(n74), .Y(r_en) );
  NAND2X1 U134 ( .A(n40), .B(n41), .Y(n57) );
  NAND2X1 U135 ( .A(r_en), .B(empty), .Y(n71) );
  CLKINVX1 U136 ( .A(n41), .Y(n150) );
  OAI21XL U137 ( .A0(n148), .A1(n147), .B0(n45), .Y(n123) );
  NAND2X1 U138 ( .A(n45), .B(n147), .Y(n121) );
  NAND2X1 U139 ( .A(n45), .B(n148), .Y(n122) );
  NOR3X1 U140 ( .A(n135), .B(n139), .C(n72), .Y(full) );
  OAI221XL U141 ( .A0(N28), .A1(n40), .B0(empty), .B1(n74), .C0(n41), .Y(N155)
         );
  OAI22XL U142 ( .A0(n25), .A1(n130), .B0(n31), .B1(n28), .Y(n115) );
  AOI222XL U143 ( .A0(N67), .A1(r_en), .B0(N26), .B1(n150), .C0(N35), .C1(n149), .Y(n31) );
  OAI22XL U144 ( .A0(n25), .A1(n133), .B0(n35), .B1(n28), .Y(n116) );
  AOI222XL U145 ( .A0(N65), .A1(r_en), .B0(N24), .B1(n150), .C0(N33), .C1(n149), .Y(n35) );
  OAI22XL U146 ( .A0(n25), .A1(n135), .B0(n27), .B1(n28), .Y(n117) );
  AOI222XL U147 ( .A0(N68), .A1(r_en), .B0(N27), .B1(n150), .C0(N36), .C1(n149), .Y(n27) );
  OAI22XL U148 ( .A0(n25), .A1(n134), .B0(n37), .B1(n28), .Y(n118) );
  AOI222XL U149 ( .A0(N64), .A1(r_en), .B0(N23), .B1(n150), .C0(N32), .C1(n149), .Y(n37) );
  CLKBUFX3 U150 ( .A(total[0]), .Y(n139) );
  OAI21XL U151 ( .A0(n97), .A1(n151), .B0(n54), .Y(n109) );
  NAND2X1 U152 ( .A(N50), .B(n50), .Y(n54) );
  OAI21XL U153 ( .A0(n98), .A1(n151), .B0(n53), .Y(n110) );
  NAND2X1 U154 ( .A(N51), .B(n50), .Y(n53) );
  OAI21XL U155 ( .A0(n99), .A1(n151), .B0(n52), .Y(n111) );
  NAND2X1 U156 ( .A(N52), .B(n50), .Y(n52) );
  OAI21XL U157 ( .A0(n100), .A1(n151), .B0(n49), .Y(n112) );
  NAND2X1 U158 ( .A(N53), .B(n50), .Y(n49) );
  OAI21XL U159 ( .A0(n101), .A1(n151), .B0(n55), .Y(n113) );
  NAND2X1 U160 ( .A(n101), .B(n50), .Y(n55) );
  ADDHXL U161 ( .A(total[3]), .B(\r345/carry [3]), .CO(\r345/carry [4]), .S(
        N25) );
  ADDHXL U162 ( .A(total[2]), .B(\r345/carry [2]), .CO(\r345/carry [3]), .S(
        N24) );
  ADDHXL U163 ( .A(total[1]), .B(n139), .CO(\r345/carry [2]), .S(N23) );
  OAI211X1 U164 ( .A0(n75), .A1(n69), .B0(n42), .C0(n44), .Y(next_error) );
  NOR2X1 U165 ( .A(r_en), .B(n57), .Y(n69) );
  ADDHXL U166 ( .A(total[4]), .B(\r345/carry [4]), .CO(\r345/carry [5]), .S(
        N26) );
  NAND2X1 U167 ( .A(state[0]), .B(n132), .Y(n74) );
  NAND3X1 U168 ( .A(state[1]), .B(w_en), .C(n136), .Y(n41) );
  NOR3X1 U169 ( .A(n139), .B(total[5]), .C(n72), .Y(empty) );
  NAND3BX1 U170 ( .AN(n136), .B(w_en), .C(state[1]), .Y(n42) );
  OAI21XL U171 ( .A0(n92), .A1(n152), .B0(n67), .Y(n104) );
  NAND2X1 U172 ( .A(n92), .B(n152), .Y(n67) );
  OAI21XL U173 ( .A0(n93), .A1(n152), .B0(n66), .Y(n105) );
  NAND2X1 U174 ( .A(N82), .B(n152), .Y(n66) );
  OAI21XL U175 ( .A0(n94), .A1(n152), .B0(n65), .Y(n106) );
  NAND2X1 U176 ( .A(N83), .B(n152), .Y(n65) );
  OAI21XL U177 ( .A0(n95), .A1(n152), .B0(n64), .Y(n107) );
  NAND2X1 U178 ( .A(N84), .B(n152), .Y(n64) );
  OAI21XL U179 ( .A0(n96), .A1(n152), .B0(n61), .Y(n108) );
  NAND2X1 U180 ( .A(N85), .B(n152), .Y(n61) );
  ADDHXL U181 ( .A(total[3]), .B(\add_70/carry [3]), .CO(\add_70/carry [4]), 
        .S(N34) );
  ADDHXL U182 ( .A(total[2]), .B(\add_70/carry [2]), .CO(\add_70/carry [3]), 
        .S(N33) );
  ADDHXL U183 ( .A(total[1]), .B(n139), .CO(\add_70/carry [2]), .S(N32) );
  ADDHXL U184 ( .A(N242), .B(N243), .CO(\add_96/carry [2]), .S(N82) );
  ADDHXL U185 ( .A(N247), .B(N248), .CO(\r350/carry [2]), .S(N50) );
  ADDHXL U186 ( .A(N241), .B(\add_96/carry [2]), .CO(\add_96/carry [3]), .S(
        N83) );
  ADDHXL U187 ( .A(N246), .B(\r350/carry [2]), .CO(\r350/carry [3]), .S(N51)
         );
  NAND2X1 U188 ( .A(n102), .B(n68), .Y(n119) );
  ADDHXL U189 ( .A(total[4]), .B(\add_70/carry [4]), .CO(\add_70/carry [5]), 
        .S(N35) );
  ADDHXL U190 ( .A(N240), .B(\add_96/carry [3]), .CO(\add_96/carry [4]), .S(
        N84) );
  ADDHXL U191 ( .A(N245), .B(\r350/carry [3]), .CO(\r350/carry [4]), .S(N52)
         );
  AND4X1 U192 ( .A(ready), .B(go), .C(state[1]), .D(state[0]), .Y(n45) );
  OAI22XL U193 ( .A0(n92), .A1(n74), .B0(state[0]), .B1(n101), .Y(N156) );
  OAI22XL U194 ( .A0(n93), .A1(n74), .B0(state[0]), .B1(n97), .Y(N157) );
  OAI22XL U195 ( .A0(n94), .A1(n74), .B0(state[0]), .B1(n98), .Y(N158) );
  OAI22XL U196 ( .A0(n95), .A1(n74), .B0(state[0]), .B1(n99), .Y(N159) );
  OAI22XL U197 ( .A0(n96), .A1(n74), .B0(state[0]), .B1(n100), .Y(N160) );
  NOR4X1 U198 ( .A(n73), .B(n137), .C(total[5]), .D(n130), .Y(almost_full) );
  NAND3X1 U199 ( .A(total[1]), .B(total[2]), .C(n139), .Y(n73) );
  NOR3X1 U200 ( .A(n138), .B(total[5]), .C(n72), .Y(almost_empty) );
  OAI2BB2XL U201 ( .B0(n76), .B1(n149), .A0N(cmd[0]), .A1N(n149), .Y(w_num[0])
         );
  OAI2BB2XL U202 ( .B0(n83), .B1(n149), .A0N(cmd[1]), .A1N(n149), .Y(w_num[1])
         );
  OAI2BB2XL U203 ( .B0(n84), .B1(n149), .A0N(cmd[2]), .A1N(n149), .Y(w_num[2])
         );
  OAI2BB2XL U204 ( .B0(n85), .B1(n149), .A0N(cmd[3]), .A1N(n149), .Y(w_num[3])
         );
  OAI2BB2XL U205 ( .B0(n86), .B1(n149), .A0N(cmd[4]), .A1N(n149), .Y(w_num[4])
         );
  OAI2BB2XL U206 ( .B0(n87), .B1(n149), .A0N(cmd[5]), .A1N(n149), .Y(w_num[5])
         );
  OAI2BB2XL U207 ( .B0(n88), .B1(n149), .A0N(cmd[6]), .A1N(n149), .Y(w_num[6])
         );
  OAI2BB2XL U208 ( .B0(n89), .B1(n149), .A0N(cmd[7]), .A1N(n149), .Y(w_num[7])
         );
  OAI2BB2XL U209 ( .B0(n90), .B1(n149), .A0N(cmd[8]), .A1N(n149), .Y(w_num[8])
         );
  OAI2BB2XL U210 ( .B0(n91), .B1(n149), .A0N(cmd[9]), .A1N(n149), .Y(w_num[9])
         );
  OAI2BB2XL U211 ( .B0(n77), .B1(n149), .A0N(cmd[10]), .A1N(n149), .Y(
        w_num[10]) );
  OAI2BB2XL U212 ( .B0(n78), .B1(n149), .A0N(cmd[11]), .A1N(n149), .Y(
        w_num[11]) );
  OAI2BB2XL U213 ( .B0(n79), .B1(n149), .A0N(cmd[12]), .A1N(n149), .Y(
        w_num[12]) );
  OAI2BB2XL U214 ( .B0(n80), .B1(n149), .A0N(cmd[13]), .A1N(n149), .Y(
        w_num[13]) );
  OAI2BB2XL U215 ( .B0(n81), .B1(n149), .A0N(cmd[14]), .A1N(n149), .Y(
        w_num[14]) );
  OAI2BB2XL U216 ( .B0(n82), .B1(n149), .A0N(cmd[15]), .A1N(n149), .Y(
        w_num[15]) );
  CLKINVX1 U217 ( .A(cmd[16]), .Y(n148) );
  CLKINVX1 U218 ( .A(cmd[17]), .Y(n147) );
  NAND2BX1 U219 ( .AN(total[1]), .B(n138), .Y(n140) );
  OAI2BB1X1 U220 ( .A0N(n139), .A1N(total[1]), .B0(n140), .Y(N64) );
  NOR2X1 U221 ( .A(n140), .B(total[2]), .Y(n141) );
  AO21X1 U222 ( .A0(n140), .A1(total[2]), .B0(n141), .Y(N65) );
  NAND2X1 U223 ( .A(n141), .B(n137), .Y(n142) );
  OAI21XL U224 ( .A0(n141), .A1(n137), .B0(n142), .Y(N66) );
  XNOR2X1 U225 ( .A(total[4]), .B(n142), .Y(N67) );
  NOR2X1 U226 ( .A(total[4]), .B(n142), .Y(n143) );
  XOR2X1 U227 ( .A(total[5]), .B(n143), .Y(N68) );
  XOR2X1 U228 ( .A(\r345/carry [5]), .B(total[5]), .Y(N27) );
  XOR2X1 U229 ( .A(\r350/carry [4]), .B(N244), .Y(N53) );
  XOR2X1 U230 ( .A(\add_70/carry [5]), .B(total[5]), .Y(N36) );
  XOR2X1 U231 ( .A(\add_96/carry [4]), .B(N239), .Y(N85) );
  OR2X1 U232 ( .A(N23), .B(n138), .Y(n144) );
  NOR4X1 U233 ( .A(n144), .B(N24), .C(N26), .D(N25), .Y(n145) );
  NOR2BX1 U234 ( .AN(N27), .B(n145), .Y(N28) );
endmodule

