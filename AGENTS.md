# LibOps Documentation Philosophy

This file defines the writing standards for LibOps documentation and the public website. Use it for changes under the docs root and `www/`.

## Core Mission

LibOps helps GLAM institutions (Galleries, Libraries, Archives, and Museums), colleges, and universities in the United States and Canada adopt and operate open-source software sustainably. The docs should present LibOps as a practical, secure, professionally managed platform for cultural heritage, scholarly publishing, and academic web applications.

## The Three Audiences

Every page should be written for one or more of these audiences:

1. **Deans & Directors**
   - Focus: strategic value, security posture, sustainable open-source adoption, institutional risk, and staffing model.
   - Tone: authoritative, professional, and outcome-oriented. Explain why LibOps is a mature institutional choice without burying the reader in implementation detail.
2. **Librarians & Site Managers**
   - Focus: Dashboard and Slack workflows, plain-language enhancement requests, preview review, site launch, and keeping sites secure without DevOps expertise.
   - Tone: approachable, direct, and clear.
3. **Technical Staff**
   - Focus: API access, `sitectl`, local development parity, Docker Compose as the production workload, GitHub pull requests, and standardized repo patterns.
   - Tone: technically precise, high-signal, and transparent.

## Key Philosophies

- **Operational Knowledge in Tools:** LibOps puts best practices into tools, templates, and workflows so institutions are not blocked by informal runbooks.
- **AI-Assisted Work With Human Review:** The **LibOps Task Agent** is a collaborative tool. AI-generated work must be staged in preview environments and reviewed through GitHub pull requests before production.
- **Local-to-Production Parity:** Local development should match production. First-class templates run with Docker Compose and expose consistent repo-level lifecycle commands.
- **Technical Integrity:** The writing must be accurate enough for technical peers outside the library sector. Avoid sales gloss when a concrete technical description is clearer.

## Product Emphasis

- On the public `www` site, sell `sitectl` as the operator-facing story: one CLI for local and remote Compose contexts, logs, rollouts, port forwarding, and app plugins.
- Keep Make targets primarily in technical docs, template docs, CLI docs, and engineer-facing pages. There, the consistency of `build`, `up`, `lint`, `test`, and `rollout` is a developer selling point.
- Present Docker Compose as the workload contract from laptop to production. Present `sitectl` as the daily interface for operators.

## Standards and Branding

- Official feature name: **LibOps Task Agent**.
- Use the `wand-magic-sparkles` icon for LibOps Task Agent cards and links.
- Reuse `snippets/task-agent.mdx` when describing the AI-assisted development workflow.
- Use the standard GLAM definition: Galleries, Libraries, Archives, and Museums.
- The current platform serves GLAM institutions, colleges, and universities in the United States and Canada. Do not use older copy that limits the audience to GLAM-only or says "North America" when the intended scope is the United States and Canada.
- Do not link generated admin or internal API reference pages, including `Admin*Service` endpoints, from the public API sidebar unless the user explicitly asks to expose them.
- Audience sells:
  - Decision makers: one platform that lets technical and non-technical staff work safely around open-source applications.
  - Site managers: manage and secure sites through the Dashboard and Slack without DevOps expertise.
  - Engineers: API, `sitectl`, GitHub review, and one Docker Compose workload from laptop to production.

## Writing Style

- Write concise, direct prose. Prefer specific nouns and verbs over broad claims.
- Keep the voice professional, natural, and concrete. The docs should sound edited by a human who understands the product.
- Avoid AI-writing tells when they stack up: "delve", "leverage" as a verb, "utilize", "robust", "streamline", "harness", "unlock", "seamless", "effortless", "transform", "game-changing", "cutting-edge", "quietly", "deeply", "fundamentally", "remarkably", and "arguably".
- Avoid signposted conclusions such as "In conclusion", "To sum up", and "In summary".
- Avoid padded contrast formulas such as "not just X, but Y" unless the distinction is technically useful.
- Avoid one-point dilution. Make the point once, then add new information or move on.
- Prefer concrete workflow language: "opens a pull request", "deploys a preview", "stores secrets in Vault", "runs `sitectl compose logs`".
- Keep navigation grouped by persona in `docs.json`.
