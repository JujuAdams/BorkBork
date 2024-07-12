// Feather disable all

/// @param radius
/// @param pointArray
/// @param x
/// @param y

function __BorkClassPolyline(_radius, _pointArray, _x, _y) constructor
{
    static _system       = __BorkSystem();
    static _borkArray    = _system.__borkArray;
    static _gmEmitterMap = _system.__gmEmitterMap;
    
    __gmEmitter = audio_emitter_create();
    
    array_push(_borkArray, self);
    _gmEmitterMap[? __gmEmitter] = self;
    
    var _length = array_length(_pointArray);
    if ((_length mod 2) != 0) __BorkError("Polyline-type emitters should have an even number of elements, structured as coordinate pairs (length=", _length, ")");
    if (_length < 4) __BorkError("Polyline-type emitters should have at least 2 coordinate pairs (length=", _length, ")");
    
    __radius     = _radius + 0.5*BORK_LISTENER_HEAD_SIZE;
    __pointArray = _pointArray;
    __x          = _x;
    __y          = _y;
    
    __falloffMin    = BORK_DEFAULT_FALLOFF_MIN;
    __falloffMax    = BORK_DEFAULT_FALLOFF_MAX;
    __falloffFactor = BORK_DEFAULT_FALLOFF_FACTOR;
    
    __BuildBoundsFromPointArray();
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
        draw_line(__actualX-7, __actualY-7, __actualX+7, __actualY+7);
        draw_line(__actualX+7, __actualY-7, __actualX-7, __actualY+7);
        
        draw_primitive_begin(pr_linestrip);
        
        var _i = 0;
        repeat(array_length(__pointArray) div 2)
        {
            draw_vertex(__pointArray[_i] + __x, __pointArray[_i+1] + __y);
            _i += 2;
        }
        
        draw_primitive_end();
        draw_circle(__actualX, __actualY, __radius, true);
        
        draw_circle(__actualX, __actualY, __falloffMin, true);
        draw_circle(__actualX, __actualY, __falloffMax, true);
    }
    
    static __Update = function()
    {
        if (not audio_emitter_exists(__gmEmitter)) return false;
        
        __ManageFromEdges();
        audio_emitter_position(__gmEmitter, __actualX, __actualY, 0);
        
        return true;
    }
    
    static __ManageFromEdges = function()
    {
        var _px = _system.__listenerX - __x;
        var _py = _system.__listenerY - __y;
        
        var _pointArray = __pointArray;
        
        var _x0 = undefined;
        var _y0 = undefined;
        var _x1 = _pointArray[0];
        var _y1 = _pointArray[1];
        
        var _minDist = infinity;
        var _minI    = undefined;
        
        //Find the closest line to the point
        var _i = 0;
        repeat((array_length(_pointArray) div 2)-1)
        {
            _x0 = _x1;
            _y0 = _y1;
            _x1 = _pointArray[_i+2];
            _y1 = _pointArray[_i+3];
             
            var _distance = __DistanceToEdge(_px, _py, _x0, _y0, _x1, _y1);
            if (_distance < _minDist)
            {
                _minDist = _distance;
                _minI    = _i;
            }
            
            _i += 2;
        }
        
        if (_minI != undefined)
        {
            //Get the point on the line closest to the listener
            var _point = __ClosestPointOnEdge(_px, _py, _pointArray[_minI], _pointArray[_minI+1], _pointArray[_minI+2], _pointArray[_minI+3]);
            
            //We then use the same maths as the Circle emitter to create a circular area around the polyline
            __ManageFromCircle(_point.x + __x, _point.y + __y);
        }
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
    
    static __BuildBoundsFromPointArray = function()
    {
        __left   =  infinity;
        __top    =  infinity;
        __right  = -infinity;
        __bottom = -infinity;
        
        var _pointArray = __pointArray;
        var _i = 0;
        repeat(array_length(_pointArray) div 2)
        {
            var _x = _pointArray[_i  ];
            var _y = _pointArray[_i+1];
            
            __left   = min(_x, __left  );
            __top    = min(_y, __top   );
            __right  = max(_x, __right );
            __bottom = max(_y, __bottom);
            
            _i += 2;
        }
        
        __x += 0.5*(__left + __right);
        __y += 0.5*(__top + __bottom);
    }
    
    static __DistanceToEdge = function(_px, _py, _x0, _y0, _x1, _y1)
    {
        var _dx = _x1 - _x0;
        var _dy = _y1 - _y0;
        var _lengthSqr = _dx*_dx + _dy*_dy;
        
        //Edge case where the line has length 0
        if (_lengthSqr <= 0) return point_distance(_px, _py, _x0, _y0);
        
        var _t = clamp((_dx*(_px - _x0) + (_py - _y0)*_dy) / _lengthSqr, 0, 1);
        return point_distance(_px, _py, _x0 + _t*_dx, _y0 + _t*_dy);
    }
    
    static __ClosestPointOnEdge = function(_px, _py, _x0, _y0, _x1, _y1)
    {
        static _result = {
            x: undefined,
            y: undefined,
        }
        
        var _dx = _x1 - _x0;
        var _dy = _y1 - _y0;
        var _lengthSqr = _dx*_dx + _dy*_dy;
        
        //Edge case where the line has length 0
        if (_lengthSqr <= 0)
        {
            _result.x = _x0;
            _result.y = _y0;
        }
        else
        {
            var _t = clamp((_dx*(_px - _x0) + (_py - _y0)*_dy) / _lengthSqr, 0, 1);
            _result.x = _x0 + _t*_dx;
            _result.y = _y0 + _t*_dy;
        }
        
        return _result;
    }
}
