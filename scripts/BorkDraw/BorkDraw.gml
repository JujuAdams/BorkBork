// Feather disable all

/// Draw a visual representation of a BorkBork emitter. This is useful for debugging.
/// 
/// @param borkEmitter

function BorkDraw(_borkEmitter)
{
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return undefined;
    
    return _borkStruct.__Draw();
}