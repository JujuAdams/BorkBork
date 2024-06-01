// Feather disable all

/// @param left
/// @param top
/// @param right
/// @param bottom

function __BorkClassRectangle(_left, _top, _right, _bottom) constructor
{
    static _system = __BorkSystem();
    
    __gmEmitter = audio_emitter_create();
    
    __left   = -0.5*BORK_LISTENER_HEAD_SIZE + _left;
    __top    = -0.5*BORK_LISTENER_HEAD_SIZE + _top;
    __right  =  0.5*BORK_LISTENER_HEAD_SIZE + _right;
    __bottom =  0.5*BORK_LISTENER_HEAD_SIZE + _bottom;
    
    __x = 0.5*(__left + __right);
    __y = 0.5*(__top + __bottom);
    
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
        var _dx = _x - __x;
        var _dy = _y - __y;
        
        __x       =  _x;
        __y       =  _y;
        __left   += _dx;
        __top    += _dy;
        __right  += _dx;
        __bottom += _dy;
        
        //Immediately update
        if ((_dx != 0) || (_dy != 0)) __Update();
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
        
        draw_rectangle(__left, __top, __right, __bottom, true);
        
        draw_circle(__x, __y, __falloffMin, true);
        draw_circle(__x, __y, __falloffMax, true);
    }
    
    static __Update = function()
    {
        if (not audio_emitter_exists(__gmEmitter)) return false;
        
        __actualX = clamp(_system.__listenerX, __left, __right );
        __actualY = clamp(_system.__listenerY, __top,  __bottom);
        audio_emitter_position(__gmEmitter, __actualX, __actualY, 0);
        
        return true;
    }
}
