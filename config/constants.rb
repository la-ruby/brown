{
  'DEVELOPER_EMAIL' => 'developer@example.com',
  'DEVELOPER_PASSWORD' => 'testing',
  'FIRST_USER_EMAIL' => 'user@example.com',
  'FIRST_USER_PASSWORD' => 'testing',
  'NAME_SHORT' => 'TESTING',
  'NAME' => 'Testing',
  'NAME_NORMAL' => 'Testing',
  'NAME_PARENTHESIS' => '(T)esting',
  'BUCKET_HOST' => 'http://localhost:2990/brown-bucket'
}.each do |k,v|
  # If a value is provideed in ENV, use that,
  # fall back to whatever the hash value provides
  Object.const_set(
    k,
    ENV[k] || v)
end
