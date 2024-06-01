// Feather disable all

/// Returns the position of the middle of a Bork emitter. If no such Bork emitter exists, this
/// function will return <undefined>. This function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter

function BorkGetPosition(_borkEmitter)
{
    static _emitterArray = __BorkSystem().__emitterArray;
    
    var _index = (array_get_index(_emitterArray, _borkEmitter) >= 0);
    if (_index < 0) return undefined;
    
    return _emitterArray[_index].__GetPosition();
}