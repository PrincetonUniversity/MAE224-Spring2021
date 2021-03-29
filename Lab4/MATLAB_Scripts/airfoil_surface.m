function Sn = airfoil_surface(c) 
    %input: c, the chord length in meter
    %output: Sn, the surface area for each pressure tap, corresponding to the order of pressure transducers. 

    %%calculate the surface area for each pressure tap
    poslen = 30;
    arc = zeros(1,poslen); %the arc length between each adjacent points
    Sn = zeros(1,poslen); %surface area for each pressure tap, should be fixed
    [xn, yn, u, v] = airfoil_normals(0,1);
    naca = @(x,t,c) 5.*t./100.*c.*( 0.2969.*sqrt(x./c) ... %eqn to enerate NACA 0018 Points%
                    -0.1260.*(x./c) - 0.3516.*(x./c).^2 ...
                    +0.2843.*(x./c).^3 - 0.1015.*(x./c).^4 );
    n = 10;% # of points between two pressure taps

    for i = 1:poslen % 16 and 30 need special treatment
        %calculate the arc length between each point
        x1 = xn(i);
        if i == poslen
            x2 = xn(1);
        else
            x2 = xn(i+1);
        end
        xtmp = linspace(x1,x2,n);
        ytmp = naca(xtmp, 18,c);
        arc(i) = 0;
        for j = 1:length(xtmp)-1
            arc(i) = arc(i) + sqrt((xtmp(j+1)-xtmp(j)).^2 + (ytmp(j+1)-ytmp(j)).^2);
        end
    end

    arc(16) = 0;
    xtmp1 = linspace(xn(16),c,n);
    xtmp2 = linspace(c,xn(17),n);
    xtmp = [xtmp1,xtmp2];
    ytmp = naca(xtmp, 18,c);
    for j = 1:length(xtmp)-1
        arc(16) = arc(16) + sqrt((xtmp(j+1)-xtmp(j)).^2 + (ytmp(j+1)-ytmp(j)).^2);
    end

    for i = 2:poslen
        Sn(i) = 0.5*(arc(i-1)+arc(i));
    end
    Sn(1) = 0.5*(arc(1)+arc(poslen));
end
