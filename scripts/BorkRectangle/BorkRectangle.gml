// Feather disable all

/// Creates a Bork rectangle emitter and returns an emitter index. This emitter index can be used
/// to  play audio as you would with a native GameMaker emitter. This emitter index can further be
/// used with Bork-specific functions such as BorkExists().
/// 
/// @param left
/// @param top
/// @param right
/// @param bottom

function BorkRectangle(_left, _top, _right, _bottom)
{
    return (new __BorkClassRectangle(_left, _top, _right, _bottom)).__gmEmitter;
}
