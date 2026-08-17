clc;
clear;

%% Run Simulink Model
open("wavelet_transform.slx");
simOut = sim("wavelet_transform.slx");

%% Read Current Signals
currentA = simOut.current1.signals.values;
currentB = simOut.current2.signals.values;
currentC = simOut.current3.signals.values;

%% Mother Wavelets
wavelets = {'haar','db2','db4','db6','sym4','coif1'};
n = length(wavelets);

DetectionTime = zeros(n,1);
MaxCoefficient = zeros(n,1);
WaveletEnergy = zeros(n,1);
FaultStatus = strings(n,1);

threshold = 5;

%% Wavelet Analysis
for k = 1:n

    tic

    [cA,LA] = wavedec(currentA,4,wavelets{k});
    [cB,LB] = wavedec(currentB,4,wavelets{k});
    [cC,LC] = wavedec(currentC,4,wavelets{k});

    dA = detcoef(cA,LA,1);
    dB = detcoef(cB,LB,1);
    dC = detcoef(cC,LC,1);

    DetectionTime(k) = toc;

    MaxCoefficient(k) = max(abs([dA; dB; dC]));

    WaveletEnergy(k) = sum(dA.^2 + dB.^2 + dC.^2);

    FaultStatus(k) = "No Fault";
    if MaxCoefficient(k) > threshold
        FaultStatus(k) = "Fault";
    end

end

%% Result Table
Results = table(wavelets',DetectionTime,MaxCoefficient,...
                WaveletEnergy,FaultStatus);

disp(Results)

%% Graphs
figure
bar(DetectionTime)
set(gca,'XTickLabel',wavelets)
xlabel('Mother Wavelet')
ylabel('Detection Time (s)')
title('Detection Time')
grid on

figure
bar(MaxCoefficient)
set(gca,'XTickLabel',wavelets)
xlabel('Mother Wavelet')
ylabel('Maximum Detail Coefficient')
title('Maximum Detail Coefficient')
grid on

figure
bar(WaveletEnergy)
set(gca,'XTickLabel',wavelets)
xlabel('Mother Wavelet')
ylabel('Wavelet Energy')
title('Wavelet Energy')
grid on