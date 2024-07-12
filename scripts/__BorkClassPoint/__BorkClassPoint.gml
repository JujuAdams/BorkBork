// Feather disable all

/// @param x
/// @param y

function __BorkClassPoint(_x, _y) constructor
{
    static _system       = __BorkSystem();
    static _borkArray    = _system.__borkArray;
    static _gmEmitterMap = _system.__gmEmitterMap;
    
    __gmEmitter = audio_emitter_create();
    
    array_push(_borkArray, self);
    _gmEmitterMap[? __gmEmitter] = self;
    
    __x      = _x;
    __y      = _y;
    __radius = 0.5*BORK_LISTENER_HEAD_SIZE;
    
    __falloffMin    = BORK_DEFAULT_FALLOFF_MIN;
    __falloffMax    = BORK_DEFAULT_FALLOFF_MAX;
    __falloffFactor = BORK_DEFAULT_FALLOFF_FACTOR;
    
    __Update();
    
    audio_emitter_velocity(__gmEmitter, 0, 0, 0);
    audio_emitter_gain(__gmEmitter, 1);
    audio_emitter_falloff(__gmEmitter, __falloffMin, __falloffMax, __falloffFactor);
    audio_emitter_bus(__gmEmitter, audio_bus_main);
    
    
    
    
    
    static __SetFalloff = function(_min, _max, _factor = 1)
    {
        _min = max(0, _min);
        _max = max(_min + math_get_epsilon(), _max);
        
        __falloffMin    = _min;
        __falloffMax    = _max;
        __falloffFactor = _factor;
        
        audio_emitter_falloff(__gmEmitter, __falloffMin, __falloffMax, __falloffFactor);
    }
    
    static __SetPosition = function(_x, _y)
    {
        __x =  _x;
        __y =  _y;
        
        __Update();
    }
    
    static __GetPosition = function()
    {
        static _result = {
            x: undefined,
            y: undefined,
        };
        
        _result.x = __x;
        _result.y = __y;
        
        return _result;
    }
    
    static __Draw = function()
    {
        draw_line(__x-7, __y-7, __x+7, __y+7);
        draw_line(__x+7, __y-7, __x-7, __y+7);
        draw_rectangle(__x-3, __y-3, __x+3, __y+3, true);
        
        draw_circle(__x, __y, __radius, true);
        
        draw_circle(__x, __y, __falloffMin, true);
        draw_circle(__x, __y, __falloffMax, true);
    }
    
    static __Update = function()
    {
        if (not audio_emitter_exists(__gmEmitter)) return false;
        
        __ManageFromCircle(__x, __y);
        
        audio_emitter_position(__gmEmitter, __actualX, __actualY, 0);
        
        return true;
    }
    
    static __ManageFromCircle = function(_circleX, _circleY)
    {
        var _dX = _system.__listenerX - _circleX;
        var _dY = _system.__listenerY - _circleY;
        
        var _length = sqrt(_dX*_dX + _dY*_dY);
        if (_length > __radius)
        {
            var _factor = __radius/_length;
            __actualX = _factor*_dX + _circleX;
            __actualY = _factor*_dY + _circleY;
        }
        else
        {
            __actualX = _system.__listenerX;
            __actualY = _system.__listenerY;
        }
    }
}
