# Lab1 Kevin number detector
:::warning
注意!!!以下僅為範例，實際在寫作業時請同學自行判斷!!!:smile::smile::smile:
:::
![](https://i.imgur.com/qZXD63B.png)

這裡要用4-bit happy_verilog電路(如上圖所示)讓各位了解電路的三種描述方式。
而happy_verilog電路的功能是偵測在0到15的範圍中**拉基數列**的數字。
:::info
拉基數列: 5, 7, 14, 15, 25, 27, 34, 35...
:::
也就是說，現在我們必須找到5, 7, 14, 15。

## Description

1. 概念圖
<br></br>
![](https://i.imgur.com/jfmUoCR.png)
三種電路描述的方式分別為Gate Level, Dataflow, Behavior，將在第3個部分詳述。

2. 結構圖
<br></br>
![](https://i.imgur.com/XaY3usf.png)
將數字利用K-map化簡後畫成的架構圖。:poop::poop::poop:

3. 三種描述方式

    1.Gate Level Description
    ```verilog
        module happy_verilog_G(in,out);
            parameter n=4;
            
            //IO port declaration
            input [n-1:0]in;//Input must be wire.
            output out;//Output can be wire or reg, default type is wire.
            
            //Save the output values from different gates. 
            wire not_a;
            wire and0,and1,and2;
            
            //<gate><gate name>(output,input1,input2,...);
            //<gate name>只要不重複即可
            not not_0(not_a,in[3]);
            
            and and_0(and0,not_a,in[2],in[0]);
            and and_1(and1,in[3],in[2],in[1]);
            and and_2(and2,in[2],in[1],in[0]);
            
            or or_0(out,and0,and1,and2);
            
        endmodule        
    ```
    2.Dataflow Description
    ```verilog
        module happy_verilog_D(in,out);
            parameter n=4;
            
            input [n-1:0]in;
            output out;
            
            //Be careful, "!" and "~" are different in Verilog.
            assign out=(!in[3]&in[2]&in[0])|(in[3]&in[2]&in[1])|(in[2]&in[1]&in[0]);
            
        endmodule 
    ```
    3.Behavior Description
    ```verilog
        module happy_verilog_B(in,out);
            parameter n=4;
            
            input [n-1:0]in;
            output out;
            reg out;//It must be reg type because of using in always block.
            
            always@(*)begin
                case(in)
                    5,7,14,15:begin
                        out=1'b1;
                    end
                    default:begin
                        out=1'b0;
                    end
                endcase
            end
            
            /*
            or can write as
            always@(*)begin
                out=1'b0;
                case(in)
                    5,7,14,15:begin
                        out=1'b1;
                    end
                endcase
            end
            */
            
        endmodule
    ```
4. <strong>Testbench</strong>
    ```verilog
        module happy_verilog_tb;
            parameter delay=5;

            wire out_G,out_D,out_B;
            reg [3:0]in;
            integer i;

            initial begin
                //Give initial value.
                in=0;
                for(i=0;i<16;i=i+1)begin
                    #delay
                    $display("time=%4d,in=%b,out_G=%b,out_D=%b,out_B=%b",$time,in,out_G,out_D,out_B);
                    if((out_G|out_D|out_B)===1'bx||
                    ((in==5||in==7||in==14||in==15)&&(out_G&out_D&out_B)==0)||
                    ((in!=5&&in!=7&&in!=14&&in!=15)&&(out_G|out_D|out_B)==1))
                        begin
                            $display("You got wrong answer!!");
                            $finish;
                        end
                    in=in+1;
                end
                $display("Congratulations!!");
                $finish;
            end

            happy_verilog_G hvg
            (
                .in(in),
                .out(out_G)
            );
            happy_verilog_D hvd
            (
                .in(in),
                .out(out_D)
            );
            happy_verilog_B hvb
            (
                .in(in),
                .out(out_B)
            );

        endmodule
    ```
:::warning
<font color="red">程式碼請自己親手打一次，不要直接拿助教的來改喔!!!</font>:ghost::ghost::ghost:
:::
## 使用NC-Verilog進行模擬驗證
### 程式執行方法
利用ncverilog執行testbench與包含module的檔案，
指令為"ncverilog"加上要執行的檔案與參數，以下為範例：

假設testbench的檔案名稱為<font color="red">happy_verilog_tb.v</font>
而寫著三個module的檔案名稱為<font color="red">happy_verilog.v</font>
則執行的指令是
```
    ncverilog happy_verilog_tb.v happy_verilog.v
```
![](https://i.imgur.com/kwSf06k.png)

### 程式執行結果
- 正確答案
![](https://i.imgur.com/oAHdOFT.png)
<font color="red">這樣代表測資皆正確!!!</font>
- 錯誤答案
![](https://i.imgur.com/cNI9dLw.png)
<font color="red">這代表在圖上出現的最後一筆測資出現錯誤!!!</font>
## Lab要求
- 請使用剛剛介紹的三種電路描述方式，作出4-bit Kevin number detector的電路。
- Kevin number : 1,5,6,7,9,10,12,14(虛構的)

    - Gate Level Description
        - module name: kevin_G
        - input name: in
        - output name: out
    - Dataflow Description
        - module name: kevin_D
        - in/output name同上
    - Behavior Description
        - module name: kevin_B
        - in/output name同上
:::warning
<font color="red">請將上面三種描述方法，分別寫在三個不同的module，並全部放在kevin.v裡面。</font>:imp::imp::imp:
在K-map化簡時，必須要考慮Hazard-Free!!!:heart::heart::heart:
:::
- 依照上面的範例，設計出自己的testbench，並且測試Kevin number detector電路

:::warning
<font color="red">testbench的檔案請放在kevin_tb.v裡面</font>:fire::fire::fire:
:::
## 繳交文件
- kevin.v
- kevin_tb.v
- report.pdf
    - 設計過程、概念圖、結構圖、模擬結果、遇到的問題與解決方法、想問助教的問題。
    - k-map的圖也一定要畫上去喔。
    - 如果沒有方向，可以參考教學網頁上的report範例
        https://hackmd.io/F4DzlCg_ReOxYGVgLG1FJQ

- <font color="red">請同學直接將檔案上傳到ilms作業區，不用壓縮喔喔喔!!!</font>
:::warning
<font color="red">請注意，任何部分不符合格式都會導致作業0分，請在交作業之前多次檢查，謝謝大家!!</font>
:::
## Deadline
<font color="red">2019/3/21 23:59</font>
:::warning
<font color="green">別遲交、不得遲交、不要遲交!!!</font>
<font color="red">作業遲交一天打 8 折、兩天 6 折、超過三天 0 分 </font>
<font color="blue">如果被抓到抄襲，抄襲者及被抄襲者都當掉喔喔!!</font>
:::
  
## 更新日誌

    
# [:maple_leaf:Homepage:maple_leaf:](https://hackmd.io/s/ByZ-fyuHV)

    









