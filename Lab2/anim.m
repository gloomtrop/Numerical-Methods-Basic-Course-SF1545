function anim(tut, fiut, L )

for i=1:length(tut)-1
    x0 = L*sin(fiut(i));y0 = -L*cos(fiut(i));
    plot([0, x0], [0, y0], "-o")
    axis equal
    axis([ -1 1 -1 0]*1.2*L)
    drawnow
    pause(tut(i + 1)-tut(i))
end

