// Feather disable all

/// Draw a visual representation of a BorkBork listener. This is useful for debugging.

function BorkListenerDraw()
{
    static _system = __BorkSystem();
    
    draw_circle(_system.__listenerX, _system.__listenerY, 15, true);
    draw_circle(_system.__listenerX, _system.__listenerY, 5, false);
}