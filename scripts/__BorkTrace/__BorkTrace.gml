// Feather disable all

function __BorkTrace()
{
    var _string = "BorkBork: ";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}