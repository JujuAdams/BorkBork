// Feather disable all

//borkEmitter = BorkPoint(room_width/2, room_height/2);
//borkEmitter = BorkCircle(room_width/2, room_height/2, 60);
//borkEmitter = BorkRectangle(room_width/2 - 200, room_height/2 - 200, room_width/2 + 200, room_height/2 + 200);
//borkEmitter = BorkPolygon(0, [-300, 0, 0, 150, 300, 0, 0, -150], room_width/2, room_height/2);
borkEmitter = BorkPolyline(0, [-300, -150, 0, 150, 300, -150], room_width/2, room_height/2);

audio_play_sound_on(borkEmitter, snd1KHz, true, 1);