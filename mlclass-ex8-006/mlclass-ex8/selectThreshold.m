function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

    % compte the predictions
    predictions = (pval < epsilon);

    % determine the count of correct predictions (true positive and true
    % negative)
    tp = sum((yval == 1) & (predictions == 1));
    %tn = sum((yval == 0) & (predictions == 0));

    % determine the count of errors of Type I (false positiove) and II (false
    % negative)
    fp = sum((yval == 0) & (predictions == 1));
    fn = sum((yval == 1) & (predictions == 0));

    % now compute precision and recall
    precision = tp / (tp + fp);
    recall = tp / (tp + fn);

    % now compute F1 score
    F1 = 2 * (precision * recall) / (precision + recall);
%fprintf('Precision, Recall, F1, Epsilon: %e, %e, %e, %e\n', precision, recall, F1, epsilon);

    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
