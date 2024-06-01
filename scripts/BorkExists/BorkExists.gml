// Feather disable all

/// Returns if the Bork emitter exists. This function will return <false> for native GameMaker
/// emitter.
/// 
/// @param borkEmitter

function BorkExists(_borkEmitter)
{
    static _emitterArray = __BorkSystem().__emitterArray;
    return (audio_emitter_exists(_borkEmitter) && (array_get_index(_emitterArray, _borkEmitter) >= 0));
}
