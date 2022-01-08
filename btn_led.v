`timescale 1ns / 1ps

module toggle_led (
    input sysclk,     // system clock
    input [1:0]btn,   // BTN1
    output [1:0]led   // LED1
);          

    reg btn_aligned;  // button press aligned with system clock
    reg state;        // the current state of the LED 
    reg toggle_flag;  // indicates whether to toggle the state 

    always @ (posedge sysclk) begin
        btn_aligned <= btn[0];
        toggle_flag <= btn[0] & ~btn_aligned;
        if (toggle_flag) begin
            // toggle the state
            state <= ~state;
        end
    end
    
    // set led to the internal state
    assign led[0] = state;
endmodule 
