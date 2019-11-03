function DrawCube(pos, scale)
pos
scale
    % cube 8 points
    points = 0.5 * [
        -1 -1 -1
        -1 -1 1
        1 -1 1
        1 -1 -1
        -1 1 -1
        -1 1 1
        1 1 1
        1 1 -1
    ];

    % homonous
    points = [points, ones(size(points, 1), 1)];

    % line idx
    lines = [
        1 2
        2 3
        3 4
        4 1
        5 6
        6 7
        7 8
        8 5
        1 5
        2 6
        3 7
        4 8
    ];

    % model matrix
    % scale
    S = [
        scale 0 0 0
        0 scale 0 0
        0 0 scale 0
        0 0 0 1
    ];
    % translate
    T = [
        1 0 0 pos(1)
        0 1 0 pos(2)
        0 0 1 pos(3)
        0 0 0 1
    ];
    model = T * S;

    % view matrix
    view = [
        1 0 0 0
        0 1 0 0
        0 0 -1 0
        0 0 0 1
    ];

    % project matrix
    project = [
        1 0 0 0
        0 1 0 0
        0 0 1 0
        0 0 1 0
    ];
    model * points'
    view * model * points'
    screenPos = project * view * model * points'
    screenPos = (screenPos(1:3, :) ./ screenPos(4, :))';
%     for i = 1 : size(screenPos, 1)
%         plot(screenPos(i, 1), screenPos(i, 2), 'y.', 'MarkerSize', 32);
%     end
    
    for i = 1 : size(lines, 1)
        plot(screenPos(lines(i,:), 1), screenPos(lines(i,:), 2), 'c', 'linewidth', 2);
    end
end