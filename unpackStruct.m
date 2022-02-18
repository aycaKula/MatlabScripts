function y = unpackStruct(structure)
    % Code used for writing parameters and their values (at time goes through 0 to 10s ) into a table/excel
    persistent t;
    if isempty(t) == t
        t = table();
    end
    
    fn = fieldnames(structure);
    for i = 1:numel(fn)
        fni = char(fn(i));
        field = structure.(fni);
        % Write data into table
        if isstruct(field) == 0
            t.time = field.Time;
            % There was a parameter with different type. So,
            if strcmp(fn, 'differentParam') == 1 
                A(:,1) = filed.Data(1,1,:);
                B(:,1) = filed.Data(2,1,:);
                C(:,1) = filed.Data(3,1,:);
                t.paramx = A;
                t.paramy = B;
                t.paramz = C;
            else
                t.(field.name) = field.Data;
            end
        end
        
        if (isstruct(field))
            ytemp = unpackStruct(field);
            continue;
        end
    end
    
    y = t;
    
    
    % writetable(inputs,'inputs.csv','Delimiter',';')
                

