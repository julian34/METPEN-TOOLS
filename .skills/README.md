# Custom Skills for metpen-ai-lab

This directory contains custom GitHub Copilot skills that provide specialized guidance for working on the metpen-ai-lab project.

## Available Skills

### 1. Notebook Creation (`notebook-creation/`)

**Purpose**: Create or modify Jupyter notebooks following metpen-ai-lab teaching standards

**Use when**:

- Creating new notebooks in the learning sequence
- Modifying existing notebooks to match project standards
- Adding visualizations with proper explanations
- Ensuring responsible AI teaching practices in notebooks

**Key features**:

- 10-part notebook structure template
- Chart explanation template (4-part)
- Language consistency rules (Indonesian content, English code)
- Relative path requirements
- Synthetic data labeling
- Cautious interpretation style
- Validation checklist

### 2. Dev Container Management (`devcontainer-management/`)

**Purpose**: Manage Dev Container configuration following project's strict architecture

**Use when**:

- Setting up initial Dev Container
- Adding new Python packages
- Updating dependencies
- Troubleshooting build issues

**Key features**:

- Enforces "no postCreateCommand" rule
- Dependencies in Dockerfile (not postCreateCommand)
- Jupyter kernel pre-registration
- Troubleshooting guide
- Rebuild workflow

**Critical rule**: This project does NOT use `postCreateCommand` for dependency installation. All dependencies must be installed during Docker image build.

### 3. Responsible AI Teaching (`responsible-ai-teaching/`)

**Purpose**: Ensure responsible AI practices in all student-facing content

**Use when**:

- Adding AI-use suggestions to notebooks
- Creating prompt templates
- Writing documentation about AI policy
- Adding reflection questions

**Key features**:

- 4 safe AI use patterns (Explain Code, Choose Method, Interpret Results, Reflect on Limitations)
- AI usage documentation requirements
- Prohibited AI uses
- Verification reminders
- Critical thinking prompts
- Student AI log template guidance

## How Skills Work

Skills are automatically invoked by GitHub Copilot when you work on files matching their `applyTo` patterns.

For example:

- Working on `*.ipynb` files → `notebook-creation` skill activates
- Editing `.devcontainer/Dockerfile` → `devcontainer-management` skill activates
- Modifying `prompts/*.md` → `responsible-ai-teaching` skill activates

## Quick Reference

### Creating a New Notebook?

→ See [notebook-creation/SKILL.md](notebook-creation/SKILL.md)

- Use 10-part structure
- Add chart explanations (4-part template)
- Include AI-use suggestions
- Use relative paths
- Label synthetic data

### Adding Python Package?

→ See [devcontainer-management/SKILL.md](devcontainer-management/SKILL.md)

1. Add to `requirements.txt`
2. Rebuild Dev Container
3. Do NOT use postCreateCommand

### Teaching Responsible AI Use?

→ See [responsible-ai-teaching/SKILL.md](responsible-ai-teaching/SKILL.md)

- Show specific example prompts
- Add verification reminders
- Include critical thinking questions
- Require AI usage documentation

## Integration with Other Instructions

These skills work together with:

- [.instructions.md](../.instructions.md) - Quick workspace context
- [AGENTS.md](../AGENTS.md) - Agent-specific instructions
- [metpen-ai-lab.md](../metpen-ai-lab.md) - Detailed implementation plan

Skills provide **focused, task-specific guidance**, while the main instruction files provide overall project context and principles.

## Skill Development Principles

All skills follow these principles:

1. **Specific and actionable**: Provide concrete steps, not vague guidance
2. **Example-rich**: Show actual code/markdown examples
3. **Validation-focused**: Include checklists to verify correctness
4. **Error prevention**: Highlight common mistakes
5. **Integrated**: Reference other project documentation
6. **Beginner-friendly**: Assume users are learning the system

## When to Use Each File Type

| File Type            | Purpose                         | When to Read                   |
| -------------------- | ------------------------------- | ------------------------------ |
| `.instructions.md`   | Quick workspace overview        | First time working on project  |
| `AGENTS.md`          | Agent behavior and common tasks | Understanding agent guidance   |
| `metpen-ai-lab.md`   | Detailed implementation plan    | Planning or major changes      |
| `.skills/*/SKILL.md` | Task-specific guidance          | Working on specific file types |

## Maintenance

When updating skills:

1. Keep consistent with main project documentation
2. Update examples to match current best practices
3. Test guidance with actual use cases
4. Update validation checklists if requirements change
5. Cross-reference related documentation

## Questions?

- See [docs/03-faq-troubleshooting.md](../docs/03-faq-troubleshooting.md) for common issues
- Check [metpen-ai-lab.md](../metpen-ai-lab.md) for implementation details
- Review [AGENTS.md](../AGENTS.md) for agent-specific guidance
