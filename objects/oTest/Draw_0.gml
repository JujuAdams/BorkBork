// Feather disable all

BorkDraw(borkEmitter);
BorkListenerDraw();

var _string = "";
_string += "BorkBork " + BORK_VERSION + ", " + BORK_DATE + "\n";
_string += "\n";
_string += "1) Point\n";
_string += "2) Circle\n";
_string += "3) Rectangle\n";
_string += "4) Polygon\n";
_string += "5) Polyline\n";
draw_text(10, 10, _string);