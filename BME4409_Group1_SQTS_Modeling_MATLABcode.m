data = readmatrix("RawData.csv");
i_Na = data(1:8001, 121);
i_Na_L = data(1:8001, 141);
i_Ca_L = data(1:8001, 55);
i_Ca_T = data(1:8001, 82);
i_to_1 = data(1:8001, 170);
i_to_2 = data(1:8001, 189);
i_Kr = data(1:8001, 104);
i_Ks = data(1:8001, 111);
i_K1 = data(1:8001, 96);
i_NaCa = data(1:8001, 154);
i_NaK = data(1:8001, 165);
i_Na_b = data(1:8001, 8);
i_K_b = data(1:8001, 7);
i_Ca_b = data(1:8001, 5);
i_Cl_b = data(1:8001, 6);
i_Ca_p = data(1:8001, 78);
i_K_p = data(1:8001, 101);
Vi = data(1:8001, 209);

Na_o = data(1:8001, 221);
Na_i = data(1:8001, 202);
K_o = data(1:8001, 219);
K_i = data(1:8001, 200);
Ca_o = data(1:8001, 213);
Ca_i = data(1:8001, 11);
Cl_o = data(1:8001, 214);
Cl_i = data(1:8001, 198);
r_NaK = data(1:8001, 53);
g_Na = data(1:8001, 120);

R = 8.314; %J/molK
T = 310; %K
F = 96500; %C/mol

i_stim = data(1:8001, 204);
time = data(1:8001, 1);
m = 0.0145766758;
h = 0.02979720207;
j = 0.0692509548;

i_tot = (i_Na)+i_Na_L+i_Ca_L+i_Ca_T+i_to_1+i_to_2+(1.8*i_Kr)+i_Ks+i_K1+i_NaCa+i_NaK+i_Na_b+i_K_b+i_Ca_b+i_Cl_b+i_Ca_p+i_K_p;

Cm = 1; %uF/cm^2

V = zeros(1, 8001);
Verr = zeros(1, 8001);
V(1) = Vi(1);
dt = 0.1;
for i = 1:1:8000
    Vdiff = ((-1*(i_stim(i)+i_tot(i)))/Cm)*dt;
    V(i+1) = V(i)+Vdiff;
    Verr(i) = V(i) - Vi(i);
end

figure(1)
subplot(2, 1, 1)
plot(time, Vi)
title('Membrane Potential Variation Due To Ionic Currents')
xlabel('time (ms)')
clear ylabel
ylabel('Membrane Potential (mV)')
subplot(2, 1, 2)
plot(time,V)
title('Mutated Membrane Potential Variation Due To Ionic Currents')
xlabel('time (ms)')
clear ylabel
ylabel('Membrane Potential (mV)')

