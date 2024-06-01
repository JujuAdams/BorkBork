// Feather disable all

/// Creates a Bork circle emitter and returns an emitter index. This emitter index can be used to
/// play audio as you would with a native GameMaker emitter. This emitter index can further be used
/// with Bork-specific functions such as BorkExists().
/// 
/// @param x
/// @param y
/// @param radius

function BorkCircle(_x, _y, _radius)
{
    return (new __BorkClassCircle(_x, _y, _radius)).__gmEmitter;
}
