# Node.js Project Detection Specifications

## Overview
Enhanced detection logic for Node.js projects in WezTerm workspaces, identifying specific package managers and project configurations.

## Base Requirements
- **Primary Indicator**: `package.json` file must exist
- **Secondary Indicators**: Package manager lock files
- **Detection Priority**: Check in order of specificity (pnpm → yarn → npm → basic)

## Detection Logic

### 1. PNPM Projects
**Files to Check**: `package.json` + `pnpm-lock.yaml`
**Detection Result**:
```json
{
  "project_type": "nodejs",
  "project_subtype": "pnpm", 
  "package_manager": "pnpm",
  "detection_evidence": ["package.json", "pnpm-lock.yaml"]
}
```

**Directory Example**:
```
my-pnpm-app/
├── package.json
├── pnpm-lock.yaml
├── node_modules/
└── src/
    └── index.js
```

### 2. Yarn Projects  
**Files to Check**: `package.json` + `yarn.lock`
**Detection Result**:
```json
{
  "project_type": "nodejs",
  "project_subtype": "yarn",
  "package_manager": "yarn", 
  "detection_evidence": ["package.json", "yarn.lock"]
}
```

**Directory Example**:
```
react-yarn-app/
├── package.json
├── yarn.lock
├── public/
└── src/
    └── App.js
```

### 3. NPM Projects
**Files to Check**: `package.json` + `package-lock.json`
**Detection Result**:
```json
{
  "project_type": "nodejs",
  "project_subtype": "npm",
  "package_manager": "npm",
  "detection_evidence": ["package.json", "package-lock.json"]
}
```

**Directory Example**:
```
express-npm-api/
├── package.json
├── package-lock.json
├── node_modules/
└── server.js
```

### 4. Basic Node.js Projects
**Files to Check**: `package.json` only (no lock files)
**Detection Result**:
```json
{
  "project_type": "nodejs", 
  "project_subtype": "basic",
  "package_manager": "npm",
  "detection_evidence": ["package.json"]
}
```

**Directory Example**:
```
simple-node-script/
├── package.json
└── index.js
```

## Detection Algorithm

```lua
local function detect_nodejs_details(path)
    local evidence = {}
    local package_manager = "npm"  -- default
    local subtype = "basic"       -- default
    
    -- Check for package.json (required)
    if not file_exists(path .. "/package.json") then
        return nil  -- Not a Node.js project
    end
    table.insert(evidence, "package.json")
    
    -- Check for specific package managers (in priority order)
    if file_exists(path .. "/pnpm-lock.yaml") then
        package_manager = "pnpm"
        subtype = "pnpm"
        table.insert(evidence, "pnpm-lock.yaml")
    elseif file_exists(path .. "/yarn.lock") then
        package_manager = "yarn"
        subtype = "yarn" 
        table.insert(evidence, "yarn.lock")
    elseif file_exists(path .. "/package-lock.json") then
        package_manager = "npm"
        subtype = "npm"
        table.insert(evidence, "package-lock.json")
    end
    
    return {
        project_type = "nodejs",
        project_subtype = subtype,
        package_manager = package_manager,
        detection_evidence = evidence
    }
end
```

## Edge Cases

### Multiple Lock Files
If multiple lock files exist (rare but possible):
- **Priority**: pnpm > yarn > npm
- **Evidence**: Include all found lock files
- **Package Manager**: Use highest priority found

**Example**:
```
confused-project/
├── package.json
├── yarn.lock
└── package-lock.json
```
**Result**: Detects as `yarn` project, evidence includes both lock files.

### Node Modules Without Lock Files
If `node_modules/` exists but no lock files:
- **Subtype**: `basic`
- **Package Manager**: `npm` (default assumption)
- **Evidence**: `["package.json", "node_modules"]`

### Monorepos
For Node.js monorepos with workspace configuration:
- **Detection**: Same as regular Node.js project
- **Future Enhancement**: Could detect workspace structure in package.json

## Common Project Patterns

### Create React App
```
cra-project/
├── package.json
├── package-lock.json    # npm by default
├── public/
├── src/
└── build/
```
**Detected as**: `npm` Node.js project

### Next.js
```
nextjs-app/
├── package.json
├── yarn.lock           # Often uses yarn
├── pages/
├── public/
└── .next/
```
**Detected as**: `yarn` Node.js project

### Vue CLI
```
vue-project/
├── package.json  
├── package-lock.json   # npm by default
├── src/
├── public/
└── dist/
```
**Detected as**: `npm` Node.js project

## Testing Scenarios

### Required Test Cases
1. **PNPM Project**: package.json + pnpm-lock.yaml
2. **Yarn Project**: package.json + yarn.lock  
3. **NPM Project**: package.json + package-lock.json
4. **Basic Project**: package.json only
5. **Mixed Lock Files**: Multiple lock files present
6. **With node_modules**: node_modules present without lock files
7. **Invalid JSON**: Malformed package.json
8. **Empty Directory**: No Node.js files present

### Performance Considerations
- **File Checks**: Use efficient `io.open()` calls
- **Early Exit**: Return immediately if package.json missing
- **Limited Depth**: Only check root directory files
- **Error Handling**: Graceful fallback if file reads fail