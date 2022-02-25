function spl = spl_cal(signal)
%Compute the speech pressure level
%   
%   spl = spl_cal(signal) returns the effective sound pressure level
%   (SPL)(dB) of the given signal
%   
%   Here it uses signal value as spl, which is proportional to spl

p0 = 2*10^(-5); % ref (Pa)
N = length(signal);

pe = sqrt(1/N*sum(signal.^2));
spl = 20 * log10(pe/p0);

end