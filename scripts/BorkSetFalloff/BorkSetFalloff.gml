// Feather disable all

/// Set the falloff of a Bork emitter. If the Bork emitter doesn't exist this function does
/// nothing. This function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter
/// @param falloffMin
/// @param falloffMax
/// @param falloffFactor

function BorkSetFalloff(_borkEmitter, _falloffMin, _falloffMax, _falloffFactor)
{
    static _emitterArray = __BorkSystem().__emitterArray;
    
    var _index = (array_get_index(_emitterArray, _borkEmitter) >= 0);
    if (_index < 0) return;
    
    return _emitterArray[_index].__SetFalloff(_falloffMin, _falloffMax, _falloffFactor);
}