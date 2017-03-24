Configuration
========

Remote repository for my configuration files

Additional files are symlinked to their corresponding dot file in ~/


### Practical guide to which files get sourced when
From (https://github.com/rbenv/rbenv/wiki/Unix-shell-initialization)


* Opening a new Terminal window/tab:
  * **bash**
     * OS X: `.bash_profile` or `.profile` (1st found)
     * Linux: `.profile` (Ubuntu, once per desktop login session) + `.bashrc`
  * **zsh**
     * OS X: `.zshenv` + `.zprofile` + `.zshrc`
     * Linux: `.profile` (Ubuntu, once per desktop login session) + `.zshenv` + `.zshrc`
* Logging into a system via SSH:
  * **bash**: `.bash_profile` or `.profile` (1st found)
  * **zsh**: `.zshenv` + `.zprofile` + `.zshrc`
* Executing a command remotely with `ssh` or Capistrano:
  * **bash**: source file in `$BASH_ENV`
  * **zsh**: `.zshenv`
* Remote git hook triggered by push over SSH:
  * *no init files* get sourced, since hooks are running [within a restricted shell](http://git-scm.com/docs/git-shell)
  * PATH will be roughly: `/usr/libexec/git-core:/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin`


### zsh
