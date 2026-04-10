
# ABOUTME: Main gh completion file that sources all modular completion files
# ABOUTME: Enhanced completion system with dynamic completions and context awareness

# Load core functions
source (dirname (status --current-filename))/gh/_core.fish

# Load base Cobra completion integration
source (dirname (status --current-filename))/gh/_base.fish

# Load enhanced subcommand completions dynamically
for file in (dirname (status --current-filename))/gh/*.fish
    set -l basename (basename $file .fish)
    # Skip core and base files (already loaded above)
    if test "$basename" != "_core" -a "$basename" != "_base"
        source $file
    end
end
