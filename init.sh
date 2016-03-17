#!/usr/bin/env bash

read -p "Is this \"Earth\" or \"Jupiter\"? or \"Mars\"? " COMPUTER_NAME
case $COMPUTER_NAME in
    Earth ) printf '\033[0;34m%s\033[0m\n' "Installing dotfiles on Earth...";;
    Jupiter ) printf '\033[0;34m%s\033[0m\n' "Installing dotfiles on Jupiter...";;
    Mars ) printf '\033[0;34m%s\033[0m\n' "Installing dotfiles on Mars...";;
    * ) echo "Please answer with \"Jupiter\" or \"Mars\"."; exit 0;;
esac

gitfiles() {

    gitfiles=(gitconfig gitignore)

    for i in "${gitfiles[@]}"
    do
        echo "\033[0;34mLooking for an existing $i config...\033[0m"
        if [ -f ~/.$i ] || [ -h ~/.$i ]
            then
            echo "\033[0;33mFound ~/.$i.\033[0m \033[0;32mBacking up to ~/.$i.old\033[0m";
            mv ~/.$i ~/.$i.old;
        fi

        echo "\033[0;34mUsing the $i template file and adding it to ~/.$i\033[0m"
        cp ~/.dotfiles/templates/$i.template ~/.$i
    done
}

hosts() {
    if grep -q "# Homestead Sites" "/etc/hosts";
    then
        printf '\033[0;34m%s\033[0m\n' "Hosts already configured."
    else
        printf '\033[0;34m%s\033[0m\n' "Configuring Hosts..."
        sudo bash -c "echo '# Homestead Sites' >> /etc/hosts"
        sudo bash -c "echo 192.168.10.10    motivational.app >> /etc/hosts"
        sudo bash -c "echo 192.168.10.10    newsoonersurvey.app >> /etc/hosts"
        sudo bash -c "echo '# Docker Machine Sites' >> /etc/hosts"
        sudo bash -c "echo 192.168.99.100   classnav.dev evaluate.dev iadvise.dev >> /etc/hosts"
    fi
}

ohmyzsh() {
    printf '\033[0;34m%s\033[0m\n' "Installing oh-my-zsh..."
    curl -L https://raw.github.com/abiggs/oh-my-zsh/master/tools/install.sh | sh
}

changeshell() {
    printf '\033[0;34m%s\033[0m\n' "Changing shell..."
    if [ `grep /usr/local/bin/zsh /etc/shells` ];
    then
        echo /usr/local/bin/zsh | chsh -s /usr/local/bin/zsh;
    else
        echo /usr/local/bin/zsh | sudo tee -a /etc/shells;
        chsh -s /usr/local/bin/zsh;
    fi
}

composer() {
    printf '\033[0;34m%s\033[0m\n' "Installing Composer..."
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer
}

laravel() {
    printf '\033[0;34m%s\033[0m\n' "Installing Larvel..."
    composer global require "laravel/installer=~1.1"
    composer global require "laravel/homestead=~2.0"
}

sublimetext() {
    ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
}

# Install Homebrew.
source ~/.dotfiles/homebrew.sh
source ~/.dotfiles/ruby.sh
source ~/.dotfiles/node.sh
source ~/.dotfiles/ssh.sh

gitfiles
hosts
ohmyzsh
composer
laravel
sublimetext
changeshell

source ~/.dotfiles/osx.sh

printf '\033[0;34m%s\033[0m\n' "Dotfiles installed."
