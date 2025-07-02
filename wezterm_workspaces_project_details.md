# WezTerm Workspaces: Enhanced Project Type Detection Implementation Plan

## Overview
This document outlines the implementation plan for enhanced project type detection in WezTerm workspaces, adding support for project subtypes, package manager detection, and evidence tracking.

## Current State
The existing system in `configs/wezterm/workspaces.lua` provides basic project type detection for:
- `nodejs` (detects package.json)
- `rust` (detects Cargo.toml)
- `python` (detects requirements.txt, pyproject.toml, setup.py, poetry.lock)
- `git` (detects .git directory)
- `generic` (fallback)

## Enhanced Detection Goals

### 1. Project Subtypes
Detect specific project configurations within each language:
- **Node.js**: pnpm, yarn, npm, basic
- **Python**: poetry, conda, pip, setuptools
- **Rust**: workspace, binary, library
- **Git**: repository
- **Generic**: (no subtype)

### 2. Package Manager Detection
Identify the primary package manager for each project:
- **Node.js**: pnpm, yarn, npm
- **Python**: poetry, conda, pip
- **Rust**: cargo
- **Git**: null
- **Generic**: null

### 3. Detection Evidence
Store an array of files that led to the detection decision for transparency and debugging.

## Enhanced JSON Schema

```json
{
  "name": "project-name",
  "project_type": "nodejs|python|rust|git|generic",
  "project_subtype": "pnpm|yarn|npm|basic|poetry|conda|pip|setuptools|workspace|binary|library|repository|null",
  "package_manager": "pnpm|yarn|npm|poetry|conda|pip|cargo|null",
  "detection_evidence": ["package.json", "pnpm-lock.yaml"],
  "root_path": "/path/to/project",
  "created_at": "2025-07-02T10:24:06Z",
  "last_accessed": "2025-07-02T10:24:06Z",
  "socket_path": "",
  "layout": {...},
  "environment": {...},
  "metadata": {...}
}
```

## Implementation Strategy

### Phase 1: Core Detection Logic
1. Replace `detect_project_type()` with `detect_project_details()`
2. Implement enhanced detection for each project type
3. Return structured detection results

### Phase 2: Schema Enhancement
1. Update `create_workspace()` function signature
2. Modify workspace creation workflow
3. Ensure backward compatibility

### Phase 3: Integration
1. Update workspace listing to handle new fields
2. Add migration logic for existing workspaces
3. Comprehensive testing

## Detection Priority Order
1. **Node.js** - Most specific language detection
2. **Python** - Language-specific detection  
3. **Rust** - Language-specific detection
4. **Git** - Broader repository detection
5. **Generic** - Fallback for unknown types

## Implementation Files

### Core Implementation
- `configs/wezterm/workspaces.lua` - Main implementation

### Documentation
- `wezterm_workspaces_nodejs_project_details.md` - Node.js detection specifications
- `wezterm_workspaces_python_project_details.md` - Python detection specifications  
- `wezterm_workspaces_rust_project_details.md` - Rust detection specifications
- `wezterm_workspaces_git_project_details.md` - Git detection specifications
- `wezterm_workspaces_generic_project_details.md` - Generic detection specifications

## Success Criteria
1. **Backward Compatibility**: Existing workspaces continue to work
2. **Enhanced Detection**: New workspaces have detailed type information
3. **Evidence Tracking**: All detections store the files that led to the decision
4. **Performance**: Detection doesn't significantly slow workspace creation
5. **Error Handling**: Graceful fallbacks for detection failures

## Testing Strategy
1. Create test directories for each project type and subtype
2. Verify detection accuracy for all combinations
3. Test backward compatibility with existing workspace JSON files
4. Validate migration logic for existing workspaces
5. Performance testing with large directory structures

## Benefits
- **Better Project Understanding**: Users see exactly what tools their projects use
- **Debugging Aid**: Evidence arrays help troubleshoot detection issues
- **Future Enhancement Foundation**: Rich data supports upcoming display improvements
- **Tool Integration**: Package manager info enables smarter workspace templates