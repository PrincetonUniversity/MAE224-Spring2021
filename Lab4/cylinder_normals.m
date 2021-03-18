function [ xn, yn, u, v ] = cylinder_normals()
%Code for outputting the Cylinder Surface Normals
%   aoa = current angle of attack (degrees)
% OUTPUTS: xn,yn pointer vectors from leading edge of cylinder
% u,v are the x and y components of the surface normals

r = 0.1/2;      %Cyl. radius (m)
dtheta = 15;    %Distance between each tap
%Generate angular locations%
%No taps at 30,0,-30 degrees (sting support)
theta = [180:-dtheta:30 -30:-dtheta:-165]'; 

    xn = r.*cos(theta.*pi./180) + r;%switch to cartesian
    yn = r.*sin(theta.*pi./180) ;

%Find Surface Normals%
xL = circshift(xn,[1,0]); xR = circshift(xn,[-1,0]); %Generate x and y area
yL = circshift(yn,[1,0]); yR = circshift(yn,[-1,0]); %elements that P acts on
    m = sqrt((xL-xR).^2 + (yL-yR).^2);
    v = (xR - xL)./m;
    u = (yL - yR)./m;
    
% Plot actual cylinder % 
figure(2)
    plot([xn;0],[yn;0],'bo-')
    hold on
%Plot surface  normals%
 quiver(xn,yn,u,v,'r');
    %Add some useful text%
    text(xn(1),yn(1),'Tap 1 (top)')
    text(xn(end),yn(end),'Tap 21 (bottom)')
    stag = find(xn == max(xn),1);
    text(xn(stag),yn(stag),'Tap 11 (top)')
    text(xn(stag+1),yn(stag+1),'Tap 12 (bottom)')
  hold off 
    
    
end

