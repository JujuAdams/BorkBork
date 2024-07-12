// Feather disable all

/// Returns the position of the middle of a Bork emitter. If no such Bork emitter exists, this
/// function will return <undefined>. This function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter

function BorkGetPosition(_borkEmitter)
{
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return undefined;
    
    return _borkStruct.__GetPosition();
}