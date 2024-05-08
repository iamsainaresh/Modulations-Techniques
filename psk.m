EbN0_dB = 0:10; % Eb/N0 values in dB
EbN0 = 10.^(EbN0_dB/10); % Eb/N0 values in linear scale
M = [2, 4, 6, 8]; % PSK modulation orders
BER_PSK = zeros(length(M), length(EbN0_dB));

for i = 1:length(M)
    BER_PSK(i,:) = qfunc(sqrt(2*EbN0*M(i))); % Bit error rate for PSK modulation
end

% Plot
figure;
semilogy(EbN0_dB, BER_PSK(1,:), '-o', 'DisplayName', 'M=2');
hold on;
semilogy(EbN0_dB, BER_PSK(2,:), '-o', 'DisplayName', 'M=4');
semilogy(EbN0_dB, BER_PSK(3,:), '-o', 'DisplayName', 'M=6');
semilogy(EbN0_dB, BER_PSK(4,:), '-o', 'DisplayName', 'M=8');
grid on;
xlabel('Eb/N0 (dB)');
ylabel('Bit Error Rate (BER)');
title('BER Performance of PSK Modulation');
legend;
