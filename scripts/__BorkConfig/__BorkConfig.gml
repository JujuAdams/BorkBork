// Feather disable all

//Falloff values to use for emitters when first created
#macro BORK_DEFAULT_FALLOFF_MIN      40 //Must be larger than 0
#macro BORK_DEFAULT_FALLOFF_MAX     200
#macro BORK_DEFAULT_FALLOFF_FACTOR    1

//Simulates the "head" size of the listener. This applies an offset to all Bork emitters,
//increasing their size to more realistically position emitter audio in the stereo field. This
//is particularly noticeable when using point emitters - setting an appropriate head size will
//prevent audio from quickly, and distractingly, moving from one ear to another as the listener
//position passes by the emitter
#macro BORK_LISTENER_HEAD_SIZE  0

//Listener index to use for Bork functions
#macro BORK_LISTENER_INDEX  0

//Falloff model to use. This is set globally on boot. You probably don't need to adjust this but
//the option is there if you do!
#macro BORK_FALLOFF_MODEL  audio_falloff_exponent_distance_scaled