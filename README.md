# /cost-estimate — Claude Code Skill

A custom [Claude Code](https://docs.anthropic.com/en/docs/claude-code) slash command that analyzes any codebase and estimates what it would have cost to build with a traditional human team — no AI, just developers, designers, PMs, and meetings.

Open Claude Code in any project, run `/cost-estimate`, and get a full breakdown of what it would cost to build from scratch — with real market rates, realistic timelines, and team cost projections.

## What It Does

The skill acts as a senior software engineering consultant. It:

1. **Scans your entire codebase** — auto-detects languages, frameworks, and tech stack
2. **Categorizes code by complexity** — from simple CRUD to systems programming, GPU/shader code, ML pipelines, and more
3. **Calculates development hours** — using industry-standard productivity rates for senior developers
4. **Researches current market rates** — searches the web for up-to-date hourly rates for your specific stack
5. **Accounts for real-world overhead** — meetings, code reviews, Slack, context switching, sprint ceremonies
6. **Estimates full team cost** — not just engineering, but PM, design, QA, DevOps, tech writing, and management
7. **Computes Claude ROI** — compares AI-assisted development time and cost vs. traditional human development

### Output Includes

- Lines of code breakdown by language and complexity category
- Base development hours with overhead multipliers (architecture, debugging, testing, etc.)
- Realistic calendar time estimates across company types (startup through enterprise)
- Current market rate research for your stack
- Cost estimates at low/average/high-end rates
- Full team cost projections with role-by-role breakdowns
- Claude ROI analysis: speed multiplier, cost savings, and value per Claude hour

## Installation

Copy the skill into your project's `.claude/skills/` directory:

```
your-project/
  .claude/
    skills/
      cost-estimate/
        SKILL.md
```

Or clone this repo and copy the skill folder:

```bash
git clone https://github.com/jbarbier/claude-code-cost-estimate.git
cp -r claude-code-cost-estimate/.claude/skills/cost-estimate your-project/.claude/skills/
```

To install it globally (available in all projects), place it in your home directory:

```bash
cp -r claude-code-cost-estimate/.claude/skills/cost-estimate ~/.claude/skills/
```

## Usage

Inside Claude Code, simply run:

```
/cost-estimate
```

Claude will analyze the current project and produce a detailed cost report.

## Credit

This skill is an expanded version of the original idea by **Todd Saunders** ([@toddsaunders](https://x.com/toddsaunders) on Twitter/X).

Original post: [https://x.com/toddsaunders/status/2029594318361571497](https://x.com/toddsaunders/status/2029594318361571497?s=20)

## License

MIT
