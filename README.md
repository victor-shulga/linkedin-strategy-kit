# LinkedIn Strategy Kit

Two Claude Code skills — the **foundation layer** of a LinkedIn content system. Set the strategy, then align the profile to it. Both output to Notion, in Ukrainian.

## The two skills

### `/strategy` — LinkedIn strategy as a config
From a person's LinkedIn profile + company site → a **9-section machine-readable strategy** in Notion:

1. Goals, KPI, Commitment
2. ICP + Buyer Persona (3-level JTBD)
3. Enemy + Signature Concept
4. Content pillars *(no quotas)*
5. Offer audit for LinkedIn sellability (4 axes × 8 criteria)
6. Voice Profile *(from real posts)*
7. 6 Viral Levers
8. Distribution Playbook *(2026)*
9. Backstory + values + proof points

It's a **config for the engine, not a client PDF** — sections 4/6/7 are machine-readable and seed an Idea Pool.

### `/profile-audit` — profile as a landing + ranking signal
Audits the current profile against the 2026 optimization framework **and** the strategy above → concrete per-section rewrites (headline, About, skills), a **banner design brief**, a **Featured plan**, and priorities (🔴🟠🟡). Reframes the profile as a **Topic Authority** ranking signal, not just a landing page.

## Install

```
/plugin marketplace add victor-shulga/linkedin-strategy-kit
/plugin install linkedin-strategy-kit@linkedin-strategy-kit
```

or with the Skills CLI:

```
npx skills add victor-shulga/linkedin-strategy-kit
```

## Run

```
/strategy <person-linkedin-url> <company-site-or-linkedin>
/profile-audit <person-linkedin-url>
```

Run `/strategy` first (the profile audit reads the strategy for alignment).

## Reference

- `reference/strategy-template.md` — the 9-section canon + fill rules
- `reference/methodology.md` — viral levers, rhythm, competence strategies, distribution
- `reference/hook-bank.md` — hook rules (for pillar examples)
- `reference/notion-schema.md` — hub + Idea Pool / Weekly Plans / Posts schema
- `reference/profile-optimization.md` — 2026 profile framework (8 sections)

## Validate

```
bash scripts/validate.sh
```

MIT © Victor Shulga

---

Built by [Victor Shulga](https://victorshulga.com), Fractional CRO for B2B service companies. Full skill stack: [victorshulga.com/stack](https://victorshulga.com/stack/).
