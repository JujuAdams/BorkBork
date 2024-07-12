// Feather disable all

/// Set the position of the middle of a Bork emitter. If the Bork emitter doesn't exist this
/// function does nothing. This function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter
/// @param x
/// @param y

function BorkSetPosition(_borkEmitter, _x, _y)
{
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return undefined;
    
    return _borkStruct.__SetPosition(_x, _y);
}