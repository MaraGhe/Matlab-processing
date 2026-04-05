function signal = low_pass(signal, fs, cutoff_freq)
  L = length(signal)
  Fou = fft(signal)
  Freq = (0: L - 1) * fs / L
  
  mask = Freq < cutoff_freq
  Fou_mask = Fou .* mask'
  new_signal = ifft(Fou_mask)
  signal = new_signal / max(abs(new_signal))
endfunction

