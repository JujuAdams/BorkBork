// Feather disable all

#macro BORK_VERSION  "1.1.0"
#macro BORK_DATE     "2024-07-12"

function __BorkSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    
    __BorkTrace("Welcome to BorkBork by Juju Adams! This is version ", BORK_VERSION, ", ", BORK_DATE, "(GM version ", GM_runtime_version, ")");
    
    _system = {};
    with(_system)
    {
        __listenerX = 0;
        __listenerY = 0;
        
        __headSize = 0;
        
        __borkArray    = [];
        __gmEmitterMap = ds_map_create();
        
        //Set up default behaviours within GM's audio system
        
        var _vinylFalloff = undefined;
        try
        {
            _vinylFalloff = VINYL_AUDIO_FALLOFF_MODEL;
        }
        catch(_error)
        {
            
        }
        
        if ((_vinylFalloff != undefined) && (BORK_FALLOFF_MODEL == undefined))
        {
            __BorkError("Please set `BORK_FALLOFF_MODEL` to `undefined` when using Vinyl");
        }
        
        var _falloffModel = _vinylFalloff ?? BORK_FALLOFF_MODEL;
        if (_falloffModel != undefined)
        {
            audio_falloff_set_model(BORK_FALLOFF_MODEL);
        }
        
        audio_listener_set_orientation(BORK_LISTENER_INDEX,   0, 0, 1,   0, -1, 0);
        audio_listener_set_position(BORK_LISTENER_INDEX,   0, 0, 0);
        
        time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
        {
            static _borkArray    = __borkArray;
            static _gmEmitterMap = __gmEmitterMap;
            
            var _i = 0;
            repeat(array_length(_borkArray))
            {
                if (not _borkArray[_i].__Update())
                {
                    ds_map_delete(_gmEmitterMap, _borkArray[_i].__gmEmitter);
                    array_delete(_borkArray, _i, 1);
                }
                else
                {
                    ++_i;
                }
            }
        },
        [], -1));
    }
    
    if (GM_build_type == "run") global.BorkBork = _system;
    
    return _system;
}