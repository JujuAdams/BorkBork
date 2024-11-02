// Feather disable all

/// Simulates the "head" size of the listener. This applies an offset to all Bork emitters,
/// increasing their size to more realistically position emitter audio in the stereo field. This
/// is particularly noticeable when using point emitters - setting an appropriate head size will
/// prevent audio from quickly, and distractingly, moving from one ear to another as the listener
/// position passes by the emitter
/// 
/// @param size

function BorkSetHeadSize(_size)
{
    static _system = __BorkSystem();
    
    _system.__headSize = _size;
}