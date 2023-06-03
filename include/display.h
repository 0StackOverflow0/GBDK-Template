#ifndef DISPLAY_H
#define DISPLAY_H

#include <gbdk/platform.h>

BANKREF_EXTERN(display)

extern void load_image() BANKED;
extern void show_image() BANKED;
extern void hide_image() BANKED;

extern void load_map() BANKED;
extern void show_map() BANKED;

#endif