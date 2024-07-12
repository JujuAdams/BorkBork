// Feather disable all

/// @param borkEmitter

function BorkDraw(_borkEmitter)
{
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return undefined;
    
    return _borkStruct.__Draw();
}