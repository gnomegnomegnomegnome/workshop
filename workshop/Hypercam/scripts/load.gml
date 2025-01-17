
//Setup blade sprites mapping
//each sprite that has a blade gets its *_blade sprite registered in there
//use sprite_change_offset_bladed("spr", x, y); as usual 
if ("hsp" in self) //prevents error in workshop menu
{
    uhc_blade_spr_map = ds_map_create();
}

sprite_change_offset_bladed("idle", 19, 27);
 sprite_change_offset("hurt", 32, 62);
sprite_change_offset_bladed("crouch", 20, 22);
sprite_change_offset_bladed("walk", 18, 25);
sprite_change_offset_bladed("walkturn", 17, 24);
sprite_change_offset_bladed("dash", 18, 22);
sprite_change_offset_bladed("dashstart", 18, 23);
sprite_change_offset_bladed("dashstop", 18, 24);
sprite_change_offset_bladed("dashturn", 18, 22);

sprite_change_offset_bladed("jumpstart", 17, 24);
sprite_change_offset_bladed("jump", 21, 31);
sprite_change_offset_bladed("doublejump", 19, 30);
sprite_change_offset_bladed("doublejump_back", 19, 31);
 sprite_change_offset("walljump", 32, 62);
 sprite_change_offset("pratfall", 32, 62);
sprite_change_offset_bladed("land", 19, 26);
sprite_change_offset_bladed("landinglag", 19, 26);

 sprite_change_offset("parry", 32, 62);
 sprite_change_offset("roll_forward", 32, 62);
 sprite_change_offset("roll_backward", 32, 62);
sprite_change_offset_bladed("airdodge", 22, 26);
sprite_change_offset_bladed("waveland", 19, 26);
 sprite_change_offset("tech", 32, 62);

 sprite_change_offset("jab", 64, 94);
 sprite_change_offset("dattack", 64, 94);
 sprite_change_offset("ftilt", 32, 62);
sprite_change_offset_bladed("dtilt", 20, 20);
 sprite_change_offset("utilt", 64, 94);
sprite_change_offset_bladed("nair", 21, 31);
 sprite_change_offset("fair", 26, 44, true);
 sprite_change_offset("bair", 64, 94);
 sprite_change_offset("uair", 64, 94);
 sprite_change_offset("dair", 64, 94);

sprite_change_offset("fstrong", 17, 24, true);
 sprite_change_offset("ustrong", 64, 158);
 sprite_change_offset("dstrong", 64, 94);
sprite_change_offset("fstrong_air", 17, 24);
//sprite_change_offset("ustrong_air", 64, 158);
//sprite_change_offset("dstrong_air", 64, 94);

 sprite_change_offset("nspecial", 64, 94);
sprite_change_offset_bladed("fspecial", 17, 23);
sprite_change_offset_bladed("fspecial_air", 20, 27);
 sprite_change_offset("uspecial", 64, 94);
 sprite_change_offset("dspecial", 64, 94);
sprite_change_offset_bladed("taunt", 22, 22);

 sprite_change_offset("plat", 64, 94);

 sprite_change_offset("nspecial_proj", 64, 94);

sprite_change_offset("article_cd_idle", 19, 19);
sprite_change_offset("article_cd_shoot", 19, 19);
sprite_change_offset("article_cd_mask", 19, 19);
sprite_change_collision_mask("article_cd_mask", false, 0, noone, noone, noone, noone, 1);

sprite_change_offset("vfx_buffering", 12, 12);
sprite_change_offset("vfx_mini_buffering", 5, 5);
sprite_change_offset("vfx_flash_charge", -1, 21);
sprite_change_offset("vfx_flash_small", 0, 24);
sprite_change_offset("vfx_flash_medium", 0, 53);
sprite_change_offset("vfx_flash_large", 0, 107);

// See init::add_uhc_video() for the generalized version
// sprite_change_offset("video_blocked", 11, 8);

set_victory_theme(sound_get("victory"));
set_victory_bg(sprite_get("victory"));

//=================================================
// DEFINES
#define sprite_change_offset_bladed(_spr_name, _offset_x, _offset_y)
var _bladed_name = _spr_name + "_blade";
sprite_change_offset(_spr_name, _offset_x, _offset_y, true);
if ("uhc_blade_spr_map" in self)
{
   ds_map_set(uhc_blade_spr_map, sprite_get(_spr_name), sprite_get(_bladed_name));
   sprite_change_offset(_bladed_name, _offset_x, _offset_y);
}

