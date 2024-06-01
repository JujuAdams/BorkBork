// Feather disable all

/// Destroys a Bork emitter. This will stop any audio playing on that emitter immediately. This
/// function cannot be used with native GameMaker emitters.
/// 
/// @param borkEmitter

function BorkDestroy(_borkEmitter)
{
    static _emitterArray = __BorkSystem().__emitterArray;
    
    if (_borkEmitter == undefined) return;
    
    //Destroy the native GameMaker emitter
    audio_emitter_free(_borkEmitter);
    
    //Delete the reference to the emitter struct
    var _index = (array_get_index(_emitterArray, _borkEmitter) >= 0);
    if (_index < 0) array_delete(_emitterArray, _index, 1);
}