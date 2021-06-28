% Gauss elimination with pivoting.
clc; clear all; close all;
A = [2 3 1;
     1 4 1;
     4 5 1;];

b = [-1;-1;1]
Aug = [A b];
[m,n] = size(A);
for i = 1:n % iterate through columns
   for j = i:m % iterate through rows
        for k = j+1:m % Pivoting.
           if abs(Aug(j,i))<abs(Aug(k,i)) % if bottow is less than top, swap
                 temp = Aug(k,:);
                 Aug(k,:) = Aug(j,:);
                 Aug(j,:) = temp;
            end
        end
    end
    for j = i+1:m % Forward elimination.
        factor = Aug(j,i)/Aug(i,i); % iterative coefficient / fixed coefficient
        Aug(j,:) = Aug(j,:) - Aug(i,:)*factor % iterative row - fixed row * factor
    end
end
% Backward substitution.
x = zeros(m,1);
x(m) = Aug(m,n+1)/Aug(m,n);
for i = m-1:-1:1
    x(i) = ( Aug(i,n+1) - Aug(i,i+1:n)*x(i+1:n,1) ) / Aug(i,i); % (b - ith Row up to excluding b * known xs ) / coefficient of interest   
end
disp('The output (solution) vector is'), x 

% checker
x = inv(A)*b