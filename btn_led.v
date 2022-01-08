`timescale 1ns / 1ps

module toggle_led (
    input sysclk,   // system clock
    input [1:0]btn, // BTN1
    output [1:0]led // LED1
);

    reg btn_aligned; // button press aligned with system clock
    reg led_state;   // the current state of the LED 
    reg toggle_flag; // indicates whether to toggle the state 

    always @ (posedge sysclk) begin
        btn_aligned <= btn[0];
        // check if the btn has changed state
        toggle_flag <= btn[0] & ~btn_aligned;
        if (toggle_flag) begin
            // button has changed state, so toggle the led state
            led_state <= ~led_state;
        end
    end

    // set led to the internal state
    assign led[0] = led_state;
endmodule 
