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
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return undefined;
    
    return _borkStruct.__SetFalloff(_falloffMin, _falloffMax, _falloffFactor);
}