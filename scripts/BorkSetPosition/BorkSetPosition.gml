// Feather disable all

/// Set the position of the middle of a Bork emitter. If the Bork emitter doesn't exist this
/// function does nothing. This function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter
/// @param x
/// @param y

function BorkSetPosition(_borkEmitter, _x, _y)
{
    static _emitterArray = __BorkSystem().__emitterArray;
    
    var _index = (array_get_index(_emitterArray, _borkEmitter) >= 0);
    if (_index < 0) return;
    
    return _emitterArray[_index].__SetPosition(_x, _y);
}