# Rust Project Detection Specifications

## Overview
Enhanced detection logic for Rust projects in WezTerm workspaces, identifying workspace configurations, binary vs library projects, and project structure patterns.

## Base Requirements
- **Primary Indicator**: `Cargo.toml` file must exist
- **Secondary Indicators**: Project structure files (`src/main.rs`, `src/lib.rs`)
- **Detection Priority**: Check for workspace → binary → library → basic

## Detection Logic

### 1. Rust Workspace Projects
**Files to Check**: `Cargo.toml` with `[workspace]` section
**Detection Result**:
```json
{
  "project_type": "rust",
  "project_subtype": "workspace",
  "package_manager": "cargo",
  "detection_evidence": ["Cargo.toml", "[workspace]"]
}
```

**Directory Example**:
```
rust-workspace/
├── Cargo.toml          # Contains [workspace] section
├── Cargo.lock
├── crate-a/
│   ├── Cargo.toml
│   └── src/
│       └── lib.rs
├── crate-b/
│   ├── Cargo.toml
│   └── src/
│       └── main.rs
└── shared/
    ├── Cargo.toml
    └── src/
        └── lib.rs
```

### 2. Rust Binary Projects
**Files to Check**: `Cargo.toml` + `src/main.rs`
**Detection Result**:
```json
{
  "project_type": "rust",
  "project_subtype": "binary",
  "package_manager": "cargo",
  "detection_evidence": ["Cargo.toml", "src/main.rs"]
}
```

**Directory Example**:
```
cli-tool/
├── Cargo.toml
├── Cargo.lock
├── src/
│   ├── main.rs
│   ├── lib.rs          # Optional additional modules
│   └── utils.rs
├── tests/
└── README.md
```

### 3. Rust Library Projects
**Files to Check**: `Cargo.toml` + `src/lib.rs` (no `src/main.rs`)
**Detection Result**:
```json
{
  "project_type": "rust", 
  "project_subtype": "library",
  "package_manager": "cargo",
  "detection_evidence": ["Cargo.toml", "src/lib.rs"]
}
```

**Directory Example**:
```
my-rust-lib/
├── Cargo.toml
├── Cargo.lock
├── src/
│   ├── lib.rs
│   ├── utils.rs
│   └── types.rs
├── tests/
├── examples/
└── benches/
```

### 4. Basic Rust Projects
**Files to Check**: `Cargo.toml` only (no standard src structure)
**Detection Result**:
```json
{
  "project_type": "rust",
  "project_subtype": "basic", 
  "package_manager": "cargo",
  "detection_evidence": ["Cargo.toml"]
}
```

**Directory Example**:
```
custom-rust-project/
├── Cargo.toml
├── build.rs           # Custom build script
├── custom-src/
│   └── code.rs
└── resources/
```

## Detection Algorithm

```lua
local function detect_rust_details(path)
    local evidence = {}
    local subtype = "basic"  -- default
    
    -- Check for Cargo.toml (required)
    if not file_exists(path .. "/Cargo.toml") then
        return nil  -- Not a Rust project
    end
    table.insert(evidence, "Cargo.toml")
    
    -- Check if it's a workspace by reading Cargo.toml content
    if is_workspace_project(path .. "/Cargo.toml") then
        subtype = "workspace"
        table.insert(evidence, "[workspace]")
        
    -- Check for binary project (has main.rs)
    elseif file_exists(path .. "/src/main.rs") then
        subtype = "binary"
        table.insert(evidence, "src/main.rs")
        
    -- Check for library project (has lib.rs, no main.rs)
    elseif file_exists(path .. "/src/lib.rs") then
        subtype = "library" 
        table.insert(evidence, "src/lib.rs")
    end
    
    return {
        project_type = "rust",
        project_subtype = subtype,
        package_manager = "cargo",
        detection_evidence = evidence
    }
end

local function is_workspace_project(cargo_toml_path)
    local file = io.open(cargo_toml_path, "r")
    if not file then return false end
    
    local content = file:read("*all")
    file:close()
    
    -- Simple check for [workspace] section
    return content:match("%[workspace%]") ~= nil
end
```

## Advanced Detection Cases

### Mixed Binary + Library Projects
**Files**: `Cargo.toml` + `src/main.rs` + `src/lib.rs`
**Priority**: Binary takes precedence (since it's more specific)
**Result**:
```json
{
  "project_type": "rust",
  "project_subtype": "binary",
  "package_manager": "cargo", 
  "detection_evidence": ["Cargo.toml", "src/main.rs", "src/lib.rs"]
}
```

### Workspace with Local Dependencies
**Root Cargo.toml**:
```toml
[workspace]
members = [
    "cli",
    "lib", 
    "server"
]
```
**Result**: Detects as `workspace`, evidence includes member crates in future enhancement.

### Custom Binary Name
Projects with `[[bin]]` sections in Cargo.toml defining custom binary names:
**Detection**: Still classified as `binary` project
**Evidence**: Could include custom binary names in future enhancement

## Common Rust Project Patterns

### Command Line Tool
```
awesome-cli/
├── Cargo.toml
├── src/
│   ├── main.rs         # Entry point
│   ├── cli.rs          # CLI argument parsing
│   ├── commands/       # Command implementations
│   └── utils.rs
└── tests/
```
**Detected as**: `binary` Rust project

### Web Service
```
web-api/
├── Cargo.toml
├── src/
│   ├── main.rs         # Server entry point
│   ├── routes/
│   ├── models/
│   └── db.rs
├── migrations/
└── static/
```
**Detected as**: `binary` Rust project

### Library Crate
```
data-structures/
├── Cargo.toml
├── src/
│   ├── lib.rs          # Library root
│   ├── tree.rs
│   ├── graph.rs
│   └── algorithms/
├── examples/
└── benches/
```
**Detected as**: `library` Rust project

### Workspace Project
```
game-engine/
├── Cargo.toml          # Workspace root
├── engine/             # Core engine library
│   ├── Cargo.toml
│   └── src/lib.rs
├── renderer/           # Rendering library
│   ├── Cargo.toml
│   └── src/lib.rs
├── game/               # Example game binary
│   ├── Cargo.toml
│   └── src/main.rs
└── tools/              # Development tools
    ├── Cargo.toml
    └── src/main.rs
```
**Detected as**: `workspace` Rust project

## Edge Cases

### No src/ Directory
Some Rust projects use custom directory structures:
```
embedded-project/
├── Cargo.toml
├── app/
│   └── main.rs
└── hal/
    └── lib.rs
```
**Result**: Detects as `basic` Rust project (since no standard src structure)

### Multiple Binaries
Projects with multiple binary targets:
```toml
[[bin]]
name = "server"
path = "src/bin/server.rs"

[[bin]] 
name = "client"
path = "src/bin/client.rs"
```
**Detection**: Still classified as `binary` project
**Evidence**: Could include multiple binary paths in future enhancement

### Procedural Macro Crates
```
my-macro/
├── Cargo.toml          # Contains proc-macro = true
└── src/
    └── lib.rs
```
**Detection**: Classified as `library` project
**Future Enhancement**: Could detect `proc-macro` subtype

## Cargo.toml Content Analysis

### Future Enhancement Opportunities
More sophisticated analysis could detect:
- **Workspace Members**: List member crates
- **Binary Names**: Custom binary target names
- **Library Type**: `proc-macro`, `cdylib`, `staticlib`
- **Edition**: Rust edition (2015, 2018, 2021)
- **Dependencies**: Key dependencies (tokio, serde, etc.)

### Sample Analysis Function
```lua
local function analyze_cargo_toml(path)
    -- Read and parse TOML content
    -- Extract workspace members, binary targets, library type
    -- Return structured analysis
end
```

## Testing Scenarios

### Required Test Cases
1. **Workspace Project**: Cargo.toml with [workspace] section
2. **Binary Project**: src/main.rs present
3. **Library Project**: src/lib.rs present (no main.rs)
4. **Mixed Project**: Both main.rs and lib.rs present
5. **Basic Project**: Cargo.toml only, no standard structure
6. **Custom Structure**: Non-standard directory layout
7. **Empty Project**: Cargo.toml with no source files
8. **Invalid Cargo.toml**: Malformed TOML file
9. **Workspace Member**: Crate inside a workspace
10. **Multiple Binaries**: Project with multiple binary targets

### Performance Considerations
- **File Existence**: Quick `io.open()` checks
- **Content Reading**: Only read Cargo.toml when needed for workspace detection
- **TOML Parsing**: Simple pattern matching vs full TOML parser
- **Error Handling**: Graceful fallback for malformed files

## Integration with Cargo Commands

### Future Workspace Integration
Enhanced project information could enable smarter workspace commands:
- **Binary Projects**: `cargo run`, `cargo build --release`
- **Library Projects**: `cargo test`, `cargo doc`, `cargo publish`
- **Workspace Projects**: `cargo build --workspace`, `cargo test --workspace`
- **Custom Commands**: Project-specific cargo aliases