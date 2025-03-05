clear all; close all
disp('Generate 0.02-second sine wave of 100 Hz and Vp=5');
fs=8000;                                       
T=1/fs;                                        
t=0:T:0.02;                                    
sig = 4.5*sin(2*pi*100*t);                     
bits = input('input number of bits =>');
lg = length(sig);                              
for x=1:lg
  [Index(x)  pq] = quantizer(bits, -5,5, sig(x)); 
end

for x=1:lg
  qsig(x) = dequantizer(bits, -5,5, Index(x)); 
end
  qerr = qsig-sig;		                   
stairs(t,qsig); hold                       
plot(t,sig); grid;                         
xlabel('Time (sec.)'); ylabel('Quantized x(n)')
disp('Signal to noise ratio due to quantization')
snr(sig,qsig);
