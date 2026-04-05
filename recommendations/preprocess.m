function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.
  sums = sum(mat~=0, 2)
  reduced_mat = mat(sums >= min_reviews, :)
end
