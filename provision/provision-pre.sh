# Rubygems update

if [ $(gem -v|grep '^2.') ]; then

	echo "gem installed"

else

	apt-get install -y ruby-dev

	echo "ruby-dev installed"

	echo "gem not installed"

	gem install rubygems-update

	update_rubygems

fi

# use ruby 2.0.0 for photocopier
bash -l -c "rvm --default use 2.0.0"

# we can do whatever we want because Vagrant
sudo chmod -R 777 /usr/local/rvm/gems

# wordmove install
wordmove_install="$(gem list wordmove -i)"

if [ "$wordmove_install" = true ]; then

	echo "wordmove installed"

else

	echo "wordmove not installed"

	gem install wordmove

	wordmove_path="$(gem which wordmove | sed -s 's/.rb/\/deployer\/base.rb/')"

	if [ "$(grep yaml $wordmove_path)" ]; then

		echo "can require yaml"

	else

		echo "can't require yaml"

		echo "set require yaml"

		sed -i "7i require\ \'yaml\'" $wordmove_path

		echo "can require yaml"

	fi
fi

# photocopier install
# once 1.0.0 is released this will be unnecessary

echo "Fix photocopier"

gem uninstall photocopier

gem install specific_install

gem specific_install -l	https://github.com/welaika/photocopier.git

# how to specify which gem to use?
# wordmove will install the dependent one, 0.1.0
# so even gem uninstall can't work programmatically