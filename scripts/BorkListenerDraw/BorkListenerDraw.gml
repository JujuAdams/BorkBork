// Feather disable all

function BorkListenerDraw()
{
    static _system = __BorkSystem();
    
    draw_circle(_system.__listenerX, _system.__listenerY, 15, true);
    draw_circle(_system.__listenerX, _system.__listenerY, 5, false);
}