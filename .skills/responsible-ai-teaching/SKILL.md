---
description: Ensure responsible AI teaching practices in metpen-ai-lab notebooks, prompts, and documentation
applyTo:
  - "**/notebooks/**"
  - "**/prompts/**"
  - "**/templates/**"
  - "**/docs/**"
---

# Responsible AI Teaching Skill for metpen-ai-lab

## Purpose

This skill ensures that all student-facing content in metpen-ai-lab models and teaches responsible AI usage, maintaining the project's core educational principle: **AI as a learning tool that enhances, not replaces, critical thinking**.

## Core Principle

Students use AI to:

- **Understand** concepts and methods
- **Explore** analytical approaches
- **Interpret** results with guidance
- **Reflect** on limitations and assumptions

Students must NOT use AI to:

- **Fabricate** data or sources
- **Skip** verification and understanding
- **Avoid** critical thinking
- **Hide** AI usage or present AI output as their own thinking

## When to Use This Skill

- Creating or modifying notebooks with AI-use suggestions
- Writing prompt templates for student guidance
- Creating documentation about AI policy
- Adding reflection questions about AI-assisted work
- Reviewing content for responsible AI messaging

## Responsible AI Framework

### 4 Safe AI Use Patterns

#### 1. Explain Code

**What**: Get explanations of code syntax and functionality
**Example**: "Jelaskan apa yang dilakukan fungsi `.groupby()` dan bagaimana cara kerjanya"
**Why safe**: Builds understanding of existing code
**Caution**: Still need to test and verify the explanation

#### 2. Choose Method

**What**: Get guidance on selecting appropriate analytical methods
**Example**: "Metode statistik apa yang tepat untuk membandingkan nilai rata-rata antara tiga program?"
**Why safe**: Helps navigate methodological decisions with justification
**Caution**: Must understand the method recommendation and verify appropriateness

#### 3. Interpret Results

**What**: Get help understanding what results mean
**Example**: "Apa makna p-value 0.03 dalam konteks penelitian ini?"
**Why safe**: Connects statistics to research context
**Caution**: AI may miss domain-specific nuances; student must apply critical thinking

#### 4. Reflect on Limitations

**What**: Identify assumptions and limitations of analysis
**Example**: "Apa keterbatasan menggunakan korelasi untuk menganalisis hubungan ini?"
**Why safe**: Encourages critical evaluation
**Caution**: Must consider context-specific limitations AI might miss

### Prompt Templates

See [prompts/](../prompts/) for full templates:

- [prompt_01_explain_code.md](../prompts/prompt_01_explain_code.md)
- [prompt_02_choose_method.md](../prompts/prompt_02_choose_method.md)
- [prompt_03_interpret_results.md](../prompts/prompt_03_interpret_results.md)
- [prompt_04_reflect_on_limitations.md](../prompts/prompt_04_reflect_on_limitations.md)

## Required Elements in Notebooks

### AI-Use Suggestion Section

Every notebook MUST include at minimum:

```markdown
## 💡 Cara Menggunakan AI untuk Bagian Ini

AI dapat membantu Anda:

- **[Specific task 1]**: "[Example prompt]"
- **[Specific task 2]**: "[Example prompt]"
- **[Specific task 3]**: "[Example prompt]"

**Ingat**:

- Selalu verifikasi jawaban AI
- Jangan hanya menyalin kode tanpa memahami
- Catat penggunaan AI Anda dalam log
- Pahami _mengapa_ solusi tersebut bekerja, bukan hanya _bahwa_ itu bekerja

Lihat: [ai_usage_log_template.md](../templates/ai_usage_log_template.md)
```

### Verification Reminder

Include in complex code sections:

```markdown
### ✅ Verifikasi Penting

Jika Anda menggunakan AI untuk menghasilkan atau memodifikasi kode ini:

1. **Jalankan kode dan periksa hasilnya** - Apakah outputnya masuk akal?
2. **Pahami setiap baris** - Jangan jalankan kode yang tidak Anda mengerti
3. **Bandingkan dengan dokumentasi** - Periksa dokumentasi resmi library
4. **Diskusikan dengan instruktur jika ragu** - Lebih baik bertanya daripada salah

AI bisa membuat kesalahan. Anda tetap bertanggung jawab atas kode yang Anda gunakan.
```

### Critical Thinking Prompts

Include reflection questions that promote critical AI usage:

```markdown
### 🤔 Refleksi

1. Jika Anda menggunakan AI untuk bagian ini, metode apa yang AI sarankan? Apakah ada alternatif yang perlu dipertimbangkan?

2. Bagaimana Anda memverifikasi bahwa hasil analisis Anda benar?

3. Apa keterbatasan dari pendekatan yang Anda gunakan?

4. Jika dua tools AI memberikan rekomendasi berbeda, bagaimana Anda memutuskan mana yang tepat?
```

## AI Usage Documentation

### Student AI Log Template

Students should maintain a log. Template at [templates/ai_usage_log_template.md](../templates/ai_usage_log_template.md):

```markdown
# AI Usage Log - [Your Name]

## [Date] - [Notebook Name]

### Task

[What you were trying to accomplish]

### AI Tool Used

[e.g., GitHub Copilot, ChatGPT, etc.]

### Prompt Given

[Exact prompt you used]

### AI Response

[Key parts of AI response]

### Verification Steps

[How you verified the response]

### Final Decision

[What you actually used and why]

### Reflection

[What worked well, what didn't, what you learned]
```

### Assignment-Level Disclosure

For case studies and final work, require:

```markdown
## Penggunaan AI dalam Tugas Ini

**AI Tool**: [Name of tool]

**Tugas yang Dibantu AI**:

1. [Specific task 1] - [How AI helped]
2. [Specific task 2] - [How AI helped]

**Verification Process**: [How I verified AI suggestions]

**Limitations Noted**: [What AI couldn't help with or where AI was incorrect]

**My Original Contribution**: [What parts I did independently]
```

## Prohibited AI Uses

### ❌ Data Fabrication

**NEVER**:

```markdown
# WRONG - DO NOT DO THIS

AI prompt: "Generate a CSV file with real student performance data"
```

**Why prohibited**: Creates fake data presented as real

**Correct approach**: Use clearly-labeled synthetic data from project scripts

### ❌ Source Fabrication

**NEVER**:

```markdown
# WRONG - DO NOT DO THIS

"AI suggested this dataset is from [made-up source], so I'll cite it"
```

**Why prohibited**: Academic dishonesty, false provenance

**Correct approach**: Only cite verified sources, document that data is synthetic

### ❌ Copy-Paste Without Understanding

**NEVER**:

```python
# WRONG - DO NOT DO THIS
# [Paste entire AI-generated code block without understanding]
# [Run it without checking]
```

**Why prohibited**: Learning outcome failure, potential errors

**Correct approach**: Understand each line, test incrementally, verify results

### ❌ Hiding AI Usage

**NEVER**:

```markdown
# WRONG - DO NOT DO THIS

[Use AI extensively but don't document it in log or assignment disclosure]
```

**Why prohibited**: Violates academic integrity policy, misrepresents learning process

**Correct approach**: Document all AI usage transparently

### ❌ Outsourcing Critical Thinking

**NEVER**:

```markdown
# WRONG - DO NOT DO THIS

AI prompt: "Analyze this data and write the full interpretation section for my research paper"
```

**Why prohibited**: AI does the thinking, student learns nothing

**Correct approach**: Use AI to understand concepts, then write interpretation independently

## Content Patterns to Include

### In Orientation Notebook (00_orientation.ipynb)

```markdown
## Kebijakan Penggunaan AI

Dalam lab ini, Anda **diperbolehkan dan didorong** untuk menggunakan AI tools seperti GitHub Copilot, ChatGPT, atau tools serupa.

**AI boleh digunakan untuk**:

- Menjelaskan kode yang tidak Anda pahami
- Memberikan contoh syntax atau penggunaan fungsi
- Membantu memilih metode analisis yang tepat
- Menginterpretasikan hasil statistik
- Mengidentifikasi keterbatasan metode

**AI TIDAK boleh digunakan untuk**:

- Membuat data palsu dan mengklaimnya sebagai data riil
- Menyalin seluruh jawaban tanpa pemahaman
- Menggantikan proses berpikir kritis Anda
- Menyembunyikan penggunaan AI (selalu catat dan ungkapkan)

**Kewajiban Anda**:

1. Verifikasi semua saran AI
2. Pahami setiap kode yang Anda gunakan
3. Catat penggunaan AI dalam log
4. Ungkapkan penggunaan AI dalam tugas akhir

Lihat detail lengkap: [docs/02-ai-usage-policy.md](../docs/02-ai-usage-policy.md)
```

### In Complex Analysis Notebooks (05, 06)

```markdown
## ⚠️ Peringatan: Keterbatasan AI dalam Interpretasi

AI sangat membantu untuk menjelaskan sintaks dan metode statistik, tetapi AI memiliki keterbatasan penting:

1. **Konteks domain**: AI mungkin tidak memahami konteks spesifik pendidikan tinggi atau penelitian Anda
2. **Kausalitas**: AI sering terlalu cepat menyimpulkan hubungan kausal dari data korelasional
3. **Asumsi metode**: AI mungkin merekomendasikan metode tanpa memeriksa asumsi yang diperlukan
4. **Data synthetic**: AI mungkin lupa bahwa data ini adalah synthetic dan membuat interpretasi seolah-olah data riil

**Selalu gunakan penilaian kritis Anda** dan diskusikan dengan instruktur jika ragu.
```

### In Case Study Template (06_case_study_template.ipynb)

```markdown
## Dokumentasi Penggunaan AI

### Prompt yang Digunakan

[List your AI prompts here]

### Verification Process

[Explain how you verified each AI suggestion]

### Final Interpretation (Your Own Words)

[Your independent interpretation, informed but not dictated by AI]

### Reflection on AI Assistance

[What AI helped with, what it got wrong, what you figured out independently]
```

## Integration Points

### With AI Usage Policy Document

Main policy: [docs/02-ai-usage-policy.md](../docs/02-ai-usage-policy.md)

Ensure consistency between:

- Notebook AI-use suggestions
- Policy document rules
- Prompt templates
- Assignment requirements

### With Templates

Templates must demonstrate responsible AI use:

- [ai_usage_log_template.md](../templates/ai_usage_log_template.md)
- [method_selection_template.md](../templates/method_selection_template.md)
- [interpretation_template.md](../templates/interpretation_template.md)

### With Prompts

Prompt templates show safe AI interaction patterns:

- Clear, specific questions
- Request for explanation not just answers
- Verification steps included
- Critical evaluation expected

## Validation Checklist

Content demonstrates responsible AI teaching when:

- [ ] Notebooks include explicit AI-use suggestions
- [ ] Suggestions show specific safe prompts
- [ ] Verification reminders are prominent
- [ ] Reflection questions promote critical thinking
- [ ] Prohibited uses are clearly stated
- [ ] Documentation requirements are clear
- [ ] Policy is consistent across all materials
- [ ] Students are empowered, not replaced, by AI
- [ ] Critical thinking is still required
- [ ] Academic integrity is maintained
- [ ] Limitations of AI are acknowledged
- [ ] Synthetic data warnings prevent misuse

## Common Mistakes to Avoid

### ❌ Mistake 1: Vague AI Suggestions

```markdown
# WRONG - Too vague

"You can use AI to help with this section"
```

**Correct**: Provide specific example prompts

### ❌ Mistake 2: No Verification Reminder

```markdown
# WRONG - Missing verification

"Ask AI: [prompt]"
[No reminder to verify]
```

**Correct**: Always include verification steps

### ❌ Mistake 3: AI as Oracle

```markdown
# WRONG - AI as final authority

"Ask AI for the answer to determine which method is correct"
```

**Correct**: "Ask AI for method suggestions, then evaluate options based on your research context"

### ❌ Mistake 4: Ignoring Limitations

```markdown
# WRONG - No limitations mentioned

"AI can help you interpret these results"
```

**Correct**: "AI can help you understand statistical concepts, but may miss domain-specific context"

### ❌ Mistake 5: No Documentation Requirement

```markdown
# WRONG - No accountability

"Feel free to use AI"
[No log or disclosure requirement]
```

**Correct**: "Document AI usage in your log and disclose in final submission"

## Success Criteria

Responsible AI teaching is successful when:

1. **Students understand**: What AI can and cannot do
2. **Students verify**: All AI suggestions before use
3. **Students think critically**: AI informs, doesn't replace thinking
4. **Students document**: Transparent about AI usage
5. **Students learn**: Knowledge retained, not just tasks completed
6. **Academic integrity maintained**: No fabrication, proper attribution
7. **Ethical use**: Aware of AI limitations and biases
8. **Instructor trust**: Clear boundaries, accountable process

## Workflow for Adding AI Guidance

When creating or modifying notebook:

1. **Identify learning objective**: What should students understand?
2. **Define safe AI uses**: How can AI help achieve that objective?
3. **Write specific prompts**: Show exact example prompts
4. **Add verification steps**: How to check AI suggestions
5. **Include reflection**: Critical thinking questions
6. **Link to resources**: Templates, policy, prompt examples
7. **Test prompts**: Ensure example prompts work well
8. **Review for balance**: AI helps but doesn't replace learning

## Resources

- Main policy: [docs/02-ai-usage-policy.md](../docs/02-ai-usage-policy.md)
- Prompt templates: [prompts/](../prompts/)
- Student templates: [templates/](../templates/)
- Project principles: [metpen-ai-lab.md](../metpen-ai-lab.md) § "Responsible AI Usage"
- Agent guidance: [AGENTS.md](../AGENTS.md) § "Responsible AI Usage in This Workspace"

## Philosophical Foundation

**AI is a tool for learning, not a replacement for learning.**

The goal is to graduate students who:

- Know how to use AI effectively
- Understand its limitations
- Think critically about its suggestions
- Use it ethically and transparently
- Have actually learned the material

This requires intentional pedagogy that **harnesses AI's power while preserving learning outcomes**.
