function [ I, pq]= quantizer(NoBits,Xmin,Xmax,value)

  L=2^NoBits;
  delta=(Xmax-Xmin)/L;
  I=round((value-Xmin)/delta);
  if ( I==L)
    I=I-1;
end
if I<0
   I=0;
end
pq=Xmin+I*delta;