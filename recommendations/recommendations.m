function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  A = read_mat(path)
  A = preprocess(A, min_reviews)
  [U S V] = svds(A, num_features)
  liked_theme_vector = V(liked_theme, :)
  
  % compute similarities vector
  for i = 1:size(V, 1)
    cosine_sim(i) = cosine_similarity(liked_theme_vector, V(i, :))
  endfor
  
  [sorted_cosine_sim positions] = sort(cosine_sim, 'descend')
  recoms = positions(2:num_recoms+1)
end
