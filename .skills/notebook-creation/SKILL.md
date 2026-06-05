---
description: Create or modify Jupyter notebooks following metpen-ai-lab standards for research methods teaching with responsible AI assistance
applyTo:
  - "**/*.ipynb"
  - "**/notebooks/**"
---

# Notebook Creation Skill for metpen-ai-lab

## Purpose

This skill helps create or modify Jupyter notebooks that follow the metpen-ai-lab teaching structure and responsible AI principles.

## When to Use This Skill

- Creating new notebooks in the learning sequence
- Modifying existing notebooks to match project standards
- Adding charts and visualizations with proper explanations
- Ensuring consistent structure across all notebooks

## Do NOT Use This Skill For

- Creating notebooks outside the metpen-ai-lab context
- Simple notebook editing that doesn't require project-specific standards
- Working with notebooks in other projects

## Standard Notebook Structure

Every notebook must follow this teaching structure:

1. **Title** (Markdown)
2. **Learning outcomes** (Markdown, in Indonesian unless specified otherwise)
3. **Concept explanation** (Markdown)
4. **Why it matters in research methods** (Markdown)
5. **Code example** (Code cell)
6. **Output interpretation** (Markdown)
7. **Student task** (Markdown)
8. **Reflection question** (Markdown)
9. **AI-use suggestion** (Markdown)
10. **Common mistakes/caution** (Markdown)

## Chart Explanation Template

Every visualization MUST include this Markdown structure:

```markdown
### Apa yang ditunjukkan grafik ini

[Explain the variables shown.]

### Mengapa grafik ini sesuai

[Explain why this chart type fits the question.]

### Pola yang diamati

[Describe the visible pattern carefully.]

### Peringatan

[Explain what cannot be concluded from the chart alone.]
```

## Critical Rules

### Language Rules

- **Student-facing content**: Indonesian (default) or as specified by user
- **Technical elements**: English (file paths, variable names, function names, package names)
- **Consistency**: Use one language consistently within each notebook

### Path Rules

- **Always use relative paths**: `../data/synthetic/filename.csv`
- **Never use absolute paths**: No `C:\...`, `/Users/...`, or `/home/...`
- **Data references**:
  - Synthetic: `../data/synthetic/synthetic_student_performance.csv`
  - Processed: `../data/processed/student_performance_cleaned.csv`

### Synthetic Data Labeling

Every reference to synthetic data MUST include a disclaimer:

```markdown
> **Catatan**: Dataset ini dibuat secara sintetis untuk keperluan pembelajaran dan tidak mewakili data mahasiswa yang sebenarnya.
```

English version:

```markdown
> **Note**: This dataset is synthetically generated for learning purposes and does not represent real student data.
```

### Interpretation Style

- Use cautious academic language
- Distinguish correlation from causation
- Always mention limitations
- Example: "Pola ini menunjukkan adanya asosiasi antara kehadiran dan nilai akhir. Namun, grafik ini tidak membuktikan bahwa kehadiran menyebabkan nilai yang lebih tinggi."

## Notebook-Specific Requirements

### 00_orientation.ipynb

- Welcome and project overview
- Environment check (import tests, version check)
- Folder structure explanation
- Responsible AI introduction

### 01_data_loading.ipynb

- Load synthetic CSV
- Show `head()`, `tail()`, `shape`, `info()`, `describe()`
- Explain data types and basic summaries
- Include synthetic data disclaimer

### 02_data_quality_cleaning.ipynb

- Count and visualize missing values
- Identify duplicates
- Apply cleaning steps with clear rationale
- Save to `../data/processed/student_performance_cleaned.csv`
- Document cleaning decisions

### 03_exploratory_analysis.ipynb

- Create 4+ charts:
  - Histogram of `final_grade`
  - Boxplot by group
  - Scatter plot
  - Count/bar plot
- Each chart needs full explanation template
- Practice cautious interpretation

### 04_descriptive_statistics.ipynb

- Calculate mean, median, std, min, max
- Grouped summaries (by program, internet_access, etc.)
- Discuss when to use mean vs median
- Explain what descriptive statistics can/cannot prove

### 05_correlation_regression.ipynb

- **Critical**: Distinguish correlation from causation
- Correlation matrix for selected variables
- Correlation heatmap
- Simple linear regression
- Interpret coefficients cautiously
- Multiple warnings about causal overclaiming

### 06_case_study_template.ipynb

- Mini case study combining all skills
- Must include:
  - Research question
  - Method selection and justification
  - Analysis steps
  - Results interpretation
  - Limitations discussion
  - AI usage disclosure

## Code Cell Standards

### Import Structure

```python
# Standard imports
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Configure visualization
plt.style.use('default')
sns.set_palette("husl")
%matplotlib inline
```

### Data Loading Pattern

```python
# Load data using relative path
df = pd.read_csv('../data/synthetic/synthetic_student_performance.csv')

# Display basic info
print(f"Dataset shape: {df.shape}")
df.head()
```

### Visualization Pattern

```python
# Create figure
plt.figure(figsize=(10, 6))

# Create plot
[plot code here]

# Add labels (in Indonesian)
plt.xlabel('Variabel X')
plt.ylabel('Variabel Y')
plt.title('Judul Grafik')

# Show plot
plt.tight_layout()
plt.show()
```

## Common Mistakes to Avoid

1. **Claiming synthetic data is real** - Always label clearly
2. **Using absolute paths** - Always use relative paths
3. **Mixing languages randomly** - Keep consistent language per notebook
4. **Overclaiming causality** - Always mention limitations
5. **Complex code without explanation** - Add Markdown before complex cells
6. **Charts without interpretation** - Use full explanation template
7. **Missing reflection questions** - Every notebook needs student tasks
8. **Forgetting AI-use guidance** - Show students how AI can help responsibly

## Validation Checklist

Before completing notebook creation/modification:

- [ ] Notebook follows 10-part structure
- [ ] Language is consistent (Indonesian for content, English for code)
- [ ] All paths are relative
- [ ] Synthetic data has disclaimer
- [ ] Charts have full 4-part explanations
- [ ] Interpretations are cautious (no causal overclaims)
- [ ] Student tasks are clear and achievable
- [ ] Reflection questions promote critical thinking
- [ ] AI-use suggestions are responsible
- [ ] Code runs top-to-bottom without manual changes
- [ ] Notebook can access data from current location

## Integration with Other Files

- Check [metpen-ai-lab.md](../metpen-ai-lab.md) § 9 for detailed notebook design standards
- Check [AGENTS.md](../AGENTS.md) § "Adding or Modifying a Notebook" for workflow
- Use prompts from [prompts/](../prompts/) folder as examples for AI-use suggestions
- Reference templates from [templates/](../templates/) folder in student tasks

## Workflow

1. **Understand context**: What is the notebook's position in the 7-notebook sequence?
2. **Check language**: Has the user specified Indonesian or another language?
3. **Create structure**: Use the 10-part template
4. **Add content**: Follow notebook-specific requirements above
5. **Include charts**: Use explanation template for each visualization
6. **Add interpretation**: Use cautious academic language
7. **Validate**: Run through checklist
8. **Test**: Ensure notebook runs top-to-bottom

## Example Markdown Cells

### Learning Outcomes (Indonesian)

```markdown
## Hasil Pembelajaran

Setelah menyelesaikan notebook ini, Anda akan dapat:

1. Memuat dataset menggunakan pandas
2. Memeriksa struktur dan tipe data
3. Membuat ringkasan deskriptif dasar
4. Mengidentifikasi variabel kunci dalam dataset
```

### Caution Note (Indonesian)

```markdown
## ⚠️ Peringatan Penting

Analisis statistik deskriptif menunjukkan **pola** dalam data, tetapi tidak membuktikan **penyebab**.

Misalnya, jika kita melihat korelasi antara kehadiran dan nilai akhir, ini **tidak berarti** bahwa kehadiran secara langsung menyebabkan nilai yang lebih tinggi. Mungkin ada faktor lain (motivasi, kemampuan awal, dll.) yang mempengaruhi keduanya.

Selalu pertimbangkan keterbatasan dan alternatif penjelasan.
```

### AI Use Suggestion (Indonesian)

```markdown
## 💡 Cara Menggunakan AI untuk Bagian Ini

AI dapat membantu Anda:

- **Menjelaskan kode**: "Jelaskan apa yang dilakukan fungsi `.describe()` dan bagaimana membaca hasilnya"
- **Memilih metode**: "Metode apa yang tepat untuk membandingkan nilai rata-rata antara dua program?"
- **Menginterpretasi hasil**: "Apa makna statistik median yang lebih tinggi dari mean dalam konteks penelitian?"

**Ingat**: Selalu verifikasi jawaban AI, jangan hanya menyalin kode tanpa memahami, dan catat penggunaan AI Anda dalam log.

Lihat template: [ai_usage_log_template.md](../templates/ai_usage_log_template.md)
```

## Error Prevention

### If creating a new notebook sequence number:

- Verify it fits logically in the 00-06 sequence
- Check if it's in the original plan ([metpen-ai-lab.md](../metpen-ai-lab.md) § 3)
- If not in plan, ask user before creating

### If user asks to add real data:

- Require source URL and license documentation
- Add to `data/raw/README.md`
- Never claim synthetic data is real

### If user asks for complex analysis:

- Check if it fits beginner-friendly principle
- Add clear explanations before code
- Consider if it should be in later expansion notebooks

## Success Criteria

A notebook is complete when:

1. It runs top-to-bottom without errors
2. All charts appear correctly
3. Data loads from correct relative path
4. Language is consistent throughout
5. Interpretations are cautious and accurate
6. Student tasks are clear
7. Reflection questions promote critical thinking
8. Synthetic data is properly labeled
9. Code is beginner-friendly with clear comments
10. It fits coherently in the learning sequence
