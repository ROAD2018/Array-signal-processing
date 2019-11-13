function F = myfun(x)

ac=2.0;
bc=2.2;
cc=1.2;

F = [(x(2)-bc)-tan(110.1023*pi/180)*(ac-x(1));
(x(2)- 2.7047)-tan(140.0923*pi/180)*(1.2792-x(1));
(x(3)-cc)/sqrt((x(1)-ac)^2+(x(2)-bc)^2+(x(3)-cc)^2)];
end
