# CyberSafe America AI — Module

This directory contains the core CyberSafe America AI engine.

## Subdirectories

- `assessment/` — Multi-step assessment form logic and question bank
- `ai-engine/` — VAI analysis engine (OpenAI API integration)
- `reports/` — VCyber Risk Report PDF generation (DomPDF)
- `dashboard/` — National statistics dashboard

## AI Engine

The VAI engine takes an assessment score, profile type, and raw answers,
then calls the OpenAI API with a structured system prompt to generate:
- Risk level classification (low / medium / high)
- Top 3 identified threats
- 5 personalized recommendations
- 30-day action plan

See `ai-engine/README.md` for the system prompt and integration guide.
