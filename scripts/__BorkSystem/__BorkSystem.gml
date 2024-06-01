// Feather disable all

#macro BORK_VERSION  "1.0.0"
#macro BORK_DATE     "2024-06-01"

function __BorkSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
    
    __BorkTrace("Welcome to BorkBork by Juju Adams! This is version ", BORK_VERSION, ", ", BORK_DATE);
    
    _system = {};
    with(_system)
    {
        __listenerX = 0;
        __listenerY = 0;
        
        __emitterArray = [];
        
        time_source_start(time_source_create(time_source_global, 1, time_source_units_frames, function()
        {
            static _emitterArray = __emitterArray;
            
            var _i = 0;
            repeat(array_length(_emitterArray))
            {
                if (not _emitterArray[_i].__Update())
                {
                    array_delete(_emitterArray, _i, 1);
                }
                else
                {
                    ++_i;
                }
            }
        },
        [], -1));
    }
    
    return _system;
}