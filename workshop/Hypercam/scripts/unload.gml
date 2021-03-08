//==============================================================
//Clean up data structures
if ("uhc_blade_spr_map" in self && ds_map_valid(uhc_blade_spr_map))
{
    ds_map_destroy(uhc_blade_spr_map);
}
//==============================================================
//prevent this from looping in the CSS
if (uhc_taunt_current_video != noone)
{
    sound_stop(uhc_taunt_current_video.song);
}

//==============================================================
//Sending win quotes to result screen
if (!uhc_handled_victory_quote)
{
    // Naive solution: cram into keyboard_string
    // interpreted as a string buffer, limit of 1024 chars
    // format: uhc:{<playernumber><priority><string data>¤}
    var assembled_string = "uhc{";
    
    with (oPlayer) 
    {
        if ("uhc_victory_quote" in self)
        {
            var priority = "1"; // todo: secret priority win quote
            assembled_string += string(player) + priority + uhc_victory_quote + "¤";
        }
        else
        {
            var builtin_quote = try_get_quote(url);
            if (string_length(builtin_quote) > 0)
            { assembled_string += string(player) + "1" + builtin_quote + "¤"; }
        }
        uhc_handled_victory_quote = true; //only one Hypercam has to handle this for everyone
    }
    
    keyboard_string = assembled_string + "}"
                    // Hi.
                    // This is a bit of a hack; smuggling a set of values in this keyboard_string...
                    // So I am copying over the previous keyboard_string in case you use it too.
                    // (whatever still fits in the 1024 limit)
                    // I would ask that you do the same, in case both our mods fight together!
                    + string_copy(keyboard_string, 0, 
                                  min(string_length(keyboard_string), 
                                      1020 - string_length(assembled_string)));
    
    // Ideal solution... not sure why GML panics...?
    // Sneak this list to victory screen; which will decide which quote to pick
    // WARNING: this depends on init_shader.gml to clean it up later & avoid a blatant memory leak
    /*
    var list = ds_list_create();
    ds_list_set(list, 0, "Hoi");
    set_color_profile_slot(0, 8, list, 0, 0); //Can't input: not a number?
    sprite_change_offset("victory_quote_bg", list+0, 0); //Can't do arithmetic on a ds_list index?
    */
}

//==============================================================
#define try_get_quote(char_url)
{
    var quote = "";
    switch (url)
    {
        case CH_KRAGG: 
           quote = "How 2 get mincraft free no virus 100% workign 2011"; 
           break;
        default: break;
    }
    return quote;
}
