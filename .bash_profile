#set go env
export JAVA_HOME=$(/usr/libexec/java_home)

function node-project {
  git init
  npx license $(npm get init.license) -o "$(npm get init.author.name)" > LICENSE
  npx gitignore node
  npx covgen "$(npm get init.author.email)"
  npm init -y
  git add -A
  git commit -m "Initial commit"
  mkdir node_modules
  cd node_modules
  touch .metadata_never_index
  cd ..
}

function npm_install {
    if [ -f yarn.lock ]; then
        yarn install $@
    else
        npm install $@
    fi
    touch ./node_modules/.metadata_never_index
}
alias i=npm_install

function lolvim() { vim $1 | lolcat; }

function yu() {
    pushd
    cd ~/Downloads/youtube-unwatched 
    python3 `which youtube-dl` $1
    popd
}

function ya() {
    pushd
    cd ~/Downloads
    python3 `which youtube-dl` -f 'bestaudio[ext=m4a]' $1 
    popd
}
function istories(){
    pushd
    cd ~/Downloads/instagram2
    python3 `which instaloader` --login=xronosd :stories --sessionfile /var/folders/lh/1vvkfbc11fnfkl1t_btrvv5w0000gn/t/.instaloader-khranovsky/session-xronosd
    popd
}
function hideDesktopIcons(){
    defaults write com.apple.finder CreateDesktop false
    killall finder
}
function gitpullrecursive(){
    ls | xargs -P10 -I{} git -C {} pull
}
function removeChromeFromOpenWithMenu(){
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
}

switchToHome(){
    git config --global user.email "xronosd@gmail.com"
    git config --global user.name "Denis Khranovskiy"
    git config --global user.signingkey 3311B0F888F44C0F
}
switchToWork(){
    git config --global user.email "dkhranovskiy@itoolabs.com"    
    git config --global user.name "Denis Khranovskiy"
    git config --global user.signingkey 1D73448298F4C253
}

show_root_folder_size(){
     du -hxd 1 /|sort -h|tail
}

runLinter(){
    /usr/local/Cellar/golangci-lint/1.23.8/bin/golangci-lint run
}

export PATH="$PATH:/Users/khranovsky/Applications/development/flutter/bin"
export PYTHONPATH="/usr/local/Cellar/python/3.7.0/bin/python3:$PYTHONPATH"

export PATH="/Users/khranovsky/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/nix/store/d0h5z9fppvapb89rrmkiyk5dddpp5v5g-texlive-combined-2018/bin:$PATH"
#
if [ -e /Users/khranovsky/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/khranovsky/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export GOPRIVATE="code.itoolabs.com/go"

zshimportbashhistory(){
	cat ~/.bash_history | cut -d' ' -f1- | sort | uniq | xargs -I % echo ": $(date +%s):0;" % >> ~/.zsh_history
}

changeShellToZSH(){
	sudo chsh -s $(which zsh) root
}
