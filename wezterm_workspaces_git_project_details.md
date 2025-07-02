# Git Project Detection Specifications

## Overview
Enhanced detection logic for Git repository projects in WezTerm workspaces. This serves as a broader catch-all for repositories that don't match more specific language patterns.

## Base Requirements
- **Primary Indicator**: `.git` directory must exist
- **Scope**: Catch repositories not classified as nodejs, python, or rust projects
- **Priority**: Lower priority than language-specific detection (runs after other detectors)

## Detection Logic

### 1. Git Repository Projects
**Files to Check**: `.git` directory
**Detection Result**:
```json
{
  "project_type": "git",
  "project_subtype": "repository", 
  "package_manager": null,
  "detection_evidence": [".git"]
}
```

**Directory Examples**:

#### Documentation Repository
```
awesome-docs/
├── .git/
├── README.md
├── docs/
│   ├── installation.md
│   ├── usage.md
│   └── api/
├── images/
└── scripts/
    └── deploy.sh
```

#### Configuration Repository
```
dotfiles/
├── .git/
├── .gitignore
├── install.sh
├── configs/
│   ├── .vimrc
│   ├── .bashrc
│   └── .tmux.conf
└── scripts/
```

#### Mixed Language Repository
```
polyglot-project/
├── .git/
├── README.md
├── frontend/           # JavaScript (no package.json at root)
│   ├── package.json
│   └── src/
├── backend/            # Python (no requirements.txt at root)  
│   ├── requirements.txt
│   └── app.py
└── mobile/             # Swift/Kotlin
    └── src/
```

#### Static Website
```
static-site/
├── .git/
├── index.html
├── css/
│   └── style.css
├── js/
│   └── script.js
├── images/
└── _config.yml         # Jekyll or similar
```

## Detection Algorithm

```lua
local function detect_git_details(path)
    local evidence = {}
    
    -- Check for .git directory (required)
    if not directory_exists(path .. "/.git") then
        return nil  -- Not a Git repository
    end
    table.insert(evidence, ".git")
    
    return {
        project_type = "git",
        project_subtype = "repository",
        package_manager = null,
        detection_evidence = evidence
    }
end
```

## Detection Context

### When Git Detection Applies
Git detection serves as a fallback for repositories that:
1. **Don't match language patterns**: No package.json, Cargo.toml, requirements.txt, etc. at root
2. **Are documentation/config repos**: Primarily contain documentation, configs, or scripts
3. **Have nested language projects**: Language-specific files exist in subdirectories only
4. **Are polyglot projects**: Multiple languages without clear root language
5. **Are non-programming repositories**: Assets, documentation, configuration files

### When Git Detection Doesn't Apply
Git detection is skipped if higher-priority detectors match:
- **Node.js**: `package.json` found at root → classified as nodejs project
- **Python**: Python config files found at root → classified as python project  
- **Rust**: `Cargo.toml` found at root → classified as rust project

## Enhanced Detection (Future)

### Potential Subtype Detection
Future enhancements could detect specific repository types:

#### Documentation Repositories
```json
{
  "project_type": "git",
  "project_subtype": "documentation",
  "package_manager": null,
  "detection_evidence": [".git", "docs/", "README.md"]
}
```
**Indicators**: `docs/` directory, multiple `.md` files, `mkdocs.yml`, `_config.yml`

#### Configuration Repositories  
```json
{
  "project_type": "git", 
  "project_subtype": "dotfiles",
  "package_manager": null,
  "detection_evidence": [".git", "install.sh", ".vimrc"]
}
```
**Indicators**: `install.sh`, dotfiles (`.vimrc`, `.bashrc`), `configs/` directory

#### Static Website Repositories
```json
{
  "project_type": "git",
  "project_subtype": "website", 
  "package_manager": null,
  "detection_evidence": [".git", "index.html", "_config.yml"]
}
```
**Indicators**: `index.html`, `_config.yml`, `gatsby-config.js`, `hugo.toml`

#### Infrastructure Repositories
```json
{
  "project_type": "git",
  "project_subtype": "infrastructure",
  "package_manager": null, 
  "detection_evidence": [".git", "terraform/", "docker-compose.yml"]
}
```
**Indicators**: `Dockerfile`, `docker-compose.yml`, `terraform/`, `k8s/`, `.gitlab-ci.yml`

## Common Git Project Patterns

### Documentation Site
```
project-docs/
├── .git/
├── mkdocs.yml
├── docs/
│   ├── index.md
│   ├── getting-started.md
│   └── api/
│       └── reference.md
└── site/               # Generated output
```
**Current**: `git/repository`
**Future**: `git/documentation`

### Personal Dotfiles
```
my-dotfiles/
├── .git/
├── install.sh
├── .bashrc
├── .vimrc
├── .tmux.conf
├── configs/
│   └── wezterm/
└── scripts/
```
**Current**: `git/repository`
**Future**: `git/dotfiles`

### Jekyll Blog
```
my-blog/
├── .git/
├── _config.yml
├── _posts/
│   ├── 2023-01-01-hello-world.md
│   └── 2023-02-15-tech-post.md
├── _layouts/
├── assets/
└── _site/              # Generated output
```
**Current**: `git/repository`
**Future**: `git/website`

### Infrastructure as Code
```
k8s-configs/
├── .git/
├── docker-compose.yml
├── terraform/
│   ├── main.tf
│   └── variables.tf
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
└── scripts/
    └── deploy.sh
```
**Current**: `git/repository` 
**Future**: `git/infrastructure`

## Edge Cases

### Submodules
Repository with Git submodules:
```
parent-repo/
├── .git/
├── submodule-a/        # Git submodule
│   └── .git            # File pointing to parent .git
└── submodule-b/        # Git submodule
    └── .git
```
**Detection**: Parent repo detected as `git/repository`
**Submodules**: Not separately detected (would need special handling)

### Bare Repositories
Bare Git repositories (`.git` directory is the root):
```
bare-repo.git/
├── HEAD
├── config
├── objects/
└── refs/
```
**Detection**: May not detect correctly (no `.git` subdirectory)
**Handling**: Could check for bare repo indicators

### Nested Repositories
Repository containing other language projects:
```
monorepo/
├── .git/               # Root git repo
├── frontend/
│   ├── package.json    # Node.js project
│   └── src/
├── backend/
│   ├── Cargo.toml      # Rust project
│   └── src/
└── docs/
    └── README.md
```
**Current Behavior**: Detects as `git/repository` (language files not at root)
**Future Enhancement**: Could detect nested project types

## Testing Scenarios

### Required Test Cases
1. **Basic Git Repo**: `.git` directory with mixed files
2. **Documentation Repo**: `.git` + lots of `.md` files
3. **Dotfiles Repo**: `.git` + config files like `.vimrc`, `.bashrc`
4. **Static Site**: `.git` + `index.html` + web assets
5. **Infrastructure Repo**: `.git` + `docker-compose.yml`, terraform files
6. **Empty Git Repo**: `.git` directory with no other content
7. **Nested Language Projects**: Git repo with subdirectory language projects
8. **Not a Git Repo**: Directory without `.git` directory
9. **Bare Git Repo**: Bare repository structure
10. **Git Submodules**: Repository with submodules

### Performance Considerations
- **Directory Check**: Quick check for `.git` directory existence
- **No Content Reading**: Git detection doesn't need to read file contents
- **Early Success**: Return immediately when `.git` found
- **Error Handling**: Handle permission errors on `.git` directory

### Detection Order Integration
```lua
-- Detection runs in this order:
local detectors = {
    detect_nodejs_details,    -- Highest priority
    detect_python_details,
    detect_rust_details,
    detect_git_details,       -- Lower priority (broader)
    detect_generic_details    -- Fallback
}
```

## Integration Benefits

### Workspace Organization
Git detection helps organize repositories by type:
- **Language Projects**: Specific tooling and commands
- **Git Repositories**: General git operations, documentation browsing
- **Infrastructure**: Deployment and configuration management

### Future Command Integration
Git project type could enable specific commands:
- `git status`, `git pull`, `git push`
- Repository browsing and navigation
- Branch switching and management
- Integration with GitHub/GitLab APIs