`timescale 1ns / 1ps

module pos_edge_det (
    input [1:0]btn,           
    input sysclk,          
    output [1:0]led   // Led output
);          

    reg sig_dly;
    reg out;                 
    reg pe;

    always @ (posedge sysclk) begin
        sig_dly <= btn[0];
        pe <= btn[0] & ~sig_dly;
        if (pe) begin
            out <= ~out;
        end
    end
    
    assign led[0] = out;
endmodule 


//module btn_led(
// //   input rst,        // reset
//    input sysclk, 
//    input [1:0]btn,   // Button inputs
//    output [1:0]led   // Led outputs
//    );

//reg [1:0] last_btn_state;
//reg [1:0] state;

//////state encoding
////parameter SOff = 1'b0;
////parameter SOn  = 1'b1;
 
////always @(posedge sysclk) begin
////   if (btn[0]) curr_btn_state <= SOn;
////   else curr_btn_state <= SOff;
////end

//always @(posedge sysclk) begin
//   if (btn[0] != last_btn_state) begin
//       state = !state;
//       last_btn_state = btn[0];
//   end
//end

//assign led[0] = state;


////module btn_led(
////    input [1:0]btn,   // Button inputs
////    output [1:0]led  // Led outputs
////    );
    
////    // Assign each btn to it's respective led
////    assign led[0] = btn[1];
////    assign led[1] = btn[0];

//endmodule
