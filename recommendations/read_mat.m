function mat = read_mat(path)
  # Parse the .csv file and return the matrix of values (without row and column headers).
  f = fopen(path, 'r')
  mat = dlmread(f, ',', 1, 1);
  fclose(f)
end
