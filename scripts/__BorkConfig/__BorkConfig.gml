// Feather disable all

//Falloff values to use for emitters when first created
#macro BORK_DEFAULT_FALLOFF_MIN      40 //Must be larger than 0
#macro BORK_DEFAULT_FALLOFF_MAX     200
#macro BORK_DEFAULT_FALLOFF_FACTOR    1

//Listener index to use for Bork functions
#macro BORK_LISTENER_INDEX  0

//Falloff model to use. This is set globally on boot. You probably don't need to adjust this but
//the option is there if you do. Set this macro to `undefined` to not set a falloff model on boot.
#macro BORK_FALLOFF_MODEL  audio_falloff_exponent_distance_scaled