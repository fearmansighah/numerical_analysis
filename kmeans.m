clc
clear 
X = [1 1;
     1 2;
     4 4;
     5 4;
     5 6;
     ];
 

D = zeros(5,2) % store distances

A = zeros(5,1) % store cluster to assign

 % initial centroid
 z1 = [1 1]
 z2 = [1 2]
 c1_n = 0
 c2_n = 0
 c1_sum = [0 0]
 c2_sum = [0 0]
 
 for j = 1:3
     
    for i = 1:5

        D(i,1) = sqrt((X(i,1) - z1(1,1))^2 + (X(i,2) - z1(1,2))^2)
        D(i,2) = sqrt((X(i,1) - z2(1,1))^2 + (X(i,2) - z2(1,2))^2)
        
        if (D(i,1) < D(i,2))
            A(i,1) = 1
            c1_n = c1_n + 1;
            c1_sum = c1_sum + [X(i,1) X(i,2)];
        else
            A(i,1) = 2
            c2_n = c2_n + 1;
            c2_sum = c2_sum + [X(i,1) X(i,2)];
        end

    end
    
    % new centroid
    z1 = c1_sum/c1_n
    z2 = c2_sum/c2_n
    
    % reset
    c1_n = 0;
    c2_n = 0;
    c1_sum = [0 0];
    c2_sum = [0 0];

 end
    
