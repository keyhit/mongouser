counter = 0

20.times do
  new_user = User.new(
    first_name: 'Viacheslav',
    last_name: 'Karpenko',
    birthday: '1984-02-11',
    address: 'Cherkassy city'
  )

  if new_user.save
    puts "New user with id #{new_user.id} was saved!".green
    counter += 1

    if counter < 2
      user = 'user'
    elsif counter >= 1
      user = 'users'
    end

    puts "Added #{counter} #{user}".yellow
  else
    puts 'New user was not saved!'.red
  end
end
