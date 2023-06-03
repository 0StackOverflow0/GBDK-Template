#pragma bank 2
#include <gb/gb.h>

#include <gfx/image.h>
#include <gfx/map.h>

void show_image(void) BANKED
{
    move_metasprite(image_metasprites[0],0,0,64,48);
}

void hide_image(void) BANKED
{
    hide_metasprite(image_metasprites[0], 0);
}

void show_map(void) BANKED
{
    set_bkg_tiles(0,0,20,18,map_map);
}

void load_image(void) BANKED
{
    set_sprite_data(0,image_TILE_COUNT,image_tiles);
}

void load_map(void) BANKED
{
    set_bkg_data(0,map_TILE_COUNT,map_tiles);
}