// Feather disable all

/// Creates a Bork point emitter and returns an emitter index. This emitter index can be used to
/// play audio as you would with a native GameMaker emitter. This emitter index can further be used
/// with Bork-specific functions such as BorkExists().
/// 
/// @param x
/// @param y

function BorkPoint(_x, _y)
{
    return (new __BorkClassPoint(_x, _y)).__gmEmitter;
}
