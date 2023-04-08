module fifo_tb();
reg clk,rst,wr_en,rd_en;
reg[7:0] d_in;
wire full,empty;
wire[7:0] d_out;
//integer delay;

fifo dut(.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),
            .d_in(d_in),.full(full),.empty(empty),.d_out(d_out));

always #2 clk=~clk;

initial
begin 
    clk=0; rst=0; wr_en=0; rd_en=0;
    
    #3 rst=1;
    drive();
    #4 repeat(4) @(posedge clk) pop();
    drive();
    #7 repeat(4) @(posedge clk) push();
    drive();
    
    $finish;
  
end 

task push();
    if(!full)
    begin
        wr_en=1;
        d_in=$random;
        $display("Push In: wr_en=%b, rd_en=%b, data_in=%h",wr_en,rd_en,d_in);    
    end
    else $display("FIFO is full; Cannot push data:%h",d_in); 
endtask 

task pop();
    if(!empty)
    begin
        rd_en=1;
 
        $display("Pop out: wr_en=%b, rd_en=%b, data=%h",wr_en,rd_en,d_out);    
    end
    else $display("FIFO is Empty; Cannot pop"); 
endtask 

task drive();

begin    
    wr_en=0; #5 rd_en=0;
    fork
        begin
            repeat (12) begin @(posedge clk) push(); end
            wr_en=0;
        end
        begin 
            #15;
            repeat (10) begin @(posedge clk) pop(); end
            rd_en=0;
        end
    join
end
endtask 
endmodule 