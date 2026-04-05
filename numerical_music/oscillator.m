function x = oscillator(freq, fs, dur, A, D, S, R)
  t = (0 : 1 / fs : dur)'
  sine_wave = sin(2 * pi * freq * t)

  % number of samples for each element of the new envelope
  nr_as = floor(A * fs)
  nr_ds = floor(D * fs)
  nr_rs = floor(R * fs)
  nr_ss = length(t) - nr_as - nr_ds - nr_rs

  % new envelope
  A_e = linspace(0, 1, nr_as)'
  D_e = linspace(1, S, nr_ds)'
  S_e = S * ones(nr_ss, 1)
  R_e = linspace(S, 0, nr_rs)'
  E = [A_e; D_e; S_e; R_e]

  x = sine_wave .* E
  % the last element is not needed
  x(length(x)) = []
endfunction
