package{["bash", "curl", "git", "libxslt", "gcc-c++", "patch", "readline", "readline-devel", "zlib", "zlib-devel", "libyaml-devel", "libffi-devel", "openssl-devel", "make", "bzip2", "iconv-devel"]:
	ensure =>installed,
}

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

  
  If you wish to use RVM in an interactive fashion in your shells then
  Place the following line at the end of your shell's loading files
  (.bashrc or .bash_profile for bash and .zshrc for zsh),
  after all PATH/variable settings:

  [[ -s "/home/user/.rvm/scripts/rvm" ]] && source "/home/user/.rvm/scripts/rvm"  # This loads RVM into a shell session.

  You only need to add this line the first time you install RVM.

  If you are choosing to source RVM into your environment to switch current
  shell environments, be sure to close this shell and open a new one so that
  the RVM functions load.

