function [S f t] = spectrogram(signal, fs, window_size)
  n = length(signal)
  n_win = floor(n / window_size)

  t = (0:n_win-1)' * (window_size / fs)
  f = (0:window_size-1)' * fs / (2 * window_size)
  
  w_han = hanning(window_size)
  for w = 1:n_win
    % Extract the current window segment
    start = (w - 1) * window_size + 1;
    ending = w * window_size;
    windows(:, w) = signal(start:ending) .* w_han;
  endfor

  S = fft(windows, 2 * window_size)(1: window_size, :)
  S = abs(S)
endfunction
