// Feather disable all

/// Sets the listener "head" for the player. This will typically be the centre of the view or the
/// player character’s position. If the optional "updateEmitters" argument is set to <true> then
/// Bork emitter positions will immediately be updated. This is useful to ensure accurate audio
/// but does carry a performance penalty.
/// 
/// @param x
/// @param y
/// @param [updateEmitters=false]

function BorkListenerSetPosition(_x, _y, _updateEmitters = false)
{
    static _system    = __BorkSystem();
    static _borkArray = _system.__borkArray;
    
    if (_updateEmitters && ((_x != _system.__listenerX) || (_y != _system.__listenerY)))
    {
        var _i = 0;
        repeat(array_length(_borkArray))
        {
            _borkArray[_i].__Update();
            ++_i;
        }
    }
    
    _system.__listenerX = _x;
    _system.__listenerY = _y;
    audio_listener_set_position(BORK_LISTENER_INDEX, _x, _y, 0);
}