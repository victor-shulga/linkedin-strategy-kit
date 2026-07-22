---
name: profile-audit
description: Audit a person LinkedIn profile against the 2026 optimization framework AND their content strategy, then propose concrete rewrites per section plus a banner design brief and a Featured-section plan. Use when the user asks to audit a LinkedIn profile, оптимізувати профіль, аудит профілю, покращити банер / Featured / хедлайн, or prepare a profile to convert visitors.
argument-hint: "<person-linkedin-url> [client]"
---

# Profile Audit — профіль як лендинг + ranking-сигнал

Standalone-тул. Аудитує поточний профіль проти методички
`${CLAUDE_PLUGIN_ROOT}/reference/profile-optimization.md` (2026) **і проти стратегії клієнта**
(якщо є Notion-сторінка стратегії), потім дає конкретні переписи по секціях + бриф банера +
план Featured.

**Вхід:** `$ARGUMENTS` — LinkedIn-профіль людини (+ клієнт). Каденс: раз на старті +
після ребрендів/зміни позиціонування.

## Що тягнемо

1. **Поточний профіль (Apify):** `apimaestro/linkedin-profile-detail` — хедлайн, About, досвід,
   банер-URL, фото, навички; за потреби `apimaestro/linkedin-profile-posts` для top-skills/тем.
   Реюз скіла `29-linkedin-profile-audit` для механічного аудиту, якщо доступний.
2. **Стратегія клієнта (Notion, якщо є):** ICP, value prop, signature concept, офер-драбина,
   voice, факти-патрони — це те, на ЩО профіль має конвертувати. Якщо стратегії нема —
   працюй із сайту/профілю і познач припущення.

## Аудит (по 8 секціях методички)

Для кожної секції: **поточний стан → вердикт (✅/⚠️/❌) → конкретний переписаний варіант**.
Особлива увага:

- **Хедлайн:** 2–3 готові варіанти за формулами методички, з ICP + dream outcome
  і **ключовими словами теми** (Topic Authority / Interest Graph — топік має читатись).
- **About:** переписати перший абзац як хук (signature-фраза + CTA), далі структура
  «зміни ринку → проблеми ЦА → рішення → як виглядає → бенефіти». Дати повний текст, не поради.
- **Банер — design brief** (не картинка тут): 4 блоки (ICP · social proof · what+for whom ·
  dream outcome), бренд-кіт клієнта, 1584×396. Передати у дизайн-крок (Figma/Canva).
- **Featured — план:** 1–2 пункти, прив'язані до офер-драбини (безкоштовне/self-assessment →
  основний офер); що саме викласти (лід-магніт / кейс / proof-скрін).
- **Навички/Рекомендації:** список 20+ навичок під топік для SEO; кому написати по ≥3 рекомендації.

⚠️ **Не радити застаріле:** Creator Mode прибрано (методичка §застаріло) — замість нього
Follow-primary + Newsletter.

## Вихід (Notion)

Сторінка **«👤 {Client} · Profile Audit»**:
- таблиця-аудит 8 секцій (поточне / вердикт / переписаний варіант),
- блок **Банер-бриф** (готовий до передачі в дизайн),
- блок **Featured-план**,
- **пріоритети**: 🔴 must-fix (хедлайн/банер/About-хук) → 🟠 → 🟡,
- короткий summary користувачу.

## Definition of Done

- Усі 8 секцій оцінені; кожна з конкретним переписом (не загальні поради).
- Хедлайн і About подані готовим текстом у голосі клієнта.
- Банер-бриф (4 блоки) і Featured-план прив'язані до стратегії/офер-драбини.
- Жодних застарілих порад (Creator Mode тощо).
- Профіль явно підсилює ОДНУ тему (Topic Authority); сторінка аудиту в Notion створена.
