module serialization(clk,rst,data_in,data_out);
    input clk,rst;
    input [7:0] data_in;
    output [9:0] data_out;
    wire flag;
        reg [5:0] 5b/6b [31:0] [1:0];
        reg [3:0] 5b/6b [16:0] [1:0];

    always@(posedge clk)
        begin
            if(flag == 1)
                begin
                    for ( = ; ; ) begin
                        
                    end
                end
        end




endmodule