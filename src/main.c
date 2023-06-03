#pragma bank 255

#include <gb/gb.h>
#include <gbdk/platform.h>
#include "rand.h"
#include "sfx/musicmanager.h"

#include "gfx/image.h"
#include "gfx/map.h"

#include "display.h"

UINT8 old_bank;

UINT8 last_keys = 0;
UINT8 toggle = 0;

void input(void)
{
    UINT8 keys = joypad();
    if (keys & J_START && !(last_keys & J_START)) {
        if (toggle == 0) {
            toggle++;
            show_image(); // Banked Function that accesses Banked Data
        } else {
            toggle = 0;
            hide_image(); // Banked Function that accesses Banked Data
        }
    }
    last_keys = keys;
}

void init_music(void)
{
    // initialize the music and SFX driver
    music_init();

    CRITICAL {
        // set up the game boy timer
        music_setup_timer();
        // add music and SFX driver ISR to the low priority timer chain
        add_low_priority_TIM(music_play_isr);
    }
    // enable the timer interrupt
    set_interrupts(IE_REG | TIM_IFLAG);
}

void init_display(void)
{
    load_image(); // Banked Function that accesses Banked Data
    load_map();   // Banked Function that accesses Banked Data
    show_map();   // Banked Function that accesses Banked Data
    
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;
}

void init_rand(void)
{
    waitpad(0xff); // Using DIV_REG as seed is best after user input is received

    initrand(DIV_REG);
}

void main(void)
{
    init_music();
    init_display();
    init_rand();
    
    // Loop forever
    while(1) {
        // CHECK/EXECUTE STATE 
        switch (TRUE)
        {
        default:
            input();
            break;
        }

		// Done processing, yield CPU and wait for start of next frame
        wait_vbl_done();
    }
}