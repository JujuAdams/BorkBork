// Feather disable all

/// Returns the x-position of the listener.

function BorkListenerGetX()
{
    static _system = __BorkSystem();
    
    return _system.__listenerX;
}