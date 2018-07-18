function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

positive_samples = find(y==1);
negative_samples = find(y==0);

for i=positive_samples
        plot(X(i,1), X(i,2),'k+');
end

for i=negative_samples
        plot(X(i,1), X(i,2),'ko');
end


    







% =========================================================================



hold off;

end
