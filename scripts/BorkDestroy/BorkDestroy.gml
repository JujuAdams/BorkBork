// Feather disable all

/// Destroys a Bork emitter. This will stop any audio playing on that emitter immediately. This
/// function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter

function BorkDestroy(_borkEmitter)
{
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    
    if (_borkEmitter == undefined) return;
    
    audio_emitter_free(_borkEmitter);
    ds_map_delete(_gmEmitterMap, _borkEmitter);
}