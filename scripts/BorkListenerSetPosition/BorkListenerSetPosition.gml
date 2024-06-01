// Feather disable all

/// Sets the listener "head" for the player. This will typically be the centre of the view or the
/// player character’s position.
/// 
/// @param x
/// @param y

function BorkListenerSetPosition(_x, _y)
{
    static _system = __BorkSystem();
    
    _system.__listenerX = _x;
    _system.__listenerY = _y;
}