% This is a simple test program for the LF paper.
% If you need help in implementation, pleaset contact the authors.

close all;
clear;
% read data from USRP file
data = read_complex_binary('test');

% choose a segement of data
tp1 = data(4.5E6:4.7E6);

% focus on relative values
tp1 = abs(diff(tp1));

% compensate for clock offset
cycle = 249.953; 

% find peaks, choose value according to signal strenth
[pks,locs] = findpeaks(tp1,'MINPEAKHEIGHT',12E-3);
edgePos = locs;

% plot the cycle offset for each node
plot(mod(edgePos,cycle),'+');
xlabel('cycle count')
ylabel('cycle offset')
title('Different start time for each node')

% plot the peaks we've found
figure
plot(tp1);
hold on
plot(locs, tp1(locs),'r+');
title('Different peaks we have found')


% assume that we could find many tags
EClass = zeros(20,1000);   % 20 tags, 1000 edges
EClass(1,1) = edgePos(1);  % last valid length
bitLen = 250;
ELen = zeros(20,1);  
threshold = 2;
ELen(1) = 1;   
n = 1;  %number of decoded tags
for i=2:length(edgePos)
    for k=1:n
        if abs(125-mod( edgePos(i)-EClass(k,ELen(k)),250)) > 125-threshold
            ELen(k) = ELen(k) + 1;
            EClass(k,ELen(k)) = edgePos(i);
            break;
        else if k==n
            n = n + 1;
            ELen(n) = 1;
            EClass(n,ELen(n)) = edgePos(i);
            break;
            end;
        end
    end 
end

% plot the bits we've found
figure;
t = ceil(n/2);
for i=1:n
    subplot(t,2,i);
    plot(diff(EClass(i,1:ELen(i))),'-+');
    if ELen(i)>1
        xlim([1 ELen(i)])
    end
    ylim([200 500])
end


% display how many tags we've found
fprintf('Number of tags found: %d\r\n',n)
