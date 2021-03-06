module serialization(clk,rst,data_in,data_out);
    input clk,rst;
    input [7:0] data_in;
    output [9:0] data_out;
    reg flag;
        reg [5:0] 5b/6b [31:0] [1:0];
        reg [3:0] 3b/4b [7:0] [1:0];
                
            initial begin 
                //inicia la tabla de 5b/6b
                5b/6b [0] [0] = 6'b100111; 
                5b/6b [0] [1] = 6'b011000;
            
                5b/6b [1] [0] = 6'b011101; 
                5b/6b [1] [1] = 6'b100010;
            
                5b/6b [2] [0] = 6'b101101; 
                5b/6b [2] [1] = 6'b010010;
            
                5b/6b [3] [0] = 6'b110001; 
                5b/6b [3] [1] = 6'b110001;
            
                5b/6b [4] [0] = 6'b110101; 
                5b/6b [4] [1] = 6'b001010;
            
                5b/6b [5] [0] = 6'b101001; 
                5b/6b [5] [1] = 6'b101001;
            
                5b/6b [6] [0] = 6'b011001; 
                5b/6b [6] [1] = 6'b011001;
            
                5b/6b [7] [0] = 6'b111000; 
                5b/6b [7] [1] = 6'b000111;
            
                5b/6b [8] [0] = 6'b111001; 
                5b/6b [8] [1] = 6'b000101;
            
                5b/6b [9] [0] = 6'b100101; 
                5b/6b [9] [1] = 6'b100101;
            
                5b/6b [10] [0] = 6'b010101; 
                5b/6b [10] [1] = 6'b010101;
            
                5b/6b [11] [0] = 6'b110100; 
                5b/6b [11] [1] = 6'b110100;
            
                5b/6b [12] [0] = 6'b001101; 
                5b/6b [12] [1] = 6'b001101;
            
                5b/6b [13] [0] = 6'b101100; 
                5b/6b [13] [1] = 6'b101100;
            
                5b/6b [14] [0] = 6'b011100; 
                5b/6b [14] [1] = 6'b011100;
            
                5b/6b [15] [0] = 6'b010111; 
                5b/6b [15] [1] = 6'b101000;
            
                5b/6b [16] [0] = 6'b011011; 
                5b/6b [16] [1] = 6'b100100;
            
                5b/6b [17] [0] = 6'b100011; 
                5b/6b [17] [1] = 6'b100011;
            
                5b/6b [18] [0] = 6'b010011; 
                5b/6b [18] [1] = 6'b010011;
            
                5b/6b [19] [0] = 6'b110010; 
                5b/6b [19] [1] = 6'b110010;
            
                5b/6b [20] [0] = 6'b001011; 
                5b/6b [20] [1] = 6'b001011;
            
                5b/6b [21] [0] = 6'b101010; 
                5b/6b [21] [1] = 6'b101010;
            
                5b/6b [22] [0] = 6'b011010; 
                5b/6b [22] [1] = 6'b011010;
            
                5b/6b [23] [0] = 6'b111010; 
                5b/6b [23] [1] = 6'b000101;
            
                5b/6b [24] [0] = 6'b110011; 
                5b/6b [24] [1] = 6'b001100;
            
                5b/6b [25] [0] = 6'b100110; 
                5b/6b [25] [1] = 6'b100110;
            
                5b/6b [26] [0] = 6'b010110; 
                5b/6b [26] [1] = 6'b010110;
            
                5b/6b [27] [0] = 6'b110110; 
                5b/6b [27] [1] = 6'b001001;
            
                5b/6b [28] [0] = 6'b001110; 
                5b/6b [28] [1] = 6'b001110;
            
                5b/6b [29] [0] = 6'b101110; 
                5b/6b [29] [1] = 6'b010001;
            
                5b/6b [30] [0] = 6'b011110; 
                5b/6b [30] [1] = 6'b100001;
            
                5b/6b [31] [0] = 6'b101011; 
                5b/6b [31] [1] = 6'b010100;
                //termina la tabla de 5b/6b
                //inicia la tabla de 3b/4b
                3b/4b [0] [0] = 4'b0100; 
                3b/4b [0] [1] = 4'b1011; 

                3b/4b [1] [0] = 4'b1001; 
                3b/4b [1] [1] = 4'b1001; 

                3b/4b [2] [0] = 4'b0101; 
                3b/4b [2] [1] = 4'b0101; 

                3b/4b [3] [0] = 4'b0011;  
                3b/4b [3] [1] = 4'b1100; 

                3b/4b [4] [0] = 4'b0010;  
                3b/4b [4] [1] = 4'b1101; 

                3b/4b [5] [0] = 4'b1010;  
                3b/4b [5] [1] = 4'b1010; 

                3b/4b [6] [0] = 4'b0110; 
                3b/4b [6] [1] = 4'b0110; 

                3b/4b [7] [0] = 4'b0001; 
                3b/4b [7] [1] = 4'b1110;
                //Termina la tabla de 3b/4b
            end

    always@(posedge clk)
        begin
            if (rst) begin
                flag <= 0;
                data_out <= 10'b0000000000;
                data_in <= 8b'b00000000;
            end
            else if (!rst) begin
                 case(data_in)

                     case 8'b00000000 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [0] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [0] [0];
                                flag <= 0;
                            end
                        end

                    case 8'b000000001 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [1] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [1] [0];
                                flag <= 0;
                            end
                        end

                        case 8'b00000010 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [0] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [0] [0];
                                flag <= 0;
                            end
                        end

                    case 8'b000000011 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [1] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [1] [0];
                                flag <= 0;
                            end
                        end

                        case 8'b00000100 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [0] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [0] [0];
                                flag <= 0;
                            end
                        end

                    case 8'b000000101 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [1] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [1] [0];
                                flag <= 0;
                            end
                        end

                        case 8'b00000110 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [0] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [0] [0];
                                flag <= 0;
                            end
                        end

                    case 8'b0000001 11 :
                        begin
                            if (flag == 0) begin
                                data_out <= 5b/6b [1] [1];
                                flag <= 1;
                            end 
                            else if (flag == 1) begin
                                data_out <= 5b/6b [1] [0];
                                flag <= 0;
                            end
                        end


                     default:

                 endcase
            end 
        end




endmodule