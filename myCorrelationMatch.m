function score = myCorrelationMatch(imgA, imgB)
%
%  write your correlation implementation
%
%  NO you cannot use MATLAB's correlation routine
%  the call to corr(.) is here as a benchmark
%  to show you this does really work
%
%  you may not use MATLAB's builtin routines
%  you must implement everything yourself.
%

[ROWS, COLS] = size(imgA);

aVec = double(reshape(imgA,ROWS*COLS,1));
bVec = double(reshape(imgB,ROWS*COLS,1));

%According to the formula

numerator = sum(aVec .* bVec) - (sum(aVec) * sum(bVec)) / length(aVec);
denominator = sqrt((sum(aVec .^2) - sum(aVec)^2 / length(aVec)) * (sum(bVec .^2) - sum(bVec)^2 / length(aVec)));
coeff = numerator / denominator;


score = coeff;
end