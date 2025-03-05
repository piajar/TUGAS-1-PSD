clear all; close all
disp('load speech: We');
load we.dat 
sig = we;                           
fs=8000;                            
lg=length(sig);                     
T=1/fs;                             
t=[0:1:lg-1]*T;              
sig=4.5*sig/max(abs(sig));   
Xmax = max(abs(sig));                          
Xrms = sqrt( sum(sig .* sig) / length(sig))    
disp('Xrms/Xmax')
k=Xrms/Xmax
disp('20*log10(k)=>');
k = 20*log10(k)
bits = input('input number of bits =>');
lg = length(sig);
for x=1:lg
  [Index(x) pq] = quantizer(bits, -5,5, sig(x));	
end

for x=1:lg
  qsig(x) = dequantizer(bits, -5,5, Index(x));		
end
  qerr = sig-qsig;				
subplot(3,1,1);plot(t,sig);
ylabel('Original speech');title('we.dat: "we"');
subplot(3,1,2);stairs(t, qsig);grid
ylabel('Quantized speech')
subplot(3,1,3);stairs(t, qerr);grid
ylabel('Quantized error')
xlabel('Time (sec.)');axis([0 0.25 -1 1]);
disp('signal to noise ratio due to quantization noise')
snr(sig,qsig);       
                      % qsig =quantized signal
