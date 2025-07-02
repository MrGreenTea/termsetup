# WezTerm Workspaces Improvements TODO

## Phase 1.2 - Enhanced Workspace Creation

### ✅ Auto-populate Workspace Name (COMPLETED)
- **Current**: User must manually enter workspace name
- **Improvement**: Auto-suggest workspace name based on directory name
- **Implementation**: Extract basename from current directory path and pre-fill the input prompt
- **Example**: `/var/home/jonas/Development/my-project` → suggest "my-project" as default name
- **Status**: ✅ Implemented in commit d8528b2 - `get_basename()` function extracts directory names and pre-fills workspace creation prompt

### Enhanced Project Type Detection
- **Current**: Basic project type detection (nodejs, rust, python, git)
- **Improvement**: Detect project subtypes and package managers
- **Implementation**: 
  - For Node.js projects: detect `pnpm` (pnpm-lock.yaml), `yarn` (yarn.lock), `npm` (package-lock.json)
  - For Python projects: detect `poetry` (pyproject.toml + poetry.lock), `pip` (requirements.txt), `conda` (environment.yml)
  - For Rust projects: detect workspace vs single crate projects
- **Storage**: Add `project_subtype` and `package_manager` fields to workspace JSON

### Save Detection Evidence
- **Current**: Only stores final project type
- **Improvement**: Store the specific files that led to project type detection
- **Implementation**: Add `detection_evidence` array to workspace JSON
- **Example**: 
  ```json
  {
    "project_type": "python",
    "project_subtype": "poetry",
    "detection_evidence": ["pyproject.toml", "poetry.lock"],
    "package_manager": "poetry"
  }
  ```

### Workspace JSON Schema Enhancement
```json
{
  "name": "example-project",
  "project_type": "nodejs",
  "project_subtype": "pnpm",
  "package_manager": "pnpm",
  "detection_evidence": ["package.json", "pnpm-lock.yaml"],
  "root_path": "/path/to/project",
  "created_at": "2025-07-02T10:24:06Z",
  "last_accessed": "2025-07-02T10:24:06Z",
  "layout": {...},
  "environment": {...},
  "metadata": {...}
}
```

## Implementation Priority
1. ✅ **High**: Auto-populate workspace name (user experience improvement) - COMPLETED
2. **Medium**: Enhanced project type detection (better project insights)
3. **Medium**: Save detection evidence (debugging and transparency)

## Phase 2.1 - Enhanced Workspace Listing Display

### Pretty Symbols for Project Types
- **Current**: Text-based project type indicators like `[nodejs]`, `[rust]`, `[python]`
- **Improvement**: Use Unicode symbols/icons for visual project type identification
- **Implementation**: 
  - Map project types to appropriate symbols (e.g., ⚡ for nodejs, 🦀 for rust, 🐍 for python, 📁 for git, ⚙️ for generic)
  - Update InputSelector label formatting to use symbols instead of/alongside text
- **Example**: `⚡ my-app - /path/to/project` instead of `[nodejs] my-app - /path/to/project`

### Prettier Column-Based Display
- **Current**: Single line format with dashes as separators
- **Improvement**: Structured column-based layout for better readability
- **Implementation**: 
  - Use WezTerm's text formatting capabilities to create aligned columns
  - Format as: `SYMBOL  NAME               PATH                    LAST_ACCESSED`
  - Ensure proper padding and alignment for consistent visual appearance
- **Example**:
  ```
  ⚡  my-nodejs-app       ~/Development/web       2 hours ago
  🦀  rust-project        ~/Code/systems          1 day ago  
  🐍  data-analysis       ~/Projects/ml           3 days ago
  ```

### Replace `$HOME` with `~` in Paths
- **Current**: Shows full absolute paths including `/var/home/jonas/`
- **Improvement**: Replace home directory prefix with `~` for cleaner display
- **Implementation**: 
  - Add path formatting function that detects and replaces `$HOME` prefix
  - Apply to both workspace creation and listing displays
  - Maintain full paths in JSON storage for accuracy
- **Example**: `/var/home/jonas/Development/my-app` → `~/Development/my-app`

## Notes
- Maintain backward compatibility with existing workspace JSON files
- Consider adding migration logic for existing workspaces
- Enhanced detection should not slow down workspace creation significantly