first_name = %w[viacheslav Sergey Oleg Illia Olaksandr 
                John Wiliam Kruso Goliaf Igor Vlad Ruslan 
                Oleksiy Roman Kyryl viacheslav Sergey Oleg 
                Illia Olaksandr John Wiliam Kruso Goliaf 
                Igor Vlad Ruslan Kyryl]

last_name = %w[karpenko Olefir Vinnik Sotnik Bohdan Sothik
               Glushenko karpenko Olefir Vinnik Sotnik Bohdan
               Sothik Glushenko karpenko Olefir Vinnik Sotnik
               Bohdan Sothik Glushenko karpenko Olefir Vinnik
               Sotnik Bohdan Sothik Glushenko]

birthday = %w[02.11.1984 11.02.1984 02.11.1984 02.11.1984 02.11.1984
              02.11.1984 02.11.1984 02.11.1984 02.11.1984 02.11.1984
              02.11.1984 02.11.1984 02.11.1984 02.11.1984 02.11.1984
              02.11.1984 11.12.2005 11.12.2005 11.12.2005 11.12.2005
              11.12.2005 07.18.2018 07.18.2018 07.18.2018 07.18.2018 
              07.18.2018 07.18.2018 07.18.2018 02.11.1984]

address = %w[Kyiv Kyiv Kyiv Cherkassy Cherkassy Cherkassy Cherkassy
             Cherkassy NY Cherkassy Kyiv Cherkassy Paris NY Vinnitsia
             Kyiv London Paris NY Vinnitsia Kyiv London Paris NY
             Vinnitsia Kyiv Cherkassy Cherkassy]

counter = 0
28.times do
  new_user = User.new(
    first_name: first_name[counter],
    last_name: last_name[counter],
    birthday:  birthday[counter],
    address: address[counter]
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
