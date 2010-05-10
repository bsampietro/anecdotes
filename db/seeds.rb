Tag.find_or_create_by_ki 'anything'
Tag.find_or_create_by_ki 'sin'
Tag.find_or_create_by_ki 'life_sucks'
Tag.find_or_create_by_ki 'joke'
Tag.find_or_create_by_ki 'love'
Tag.find_or_create_by_ki 'sex'
Tag.find_or_create_by_ki 'hate'
Tag.find_or_create_by_ki 'work'

if !User.exists?(:nick => 'anonymous')
  u = User.new
  u.id = 1
  u.nick = 'anonymous'
  u.password = 'no_matter'
  u.save(false)
end

