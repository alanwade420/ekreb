function check(correctwords, a1, a2, a3, a4, a5, a6)

correctwords;

points = [0];
    
    % strcmp command compares a1 entry to the correct unscrambled word
    if strcmp(a1, correctwords(1,1))
       points = points + 1;
    end

    if strcmp(a2, correctwords(2,1))
       points = points + 1;
    end

    if strcmp(a3, correctwords(3,1))
       points = points + 1;
    end

    if strcmp(a4, correctwords(4,1))
       points = points + 1;
    end

    if strcmp(a5, correctwords(5,1))
       points = points + 1;
    end
    % pardon my french :)
    if strcmp(a6, 'bitch')
       ekreb = imread('ekreb.jpg');
       imshow(ekreb)
    end

    points = (points/5) * 100;

fprintf('Score: %0.0f%/n', points)

end
       