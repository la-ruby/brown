{
  'BROWN_DEVELOPER_EMAIL' => 'developer@example.com',
  'BROWN_DEVELOPER_PASSWORD' => 'testing',
  'BROWN_FIRST_USER_EMAIL' => 'user@example.com',
  'BROWN_FIRST_USER_PASSWORD' => 'testing',
  'BROWN_NAME_SHORT' => 'TESTING',
  'BROWN_NAME' => 'Testing',
  'BROWN_NAME_NORMAL' => 'Testing',
  'BROWN_NAME_PARENTHESIS' => '(T)esting',
  'BROWN_BUCKET_HOST' => 'http://localhost:2990/brown-bucket'
}.each do |k,v|
  # If a value is provideed in ENV, use that,
  # fall back to whatever the hash value provides
  Object.const_set(
    k,
    ENV[k] || v)
end
