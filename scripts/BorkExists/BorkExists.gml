// Feather disable all

/// Returns if the Bork emitter exists. This function will return <false> for native GameMaker
/// emitter.
/// 
/// @param borkEmitter

function BorkExists(_borkEmitter)
{
    static _gmEmitterMap = __BorkSystem().__gmEmitterMap;
    return (audio_emitter_exists(_borkEmitter) && ds_map_exists(_gmEmitterMap, _borkEmitter));
}
