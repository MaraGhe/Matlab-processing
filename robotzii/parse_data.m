function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    file = fopen(filename, 'r')

    n = fscanf(filename, '%d', 1)
    x = fscanf(filename, '%d', n+1)'
    y = fscanf(filename, '%d', n+1)'

    fclose(filename)
end
