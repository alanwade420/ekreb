function ekreb 

% reading the ekreb dictionary
words = readtable('words.csv');

% randomly generating 5 indices from the ekreb dictionary
randomnumbers = randi(4319, [1,5])';

rw = [];

    % making pretty table with randomly selected words (rw) 
    for n = 1:5
        x = randomnumbers(n,1);
        y = words(x,1);
        rw = [rw; y];
    end

rw_array = table2array(rw); 

% scramblin them bietchs
scrambledwords = {};

for nn = 1:5
    strang = rw_array(nn,1);
    scramloop = [];
    letters = [];
        
        % separating individual letters from selected word... :/
        for i = 1:strlength(strang) 
            % this extracts the ith letter in the selected word
            letter = extract(strang, i);
            % this just seperates them into individual cells in an array
            letters = [letters, letter];
        end

    % scrambling those extracted letters
    while length(letters) > 0
        % gettign random number within length of string
        index = randi(length(letters));
        % getting letter from that index of string
        l = letters{1, index};
        % deleting extracted letter from string
        letters{1, index} = {};
        empties = find(cellfun(@isempty, letters)); % identify the empty cells
        letters(empties) = [];                      % remove the empty cells
        % adding extracted letter to scrambled string
        scramloop = [scramloop, l];
    end   

% as yall can see here i am adding the scrambled letters to a cell
% array thing
scrambledwords = [scrambledwords; scramloop]; % i am a goddamn genius

end

correctwords = rw_array;

% who is ekreb what a mystery lets find out
scrambledwords = [scrambledwords; "ekreb"];

% saving variables scrambledwords and correctwords to the workspace so i
% can use them in the check function !
assignin('base', 'scrambledwords', scrambledwords)
assignin('base', 'correctwords', correctwords)

% printing shit (dont ask me why i had to use fprintf so many times i dont
% really know how that function works </3)
fprintf('Welcome to the Changer challenge! Unscramble these words...\n\n\n')
fprintf('%s\n', scrambledwords{:})
fprintf('\n\nPS! The sixth one is a bonus question. Answer it correctly for a surprise! If you need a hint, enter " hintplease ".\n\n')
fprintf('Enter your answer in the following format:\n\n')
fprintf('check(correctwords, "answer1", "answer2", "answer3", "answer4", "answer5", "answer6"))\n')
end
