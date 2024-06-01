// Feather disable all

/// Creates a Bork polyline emitter and returns an emitter index. This emitter index can be used to
/// play audio as you would with a native GameMaker emitter. This emitter index can further be used
/// with Bork-specific functions such as BorkExists().
/// 
/// @param radius
/// @param pointArray/path
/// @param [xOffset=0]
/// @param [yOffset=0]

function BorkPolyline(_radius, _pointArray, _x = 0, _y = 0)
{
    if (is_handle(_pointArray))
    {
        var _path = _pointArray;
        if (!path_exists(_path)) __BorkError("Path ", _path, " doesn't exist");
        
        var _length = path_get_number(_path);
        _pointArray = array_create(2*_length);
        
        var _i = 0;
        var _j = 0;
        repeat(_length)
        {
            _pointArray[@ _j  ] = path_get_point_x(_path, _i);
            _pointArray[@ _j+1] = path_get_point_y(_path, _i);
            ++_i;
            _j += 2;
        }
    }
    
    return (new __BorkClassPolyline(_radius, _pointArray, _x, _y)).__gmEmitter;
}
