function __git_branches 
  git branch $argv --list --sort=-committerdate --sort=-HEAD --format="%(HEAD) %(color:yellow)%(refname:short) %(color:green)(%(committerdate:relative))"\t"%(color:blue)%(subject)%(color:reset)" --color=always |
  column -ts\t 
end
