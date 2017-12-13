function out = final_AAGD( img,lmax,lmin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
out=zeros(size(img,1),size(img,2),length(lmin)+1);
for i=1:length(lmin)
    N=lmax(i)^2;
    N1=lmin(i)^2;
    N2=N-N1;
    mu_i=localmean(img,ones(lmin(i)));
    mu_e=localmean(img,ones(lmax(i)));
    mu_r=((N*mu_e)-(N1*mu_i))/N2;
    out(:,:,i)=(mu_i-mu_r).^2;
end
out(:,:,length(lmin)+1)=max(out(:,:,1:length(lmin)),[],3);
end

