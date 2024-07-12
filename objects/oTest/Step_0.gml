// Feather disable all

BorkListenerSetPosition(mouse_x, mouse_y);

if (keyboard_check_pressed(ord("1")))
{
    BorkDestroy(borkEmitter);
    borkEmitter = BorkPoint(room_width/2, room_height/2);
    audio_play_sound_on(borkEmitter, snd1KHz, true, 1);
}
else if (keyboard_check_pressed(ord("2")))
{
    BorkDestroy(borkEmitter);
    borkEmitter = BorkCircle(room_width/2, room_height/2, 60);
    audio_play_sound_on(borkEmitter, snd1KHz, true, 1);
}
else 
if (keyboard_check_pressed(ord("3")))
{
    BorkDestroy(borkEmitter);
    borkEmitter = BorkRectangle(room_width/2 - 200, room_height/2 - 200, room_width/2 + 200, room_height/2 + 200);
    audio_play_sound_on(borkEmitter, snd1KHz, true, 1);
}
else 
if (keyboard_check_pressed(ord("4")))
{
    BorkDestroy(borkEmitter);
    borkEmitter = BorkPolygon(0, [-300, 0, 0, 150, 300, 0, 0, -150], room_width/2, room_height/2);
    audio_play_sound_on(borkEmitter, snd1KHz, true, 1);
}
else 
if (keyboard_check_pressed(ord("5")))
{
    BorkDestroy(borkEmitter);
    borkEmitter = BorkPolyline(0, [-300, -150, 0, 150, 300, -150], room_width/2, room_height/2);
    audio_play_sound_on(borkEmitter, snd1KHz, true, 1);
}