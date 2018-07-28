    s1 = serial('COM6', 'Tag', 'Oscilloscope');
    %s2 = serial('COM2', 'Tag', 'FunctionGenerator');
    fopen(s1); 
    out1 = instrfind('Type', 'serial')
    out2 = instrfind('Tag', 'Oscilloscope')
    out3 = instrfind({'Port', 'Tag'}, {'COM2', 'FunctionGenerator'})