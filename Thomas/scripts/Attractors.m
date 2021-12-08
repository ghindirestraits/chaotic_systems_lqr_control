%%  ---------- Attractor Systems Studies ---------- %%

%% Cleaning and System Select
clc
clear 
close all

select=7; %1-Lorenz, 2-Rossler, 3-Chen, 4-Lu Chen, 5-Vallis, 6-Rikitake, 7-Gissinger, 8-Liu

%% Lorenz 

if select==1
    % Equation
    % dx = a*(y - x)
    % dy = x*(b - z) - y
    % dz = x*y - c*z

    % Parameters
    a = 10; b = 28; c = 8/3; d = 38; e=0;

    % Considering x = 0, we have   
    x=0;     
    disp('Lorenz')
    A = [ -a        a       0
           b       -1      -x
           0        x      -c ];
    eig(A)   

    % Considering coordinates change, z=z+d, we have
    % dx = a*(y - x)
    % dy = x*(b - z - d) - y
    % dz = x*y - c*(z + d)
    
    
    disp('Lorenz Modified z')
    A = [ -a        a       0
          b-d      -1      -x
           0        x      -c ];
    eig(A)  
end  

%% Rossler 

if select==2
    % Equation
    % dx = -y - z
    % dy = x + a*y
    % dz = x + z*(x-c)

    % Parameters
    %a = 0.2; b= 0.2; c = 5.7; %orginais usados por Rossler
    a = 0.1; b= 0.1; c = 14;  d=18; e=0; %comumente utilizado hoje em dia 

    % Considering x = 0, we have
    x=0; 
    disp('Rossler')    
    A = [  0     -1    -1
           1      a     0
           0     0    x-c ];       
    eig(A)

    % Considering coordinates change, z=z+d, we have
    % dx = - y - z - d
    % dy = x + a*y
    % dz = b + (z+d)*(x-c)

    % Considering x = 0, we have
    x=0; 
    disp('Rossler Modified z')    
    A = [  0     -1    -1
           1      a     0
           d      0    x-c ];      
    eig(A)

%     % Considering coordinates change, x=x+d, we have
%     % dx = -y - z
%     % dy = x + d + a*y
%     % dz = b + z*x + z*d - zc
% 
%     d=14;
%     % Considering x = 0, we have
%     x=0; 
%     disp('Rossler Modified x')    
%     A = [  0     -1    -1
%            1      a     0
%            0      0    x-c+d ];       
%     eig(A)    
    
end

%% Chen 

if select==3
    % Equation
    % dx = a*y - a*x
    % dy = (b-a)*x - x*z + b*y 
    % dz = x*y - c*z

    % Parameters
    a=35; b=28; c=3; d=28; e=0; 

    % Considering x = 0, we have
    x=0;
    disp('Chen')     
    A = [ -a    a    0
          b-a   b   -x
           0    x   -c ];    
    eig(A)

    % Considering coordinates change, z=z+d, we have
    % dx = a*y - a*x
    % dy = (b-a)*x - x*(z+d) + b*y 
    % dz = x*y - c*(z+d)
    
    % Considering x = 0, we have
    x=0; 
    disp('Chen Modified z')    
    A = [ -a    a    0
         b-a-d  b   -x
           0    x   -c ]    
    eig(A)
    
%     % Considering coordinates change, x=x+d, we have
%     % dx = a*y - a*x - a*d
%     % dy = b*x + b*d - x*a - a*d - x*z -z*d + b*y 
%     % dz = x*y + y*d - c*z
% 
%     d=28; 
%     % Considering x = 0, we have
%     x=0; 
%     disp('Chen Modified x')    
%     A = [ -a    a    0
%          b-a-d  b   -x-d
%            0   x+d   -c ];     
%     eig(A)    

end

%% Lu Chen 

if select==4
    % Equation
    % dx = a*y - a*x
    % dy = -x*z + b*y 
    % dz = x*y - c*z

    % Parameters
    a=36; b=28; c=3; d=36; e=0; %12.7> b >17  Lorenz,   23> b >28.5 -> Chen

    % Considering x = 0, we have
    x=0;
    disp('Lu Chen')     
    A = [ -a    a    0
           0    b   -x
           0    x   -c ];    
    eig(A)

    % Considering coordinates change, z=z+d, we have
    % dx = a*y - a*x
    % dy = -x*z -x*d + b*y 
    % dz = x*y - c*z -c*d

    % Considering x = 0, we have
    x=0; 
    disp('Lu Chen Modified z')    
    A = [ -a    a    0
          -d    b   -x
           0    x   -c ] ;   
    eig(A)   
end

%% Vallis 
if select==5
    % Equation
    % dx = a*y - b*x
    % dy = x*z - y 
    % dz = 1- x*y - z

    % Parameters
    a=124; b=5; c=0; d=0;e=0;
    x=0;y=0;
    disp('Vallis')     
    A = [ -b    a    0
           0   -1    x
           0   -x   -1 ] ;  
    eig(A)  
    

    disp('Vallis Changed')     
    A = [ -b    a    0
          -1   -1    x
           0   -x   -1 ] ;      
    eig(A)
    
end

%% Rikitake 

if select==6
% Equation
% dx = -a*x + y*z
% dy = -a*y + w*x 
% dz = 1 - x*y - b*z
% dw = 1 - x*y -c*w 

% Rikitake
% A1(:,:,k) = [ -a         0        x(2)      0
%                0        -a         0       x(1)
%                0       -x(1)      -b        0 
%                0       -x(1)       0       -c  ];  
%                                  
% A2(:,:,k) = [  0
%                0
%                1
%                1 ]; 


% Equation
% dx = -a*x + y*z
% dy = -a*y + w*x 
% dz = 1 - x*y - b*z
% dw = 1 - x*y -c*w 

% Rikitake
% A1(:,:,k) = [ -a         0        x(2)      0
%                0        -a         0       x(1)
%                0       -x(1)      -b        0 
%                0       -x(1)       0       -c  ];  
%                                  
% A2(:,:,k) = [  0
%                0
%                1
%                1 ]; 



    % Parameters
    %a=1; b=0.08; c=0.002;d=0; e=0;
     a=0.5; b=0.02; c=0.002;d=0; 
     a=0.2; b=0.03; c=0.03; e=0;
    % Considering x = 0, we have
    x=0;y=0;
    disp('Rikitake')     
    A = [ -a    0    y   0
           0   -a    0   x
           0   -x   -b   0
           0   -x    0  -c] ;    
    eig(A)

end

%% Gissinger  

if select==7
    % Equation
    % dx = a*x - y*z
    % dy = -b*y + x*z
    % dz = c - z + x*y

    % Parameters
    a = 0.11; b = 0.1; c = 0.9; d=0.5; e=0;

    % Considering x = 0, we have   
    x=0; y=0;     
    disp('Gissinger')
    A = [  a        0      -y
           0       -b       x
           0        x      -1 ];
    eig(A)   

    % Equation
    % dx = a*x - y*z -z*d
    % dy = -b*y + x*z -b*d
    % dz = c - z  + x*y + x*d
    
    % Considering x = 0, we have   
    x=0; y=0;     
    disp('Gissinger Changed')
    A = [  a        0     -y-d
           0       -b       x
           d        x      -1 ];
    eig(A)     
end

%% Liu 

if select==8
    % Equation
    % dx = a*y - a*x
    % dy = x*b - c*x*z 
    % dz = d*x*x - e*z

    % Parameters
    a=10; b=40; c=1; d=4;e=5/2; f=5;

    % Considering x = 0, we have   
    x=0;     
    disp('Liu')
    A = [ -a        a       0
           b        0      -x*c
           x*d       0      -e ];
    eig(A)   
    
    % Considering coordinates change, z=z+f, we have
    % dx = a*y - a*x
    % dy = x*b - c*x*z - c*x*f
    % dz = d*x*x - e*z - e*f
    
    disp('Liu Changed')
    A = [ -a          a       0
          b-c*f       0      -x*c
          x*x*d       0      -e ];
    eig(A)   
end  



%% Simulation

% Initialization 
tol=1e-12; %tolerance for the ode45 components
dt=0.001; %time sampling
tspan=dt:dt:200; %time vector
    if select ==6        
        x0 = [-0.1 0.5 -0.6 0.2]; %initial condition
        % Ode45 differential equations solver
        options = odeset('RelTol',tol,'AbsTol',[eps eps eps eps]);
    elseif select ==7
        x0 = [0.1 0.1 0]; %initial condition
        % Ode45 differential equations solver
        options = odeset('RelTol',tol,'AbsTol',[eps eps eps]);
    elseif select ==8
        x0 = [2.2 2.4 38]; %initial condition
        % Ode45 differential equations solver
        options = odeset('RelTol',tol,'AbsTol',[eps eps eps]);        
    else
        x0 = [-0.1 0.5 -0.6]; %initial condition
        % Ode45 differential equations solver
        options = odeset('RelTol',tol,'AbsTol',[eps eps eps]);        
    end

    [t,x] = ode45(@(t,x) F(t,x, a, b, c, d, e ,select), tspan, x0, options);


% Plot 3D

if select == 6 
    plot3(x(:,1),x(:,2),x(:,3),'w','Linewidth',1.5); grid 
    xlabel('x_{2}','FontSize', 20); 
    ylabel('x_{3}','FontSize', 20); 
    zlabel('x_{4}','FontSize', 20);
else
    plot3(x(:,1),x(:,2),x(:,3),'w','Linewidth',1.5); grid
    xlabel('x_{1}','FontSize', 20); 
    ylabel('x_{2}','FontSize', 20); 
    zlabel('x_{3}','FontSize', 20);   
end
set(gca,'color','k','xcolor','w','ycolor','w','zcolor','w')
set(gcf,'color','k')
if select==1 title('\color{white}Lorenz Attractor','FontSize', 20); end
if select==2 title('\color{white}Rossler Attractor','FontSize', 20); end
if select==3 title('\color{white}Chen Attractor','FontSize', 20); end
if select==4 title('\color{white}Lu Chen Attractor','FontSize', 20); end
if select==5 title('\color{white}Vallis Attractor','FontSize', 20); end
if select==6 title('\color{white}Rikitake Attractor','FontSize', 20); end 
if select==7 title('\color{white}Gissinger Attractor','FontSize', 20); end
if select==8 title('\color{white}Liu Attractor','FontSize', 20); end


% Function values generator
function dx = F(~,x, a, b, c, d, e, select)
    if select~=6
        dx = zeros(3,1);
    else
        dx = zeros(4,1);
    end
    
    if select==1  
        dx(1) = a*(x(2) - x(1));
        dx(2) = x(1)*(b - x(3) -d) - x(2);
        dx(3) = x(1)*x(2) - c*x(3) -c*d;    
        return
    end

    if select==2
        dx(1) = -x(2) - x(3)-d;
        dx(2) = x(1) + a*x(2);
        dx(3) = b + (x(3)+d)*(x(1)-c);        
        return
    end  
    
    if select==3
        dx(1) = a*(x(2)-x(1));
        dx(2) = (b-a)*x(1) - x(1)*(x(3)+d) + b*x(2);
        dx(3) = x(1)*x(2) - c*(x(3)+d);
        return
    end

    if select==4
        dx(1) = a*(x(2)-x(1));
        dx(2) = - x(1)*(x(3)+d) + b*x(2);
        dx(3) = x(1)*x(2) - c*(x(3)+d);
        return
    end   
    
     if select==5
%         dx(1) = a*x(2)- b*x(1);
%         dx(2) = x(1)*x(3) - x(2);
%         dx(3) = 1- x(1)*x(2) - x(3);
        dx(1) = a*x(2)- b*x(1);
        dx(2) = -x(1) + x(1)*x(3) - x(2);
        dx(3) = 2 - x(1)*x(2) - x(3);
        return       
     end      

     if select==6
        dx(1) = -a*x(1) + x(2)*x(3);
        dx(2) = -a*x(2) + x(4)*x(1);
        dx(3) = 1- x(1)*x(2) - x(3)*b;
        dx(4) = 1- x(1)*x(2) - x(4)*c;
        return
     end      
     if select==7
%         dx(1) = a*x(1) - x(2)*x(3);
%         dx(2) = -b*x(2) + x(1)*x(3);
%         dx(3) = c - x(3) + x(1)*x(2);
        dx(1) = a*x(1) - x(2)*x(3)- d*x(3);
        dx(2) = -b*x(2) + x(1)*x(3) - b*d;
        dx(3) = c - x(3) + x(1)*x(2)+ d*x(1);                    
        return       
     end  
    if select==8  
        dx(1) = a*(x(2) - x(1));
        dx(2) = x(1)*b - x(1)*x(3)*c;
        dx(3) = x(1)*x(1)*d - e*x(3); 
        
    % dx = a*y - a*x
    % dy = x*b - c*x*z 
    % dz = d*x*x - e*z        
        return
    end     
end

%% Politopos Sugeridos

%Lorenz     x_amp=[40 40 40];
%Rossler    x_amp=[20 20 20];
%Chen       x_amp=[35 35 35];
%Lu Chen    x_amp=[40 40 40];
%Vallis     x_amp=[15 15 15];
%Gissinger  x_amp=[4 4 4];
%Rikitake   x_amp=[5 5 5 5];
%% quasi-LPV form
%-------------------------------------------------------------------------%
%Lorenz
%         A1(:,:,k) = [   -a         a        0
%                         b-d       -1      -x(1)
%                          0        x(1)      -c    ];  
%                                  
%         A2(:,:,k) = [  0
%                        0
%                      -c*d ];   
%-------------------------------------------------------------------------%
%Rossler
%         A1(:,:,k) = [    0        -1        -1
%                          1         a         0
%                          d         0       x(1)-c    ];  
%                                  
%         A2(:,:,k) = [ -d
%                        0
%                      b-c*d ];   
%-------------------------------------------------------------------------%
%Chen
%         A1(:,:,k) = [   -a         a        0
%                        b-a-d       b      -x(1)
%                          0        x(1)      -c    ];  
%                                  
%         A2(:,:,k) = [  0
%                        0
%                      -c*d ];   
%-------------------------------------------------------------------------%
%Lu Chen
%         A1(:,:,k) = [   -a         a         0
%                         -d         b      -x(1)
%                          0        x(1)      -c    ];  
%                                  
%         A2(:,:,k) = [  0
%                        0
%                      -c*d ];   
%-------------------------------------------------------------------------%
%Vallis
%         A1(:,:,k) = [   -b         a         0
%                          0        -1        x(1)
%                          0       -x(1)      -1    ];  
%         A2(:,:,k) = [  0
%                        0
%                        1]; 
%
%Vallis Changed
%         A1(:,:,k) = [   -b         a         0
%                         -1        -1        x(1)
%                          0       -x(1)      -1    ];
% 
%         A2(:,:,k) = [  0
%                        0
%                        2]; 
%-------------------------------------------------------------------------%
%Rikitake
%         A1(:,:,k) = [   -a         0        x(2)      0
%                          0        -a         0       x(1)
%                          0       -x(1)      -b        0 
%                          0       -x(1)       0       -c  ];  
%                                  
%         A2(:,:,k) = [  0
%                        0
%                        1
%                        1 ];   
%-------------------------------------------------------------------------%
%Gissinger
%         A1(:,:,k) = [    a         0       -x(2)-d      
%                          0        -b         x(1)
%                          d        x(1)       -1      ];  
%                                  
%         A2(:,:,k) = [  0
%                      -b*d
%                        c  ];   
%-------------------------------------------------------------------------%

 
