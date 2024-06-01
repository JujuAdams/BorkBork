// Feather disable all

/// Returns the y-position of the listener.

function BorkListenerGetY()
{
    static _system = __BorkSystem();
    
    return _system.__listenerY;
}