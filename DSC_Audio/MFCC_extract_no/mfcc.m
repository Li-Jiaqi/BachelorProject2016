function r = mfcc(s, fs)
% MFCC????
% Reference: ???MFCC?LPCC???????????????
%
% Inputs: s  contains the signal to analize
%         fs is the sampling rate of the signal
%
% Output: r contains the transformed signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 6000;  % ??
m = 3000;  % ??
l = length(s);
nbFrame = floor((l - n) / m) + 1;  % ?????
for i = 1:n
  for j = 1:nbFrame
      M(i, j) = s(((j - 1) * m) + i);  % ??
  end
end
h = hamming(n);  % Hamming?w = 0.54 - 0.46*cos(2*pi*x);
M2 = diag(h) * M;  % ?M?????????M2
for i = 1:nbFrame
frame(:,i) = fft(M2(:, i));   % ??????????????????
end
t = n / 2;
% tmax = l / fs;
m = melfb(16, n, fs);  % ??20?MEL????????
n2 = 1 + floor(t);
z = m * abs(frame(1:n2, :  )).^2;  % ??n2????????
r = dct(log(z));  % ???????????
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%