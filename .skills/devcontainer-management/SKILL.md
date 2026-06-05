---
description: Manage Dev Container configuration for metpen-ai-lab project, ensuring dependencies are properly installed in Docker image
applyTo:
  - "**/.devcontainer/**"
  - "**/Dockerfile"
  - "**/devcontainer.json"
  - "**/requirements.txt"
---

# Dev Container Management Skill for metpen-ai-lab

## Purpose

This skill ensures proper Dev Container configuration for metpen-ai-lab, following the project's strict rule: **dependencies must be installed in the Docker image, NOT through postCreateCommand**.

## Critical Project Rule

⚠️ **NON-NEGOTIABLE**: This project does NOT use `postCreateCommand` for dependency installation.

**Why**:

- Dependencies must be baked into Docker image
- Environment is self-contained and reproducible
- Students don't need manual installation steps
- Jupyter kernel is pre-configured

## When to Use This Skill

- Setting up the initial Dev Container
- Adding new Python packages
- Updating dependencies
- Troubleshooting container build issues
- Ensuring reproducible environment

## Do NOT Use This Skill For

- Container projects that use different architecture
- Projects outside metpen-ai-lab
- Runtime dependency installation (should be in Dockerfile)

## Standard Configuration

### Required File: `.devcontainer/devcontainer.json`

```json
{
  "name": "metpen-ai-lab",
  "build": {
    "dockerfile": "Dockerfile",
    "context": ".."
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "ms-toolsai.jupyter",
        "ms-toolsai.datawrangler",
        "GitHub.copilot",
        "GitHub.copilot-chat",
        "yzhang.markdown-all-in-one"
      ],
      "settings": {
        "python.defaultInterpreterPath": "/usr/local/bin/python",
        "jupyter.askForKernelRestart": false,
        "files.autoSave": "afterDelay",
        "editor.formatOnSave": true,
        "notebook.lineNumbers": "on"
      }
    }
  },
  "remoteUser": "vscode"
}
```

**Key points**:

- NO `postCreateCommand` property
- NO `postStartCommand` for dependency installation
- Extensions are specified for consistent setup
- Settings optimize notebook workflow

### Required File: `.devcontainer/Dockerfile`

```dockerfile
FROM mcr.microsoft.com/devcontainers/python:3.11

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspaces/metpen-ai-lab

# Copy and install Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r /tmp/requirements.txt \
    && python -m ipykernel install --sys-prefix --name metpen-ai-lab --display-name "Python (metpen-ai-lab)"
```

**Key architecture decisions**:

1. Python dependencies installed during image build
2. Jupyter kernel registered during image build
3. No manual installation steps after container starts
4. Clean apt cache to reduce image size

### Required File: `requirements.txt`

```txt
jupyter
ipykernel
nbformat
pandas
numpy
matplotlib
seaborn
scipy
statsmodels
scikit-learn
openpyxl
missingno
pytest
```

## Common Tasks

### Adding New Python Package

**CORRECT workflow**:

1. Add package to `requirements.txt`
2. Rebuild Dev Container image
3. Test that notebooks still work

**DO NOT**:

- Add `postCreateCommand` to run `pip install`
- Manually install in running container (not persistent)
- Use `postStartCommand` for dependencies

Example:

```bash
# After updating requirements.txt
# Press Ctrl+Shift+P
# Run: Dev Containers: Rebuild Container
```

### Troubleshooting Container Build Failures

**Check these in order**:

1. **requirements.txt syntax**
   - No comments starting mid-line
   - One package per line
   - No duplicate packages

2. **Dockerfile COPY path**
   - `COPY requirements.txt /tmp/requirements.txt` must be correct
   - Context is `..` (parent directory)
   - requirements.txt must exist at root level

3. **Package compatibility**
   - Check if packages are compatible with Python 3.11
   - Check for conflicting dependencies

4. **Docker image pull**
   - Ensure `mcr.microsoft.com/devcontainers/python:3.11` is accessible
   - Check network connectivity

### Updating Base Image

Current: `mcr.microsoft.com/devcontainers/python:3.11`

If updating Python version:

1. Change in Dockerfile FROM line
2. Test all notebooks for compatibility
3. Update documentation if behavior changes

### Adding VS Code Extensions

Add to `devcontainer.json` under `customizations.vscode.extensions`:

```json
"extensions": [
  "ms-python.python",
  "ms-toolsai.jupyter",
  // ... existing extensions
  "new-publisher.new-extension"
]
```

Then rebuild container.

## Validation Checklist

Before completing Dev Container changes:

- [ ] `devcontainer.json` has NO `postCreateCommand`
- [ ] `devcontainer.json` has NO `postStartCommand` for dependencies
- [ ] Dockerfile installs dependencies during build
- [ ] Dockerfile registers Jupyter kernel
- [ ] `requirements.txt` is at workspace root
- [ ] All required packages are in `requirements.txt`
- [ ] Context is set to `..` in devcontainer.json
- [ ] WORKDIR matches actual workspace location
- [ ] Container builds successfully
- [ ] Jupyter kernel appears as "Python (metpen-ai-lab)"
- [ ] Test notebooks run without additional installation

## Common Mistakes to Avoid

### ❌ Mistake 1: Using postCreateCommand for dependencies

```json
// WRONG - DO NOT DO THIS
{
  "postCreateCommand": "pip install -r requirements.txt"
}
```

**Why wrong**: Dependencies won't be in the image, breaks reproducibility

**Correct**: Install in Dockerfile

### ❌ Mistake 2: Manual pip install in terminal

```bash
# WRONG - DO NOT DO THIS
pip install pandas
```

**Why wrong**: Not persistent across container rebuilds

**Correct**: Add to requirements.txt and rebuild

### ❌ Mistake 3: Wrong Dockerfile COPY path

```dockerfile
# WRONG - DO NOT DO THIS
COPY ./requirements.txt /tmp/requirements.txt
```

**Why wrong**: Context is `..`, so file is at `../requirements.txt` relative to Dockerfile

**Correct**: Use `requirements.txt` without `./`

### ❌ Mistake 4: Forgetting kernel registration

```dockerfile
# WRONG - Incomplete
RUN pip install -r /tmp/requirements.txt
# Missing kernel registration!
```

**Why wrong**: Jupyter won't have proper kernel

**Correct**: Add `&& python -m ipykernel install ...`

### ❌ Mistake 5: Not rebuilding after changes

Making changes to requirements.txt but not rebuilding container.

**Correct**: Always rebuild after changing dependencies

## Integration with Project

- Check [metpen-ai-lab.md](../metpen-ai-lab.md) § 2 "Required workflow"
- Check [metpen-ai-lab.md](../metpen-ai-lab.md) § 5 "Phase A — Local bootstrap"
- See [AGENTS.md](../AGENTS.md) § "Dev Container Workflow"

## Workflow for New Setup

### First-time Setup

1. Create folder structure
2. Create `requirements.txt` at workspace root
3. Create `.devcontainer/Dockerfile`
4. Create `.devcontainer/devcontainer.json` (NO postCreateCommand!)
5. Open in VS Code
6. Run: Dev Containers: Reopen in Container
7. Wait for build to complete
8. Verify Jupyter kernel exists
9. Test import of key packages

### After Dependency Changes

1. Edit `requirements.txt`
2. Run: Dev Containers: Rebuild Container
3. Wait for build
4. Test notebooks still work
5. Run: `pytest tests/test_imports.py`

## Testing Container Setup

### Manual Tests

```python
# In a notebook or Python terminal
import pandas
import numpy
import matplotlib
import seaborn
import scipy
import statsmodels
import sklearn

print("All imports successful!")
```

### Automated Tests

```bash
# Run in terminal
pytest tests/test_imports.py
```

### Kernel Test

1. Open any notebook
2. Click kernel selector (top right)
3. Verify "Python (metpen-ai-lab)" appears
4. Select it
5. Run a cell with imports

## Stop Conditions

Container setup is complete when:

1. Container builds without errors
2. `devcontainer.json` contains NO `postCreateCommand`
3. All packages in `requirements.txt` are installed
4. Jupyter kernel "Python (metpen-ai-lab)" appears
5. Test notebooks run successfully
6. `pytest tests/test_imports.py` passes
7. No manual installation steps are needed

## Rebuild Triggers

Rebuild container when:

- `requirements.txt` changes
- `Dockerfile` changes
- `devcontainer.json` build section changes
- New system dependencies needed
- Base image needs to be updated

**Do NOT rebuild** when:

- Only VS Code settings change (just reload)
- Only notebooks change
- Only data files change
- Documentation changes

## Architecture Rationale

**Why install dependencies in Dockerfile instead of postCreateCommand?**

1. **Reproducibility**: Image is self-contained
2. **Speed**: No wait after container starts
3. **Reliability**: No network dependency after build
4. **Teaching value**: Students see dependencies are part of environment setup
5. **Docker best practice**: Leverage layer caching

This is a **core architectural decision** of metpen-ai-lab and must not be changed.

## Documentation Requirements

When modifying Dev Container:

1. Update [docs/01-how-to-open-in-devcontainer.md](../docs/01-how-to-open-in-devcontainer.md) if process changes
2. Update [README.md](../README.md) if setup instructions change
3. Update [docs/03-faq-troubleshooting.md](../docs/03-faq-troubleshooting.md) with any new issues encountered
4. Document dependency choices if adding non-obvious packages

## Success Criteria

A Dev Container modification is successful when:

1. Build completes without errors
2. Adheres to "no postCreateCommand" rule
3. All dependencies are installed in image
4. Kernel is pre-registered
5. Tests pass
6. Notebooks run without additional setup
7. Documentation is updated
8. Changes are minimal and justified
