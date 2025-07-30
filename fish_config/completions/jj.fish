# ABOUTME: Main jj completion file that sources all modular completion files
# ABOUTME: Auto-generated from jj util completion fish

# Load core functions
source (dirname (status --current-filename))/jj/_core.fish

# Load global completions
source (dirname (status --current-filename))/jj/_global.fish

# Load subcommand completions dynamically
for file in (dirname (status --current-filename))/jj/*.fish
    set -l basename (basename $file .fish)
    # Skip core and global files (already loaded above)
    if test "$basename" != "_core" -a "$basename" != "_global"
        source $file
    end
end
