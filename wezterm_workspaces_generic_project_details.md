# Generic Project Detection Specifications

## Overview
Fallback detection logic for directories that don't match any specific project type patterns. This serves as the final catch-all for any directory where a user wants to create a workspace.

## Base Requirements
- **Trigger**: No other detector (nodejs, python, rust, git) matches
- **Scope**: Any directory structure
- **Purpose**: Ensure every directory can have a workspace created

## Detection Logic

### 1. Generic Projects (Fallback)
**Files to Check**: No specific requirements - always matches
**Detection Result**:
```json
{
  "project_type": "generic",
  "project_subtype": null,
  "package_manager": null, 
  "detection_evidence": []
}
```

**Directory Examples**:

#### File Collection
```
random-files/
├── document.txt
├── image.png
├── data.csv
├── archive.zip
└── notes/
    └── meeting-notes.txt
```

#### Media Directory
```
photos-2023/
├── vacation/
│   ├── IMG_001.jpg
│   ├── IMG_002.jpg
│   └── IMG_003.jpg
├── family/
│   └── birthday.mp4
└── metadata.txt
```

#### Work Project (Non-Code)
```
marketing-campaign/
├── brief.docx
├── assets/
│   ├── logo.png
│   ├── banner.jpg
│   └── video.mp4
├── presentations/
│   └── pitch.pptx
└── research/
    └── competitor-analysis.xlsx
```

#### Empty Directory
```
new-project/
(empty directory)
```

#### Unknown File Types
```
specialized-tools/
├── model.blend         # Blender file
├── design.sketch       # Sketch file
├── audio.flac          # Audio file
├── data.db             # Database file
└── config.ini          # Configuration
```

## Detection Algorithm

```lua
local function detect_generic_details(path)
    -- Generic detection always succeeds as fallback
    -- No specific files required
    
    return {
        project_type = "generic",
        project_subtype = null,
        package_manager = null,
        detection_evidence = {}
    }
end
```

## Detection Context

### When Generic Detection Applies
Generic detection is the final fallback when:
1. **No Language Patterns**: No nodejs, python, rust configuration files
2. **No Git Repository**: No `.git` directory found
3. **Mixed File Types**: Various file types with no clear project structure
4. **Non-Programming Directories**: Documents, media, data files
5. **Empty Directories**: User wants workspace in empty directory
6. **Unknown Project Types**: Languages/tools not yet supported

### Detection Flow
```lua
local function detect_project_details(path)
    -- Try specific detectors first
    local result = detect_nodejs_details(path)
    if result then return result end
    
    result = detect_python_details(path)
    if result then return result end
    
    result = detect_rust_details(path)  
    if result then return result end
    
    result = detect_git_details(path)
    if result then return result end
    
    -- Always succeeds as fallback
    return detect_generic_details(path)
end
```

## Enhanced Detection (Future)

### Potential Content-Based Subtypes
Future enhancements could detect specific generic project types:

#### Media Projects
```json
{
  "project_type": "generic",
  "project_subtype": "media",
  "package_manager": null,
  "detection_evidence": ["*.jpg", "*.mp4", "*.png"]
}
```
**Indicators**: High percentage of media files (jpg, png, mp4, mp3, etc.)

#### Document Projects
```json
{
  "project_type": "generic", 
  "project_subtype": "documents",
  "package_manager": null,
  "detection_evidence": ["*.docx", "*.pdf", "*.xlsx"]
}
```
**Indicators**: Office documents, PDFs, text files

#### Data Projects
```json
{
  "project_type": "generic",
  "project_subtype": "data",
  "package_manager": null,
  "detection_evidence": ["*.csv", "*.json", "*.xml"]
}
```
**Indicators**: Data files (csv, json, xml, parquet, etc.)

#### Design Projects
```json
{
  "project_type": "generic",
  "project_subtype": "design", 
  "package_manager": null,
  "detection_evidence": ["*.sketch", "*.fig", "*.psd"]
}
```
**Indicators**: Design files (sketch, figma, photoshop, illustrator)

## Common Generic Project Patterns

### Personal Files Organization
```
personal-workspace/
├── documents/
│   ├── resume.pdf
│   └── contracts/
├── photos/
│   └── 2023/
├── projects/
│   └── ideas.txt
└── temp/
```
**Current**: `generic` project
**Future**: `generic/documents`

### Research Data Collection
```
research-data/
├── datasets/
│   ├── survey-2023.csv
│   ├── interview-transcripts.json
│   └── statistics.xlsx
├── analysis/
│   └── preliminary-findings.docx
└── references/
    └── papers.pdf
```
**Current**: `generic` project
**Future**: `generic/data`

### Creative Project
```
album-artwork/
├── concepts/
│   ├── sketch-1.jpg
│   └── sketch-2.jpg  
├── final/
│   ├── cover.psd
│   └── cover-export.png
├── assets/
│   └── textures/
└── brief.txt
```
**Current**: `generic` project
**Future**: `generic/design`

### Learning Materials
```
course-materials/
├── lectures/
│   ├── week-1.pdf
│   └── week-2.pdf
├── assignments/
│   ├── homework-1.docx
│   └── project.zip
├── notes/
│   └── my-notes.md
└── resources/
    └── additional-reading.pdf
```
**Current**: `generic` project
**Future**: `generic/documents`

## Implementation Considerations

### Content Analysis for Subtypes
Future subtype detection could analyze file extensions:

```lua
local function analyze_directory_content(path)
    local file_types = {}
    local total_files = 0
    
    -- Scan directory for file extensions
    -- Count occurrences of each type
    -- Return content profile
    
    return {
        media_percentage = 0.7,
        document_percentage = 0.2,
        data_percentage = 0.1,
        dominant_type = "media"
    }
end
```

### Performance Considerations
- **Lightweight Scanning**: Avoid deep directory traversal
- **Extension Analysis**: Quick file extension checks
- **File Count Limits**: Don't analyze directories with too many files
- **Early Exit**: Stop analysis once pattern is clear

## Edge Cases

### Mixed Content Types
Directory with roughly equal amounts of different file types:
```
mixed-project/
├── data.csv           # Data file
├── presentation.pptx  # Document
├── photo.jpg          # Media
├── script.sh          # Script (but not a programming project)
└── config.conf        # Configuration
```
**Result**: Remains `generic` with no subtype (no dominant pattern)

### Temporary/Cache Directories
Directories with temporary or system files:
```
temp-workspace/
├── .DS_Store          # System files
├── Thumbs.db
├── temp.tmp
└── cache/
```
**Result**: Still `generic` project (user explicitly chose this directory)

### Symbolic Links
Directory containing many symbolic links:
```
linked-files/
├── link-to-doc.pdf -> /path/to/real/file.pdf
├── link-to-data.csv -> /other/path/data.csv
└── real-file.txt
```
**Handling**: Analyze link targets or ignore links in content analysis

### Very Large Directories
Directories with thousands of files:
```
huge-dataset/
├── file-0001.jpg
├── file-0002.jpg
├── ... (thousands more)
└── file-9999.jpg
```
**Performance**: Limit analysis to first N files or sample randomly

## Testing Scenarios

### Required Test Cases
1. **Empty Directory**: Completely empty directory
2. **Mixed Files**: Various file types with no clear pattern
3. **Media Heavy**: Directory with mostly images/videos
4. **Documents Heavy**: Directory with mostly office documents
5. **Data Heavy**: Directory with mostly CSV/JSON files
6. **Single File**: Directory with one file
7. **System Files Only**: Directory with only .DS_Store, temp files
8. **Nested Structure**: Deep directory hierarchy with mixed content
9. **Permission Issues**: Directory with some unreadable files
10. **Symbolic Links**: Directory with symlinks

### Performance Test Cases
- **Large Directory**: 10,000+ files
- **Deep Nesting**: 20+ directory levels
- **Mixed Permissions**: Some readable, some not
- **Network Drives**: Slow file system access

## Benefits of Generic Detection

### Workspace Flexibility
- **Universal Coverage**: Any directory can become a workspace
- **User Choice**: Respects user's decision to work in any location
- **Gradual Enhancement**: Can add project files later

### Future Enhancement Foundation
- **Content Analysis**: Rich foundation for future subtype detection
- **Tool Integration**: Could suggest relevant tools based on content
- **Smart Templates**: Content-aware workspace templates

### Error Prevention
- **No Failed Detection**: Always succeeds as fallback
- **Graceful Degradation**: Works even when other detectors fail
- **User Experience**: Consistent behavior regardless of directory content