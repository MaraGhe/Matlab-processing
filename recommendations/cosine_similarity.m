function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  similarity = sum(A .* B) / (norm(A) * norm(B))
end
