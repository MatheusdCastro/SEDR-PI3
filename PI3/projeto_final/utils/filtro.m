A = importdata('output.txt');
B = importdata('time.txt');
M2=A(:,2);
M1=A(:,1);
T=B(:,1)*(10e-7);

M1=M1/(2^24);
M2=M2/(2^24);
plot(T,M1);
hold on;
plot(T,M2);

s=size(M1);
val=0;
t=0:s(1,1)-1;
t=t*50e-9;
for i=405:s(1,1)
    if(abs(M1(i,1)-M2(i,1))<1*.1)
        val=i;
        break;
    end
end
stepp=stepinfo(M2,t);
pp=stepp.RiseTime;
fc=.35/pp
cycles=val-405
time=((cycles)*50)/1000
%axis([0,inf,0,2])