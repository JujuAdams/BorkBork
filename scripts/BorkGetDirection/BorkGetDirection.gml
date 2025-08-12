// Feather disable all

/// Returns the direction from the listener to the given Bork emitter. If the emitter doesn't
/// exist, the default value is returned.
/// 
/// @param borkEmitter
/// @param [defaultValue=undefined]

function BorkGetDirection(_borkEmitter, _defaultValue = undefined)
{
    static _system = __BorkSystem();
    static _gmEmitterMap = _system.__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return _defaultValue;
    
    return point_direction(_system.__listenerX, _system.__listenerY, _borkStruct.__actualX, _borkStruct.__actualY);
}