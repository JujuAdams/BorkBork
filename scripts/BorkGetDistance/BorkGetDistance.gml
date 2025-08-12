// Feather disable all

/// Returns the distance from the listener to the given Bork emitter. If the emitter doesn't exist,
/// `infinity` is returned.
/// 
/// @param borkEmitter

function BorkGetDistance(_borkEmitter)
{
    static _system = __BorkSystem();
    static _gmEmitterMap = _system.__gmEmitterMap;
    
    var _borkStruct = _gmEmitterMap[? _borkEmitter];
    if (_borkStruct == undefined) return infinity;
    
    return point_distance(_system.__listenerX, _system.__listenerY, _borkStruct.__actualX, _borkStruct.__actualY);
}