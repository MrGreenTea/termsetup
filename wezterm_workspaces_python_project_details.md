# Python Project Detection Specifications

## Overview
Enhanced detection logic for Python projects in WezTerm workspaces, identifying specific package managers and project configurations.

## Base Requirements
- **Primary Indicators**: Python-specific configuration files
- **Detection Priority**: Check in order of specificity (poetry → uv → pip)
- **No Fallback**: Only detect projects with explicit configuration files

## Detection Logic

### 1. Poetry Projects
**Files to Check**: `pyproject.toml` + `poetry.lock`
**Detection Result**:
```json
{
  "project_type": "python",
  "project_subtype": "poetry",
  "package_manager": "poetry", 
  "detection_evidence": ["pyproject.toml", "poetry.lock"]
}
```

**Directory Example**:
```
ml-poetry-project/
├── pyproject.toml
├── poetry.lock
├── README.md
├── src/
│   └── mypackage/
│       └── __init__.py
└── tests/
```

### 2. UV Projects
**Files to Check**: `uv.lock` OR `pyproject.toml` with uv configuration
**Detection Result**:
```json
{
  "project_type": "python", 
  "project_subtype": "uv",
  "package_manager": "uv",
  "detection_evidence": ["uv.lock"]
}
```

**Directory Example**:
```
fast-python-project/
├── uv.lock
├── pyproject.toml
├── src/
│   └── mypackage/
│       └── __init__.py
└── tests/
```

### 3. Pip Projects  
**Files to Check**: `requirements.txt`
**Detection Result**:
```json
{
  "project_type": "python",
  "project_subtype": "pip", 
  "package_manager": "pip",
  "detection_evidence": ["requirements.txt"]
}
```

**Directory Example**:
```
django-pip-app/
├── requirements.txt
├── manage.py
├── myapp/
│   ├── __init__.py
│   └── models.py
└── static/
```


## Detection Algorithm

```lua
local function detect_python_details(path)
    local evidence = {}
    local package_manager = null
    local subtype = null
    
    -- Check for Poetry (highest priority)
    if file_exists(path .. "/pyproject.toml") and file_exists(path .. "/poetry.lock") then
        package_manager = "poetry"
        subtype = "poetry"
        table.insert(evidence, "pyproject.toml")
        table.insert(evidence, "poetry.lock")
        
    -- Check for UV
    elseif file_exists(path .. "/uv.lock") then
        package_manager = "uv"
        subtype = "uv"
        table.insert(evidence, "uv.lock")
        
    -- Check for Pip requirements
    elseif file_exists(path .. "/requirements.txt") then
        package_manager = "pip" 
        subtype = "pip"
        table.insert(evidence, "requirements.txt")
        
    else
        return nil  -- Not a Python project
    end
    
    return {
        project_type = "python",
        project_subtype = subtype,
        package_manager = package_manager,
        detection_evidence = evidence
    }
end
```

## Advanced Detection Cases

### Poetry with pyproject.toml only
**Files**: `pyproject.toml` (no poetry.lock)
**Result**: 
```json
{
  "project_type": "python",
  "project_subtype": "poetry",
  "package_manager": "poetry", 
  "detection_evidence": ["pyproject.toml"]
}
```

### Multiple Requirements Files
**Files**: `requirements.txt`, `requirements-dev.txt`, `requirements-test.txt`
**Result**:
```json
{
  "project_type": "python",
  "project_subtype": "pip",
  "package_manager": "pip",
  "detection_evidence": ["requirements.txt", "requirements-dev.txt", "requirements-test.txt"]
}
```

### Mixed Project Types
If multiple configuration types exist:
- **Priority**: poetry > uv > pip
- **Evidence**: Include all found configuration files
- **Package Manager**: Use highest priority found

**Example**:
```
mixed-python-project/
├── pyproject.toml
├── poetry.lock
├── requirements.txt      # Also has pip requirements
└── src/
```
**Result**: Detects as `poetry` project, evidence includes both files.

## Common Python Project Patterns

### Django Project
```
django-project/
├── requirements.txt
├── manage.py
├── myproject/
│   ├── settings.py
│   └── urls.py
├── apps/
└── static/
```
**Detected as**: `pip` Python project

### FastAPI Project  
```
fastapi-app/
├── pyproject.toml
├── poetry.lock
├── main.py
├── routers/
└── models/
```
**Detected as**: `poetry` Python project

### UV Project
```
fast-dev-project/
├── uv.lock
├── pyproject.toml
├── src/
│   └── mypackage/
│       ├── __init__.py
│       └── core.py
├── tests/
└── README.md
```
**Detected as**: `uv` Python project

### Package Development
```
my-python-package/
├── pyproject.toml
├── poetry.lock
├── src/
│   └── mypackage/
│       ├── __init__.py
│       └── core.py
├── tests/
└── docs/
```
**Detected as**: `poetry` Python project

## Edge Cases

### Virtual Environments
Virtual environment directories should be ignored:
- `venv/`, `.venv/`, `env/`
- `__pycache__/`, `*.pyc` files
- Focus on configuration files, not runtime artifacts

### Jupyter Notebooks Only
```
notebook-project/
├── analysis.ipynb
├── data-exploration.ipynb
└── results/
```
**Result**: Will not detect as Python project (no configuration files)

### Python Scripts in Subdirectories
```
scripts-project/
├── tools/
│   ├── deploy.py
│   └── backup.py
├── utils/
│   └── helpers.py
└── README.md
```
**Result**: Will not detect as Python project (no configuration files)

## Testing Scenarios

### Required Test Cases
1. **Poetry Project**: pyproject.toml + poetry.lock
2. **Poetry Project (no lock)**: pyproject.toml only
3. **UV Project**: uv.lock
4. **UV Project with pyproject**: uv.lock + pyproject.toml
5. **Pip Project**: requirements.txt
6. **Multiple Requirements**: requirements.txt + requirements-dev.txt
7. **Mixed Configuration**: Multiple config types present
8. **No Python Files**: Directory with no Python content
9. **Virtual Environment**: Project with venv/ directory
10. **Scripts Only**: .py files without config files (should not detect)

### Performance Considerations
- **File System Calls**: Minimize file system operations
- **Error Handling**: Handle permission errors gracefully
- **Early Exit**: Return as soon as definitive match found

## Additional Configuration Files

### Future Enhancement Considerations
Other Python configuration files that could be detected in the future:
- `pyproject.toml` without poetry/uv (PEP 518)
- `Makefile` with Python targets
- `.python-version` (pyenv version specification)