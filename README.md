# NamKural — நம் குரல் (Our Voice)

> **Public-Interest Technology for Every American**
> Free digital literacy, cybersecurity education, and AI readiness programs — open source, always.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Status: Active](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Stars](https://img.shields.io/github/stars/namkural/namkural?style=social)]()

---

## What Is NamKural?

**NamKural** (நம் குரல் — *Our Voice* or *Voice of Good*) is a public-interest technology initiative founded by **Saravanan Kirubananthan (Kripa Saravanan)** as an act of giving back to society.

We deliver free, open-source programs that improve:

- **Digital literacy** — helping all Americans navigate the modern web safely
- **Cybersecurity awareness** — practical protection for individuals, small businesses, and nonprofits
- **Technology education** — accessible learning for underserved communities
- **AI readiness** — preparing communities for an AI-powered world

Everything we build is free, open source, and driven by volunteers.

---

## Flagship Initiative: CyberSafe America AI

**CyberSafe America AI** is our first initiative — an AI-powered platform that helps Americans recognize, understand, and protect themselves against cyber threats through free assessments, personalized reports, and open-source education tools.

### Who we serve

| Community | Focus |
|---|---|
| Small businesses | Phishing, ransomware, payment fraud |
| Nonprofits | Donor data protection, volunteer security |
| Seniors | Scam recognition, safe browsing |
| Students | Social media safety, identity protection |
| Immigrants | Language-accessible cyber education |

### Core features

- **Assessment engine** — free, 5-minute cybersecurity health check
- **VAI analysis engine** — AI-powered risk analysis using OpenAI API
- **VCyber Risk Report** — personalized PDF report with actionable recommendations
- **National statistics dashboard** — anonymized, state-level cybersecurity data
- **Quarterly whitepapers** — research publications and policy recommendations

---

## Repository Structure

```
namkural/
├── README.md
├── LICENSE
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
│
├── docs/
│   ├── whitepaper/          # Research publications (PDF)
│   ├── architecture/        # System design diagrams
│   ├── roadmap/             # Project roadmap and milestones
│   └── governance/          # Policies and governance docs
│
├── website/
│   ├── index.php            # Home
│   ├── about.php            # About NamKural
│   ├── mission.php          # Mission statement
│   ├── volunteer.php        # Volunteer sign-up
│   └── contact.php          # Contact the founder
│
├── cybersafe-ai/
│   ├── assessment/          # Multi-step cyber assessment forms
│   ├── ai-engine/           # VAI analysis engine (OpenAI integration)
│   ├── reports/             # VCyber Risk Report PDF generator
│   └── dashboard/           # National statistics dashboard
│
├── database/
│   └── schema.sql           # MySQL 8 schema
│
└── api/                     # REST API endpoints
```

---

## Technology Stack

| Layer | Technology |
|---|---|
| Frontend | HTML5, CSS3, Bootstrap 5, JavaScript |
| Backend | PHP 8.3, Laravel (preferred) or Plain PHP MVC |
| Database | MySQL 8 |
| AI | OpenAI API / Local LLM (Ollama) |
| PDF reports | DomPDF / TCPDF |
| Hosting | Any PHP 8.3 + MySQL 8 compatible host |

---

## Getting Started

### Prerequisites

- PHP 8.3+
- Composer
- MySQL 8+
- Node.js (for front-end assets)
- An OpenAI API key (or a local LLM via Ollama)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/namkural/namkural.git
cd namkural

# 2. Install PHP dependencies
composer install

# 3. Copy environment config and set your values
cp .env.example .env
# Edit .env: set DB_*, OPENAI_API_KEY, MAIL_* values

# 4. Generate application key
php artisan key:generate

# 5. Run database migrations
php artisan migrate

# 6. (Optional) Seed sample data
php artisan db:seed

# 7. Start local development server
php artisan serve
```

The app will be available at `http://localhost:8000`.

### Environment Variables

```env
APP_NAME=NamKural
APP_ENV=local
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=namkural
DB_USERNAME=root
DB_PASSWORD=

OPENAI_API_KEY=sk-...

MAIL_MAILER=smtp
MAIL_HOST=smtp.mailgun.org
MAIL_PORT=587
MAIL_USERNAME=
MAIL_PASSWORD=
MAIL_FROM_ADDRESS=hello@namkural.org
MAIL_FROM_NAME="NamKural"
```

---

## Database Schema

Four core tables power the platform:

```sql
-- Users (admin + registered visitors)
CREATE TABLE users (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(200),
  email        VARCHAR(255),
  role         VARCHAR(50),
  created_at   DATETIME
);

-- Cybersecurity assessments
CREATE TABLE assessments (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  organization_name VARCHAR(255),
  industry          VARCHAR(100),
  score             INT,
  risk_level        VARCHAR(50),
  created_at        DATETIME
);

-- Volunteer network
CREATE TABLE volunteers (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(255),
  email      VARCHAR(255),
  state      VARCHAR(100),
  skills     TEXT,
  created_at DATETIME
);

-- Workshops and events
CREATE TABLE workshops (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  title          VARCHAR(255),
  workshop_date  DATE,
  participants   INT
);
```

See [`database/schema.sql`](database/schema.sql) for the full schema including indexes and foreign keys.

---

## Visitor Journey

```
Visitor → Website → Free Assessment → Cyber Score
    → AI-Generated Report → Recommendations
    → Awareness Campaign → Workshop
    → Volunteer → Cyber Ambassador
```

Every step is free. No account required to take an assessment.

---

## Research & Whitepapers

Our research is published quarterly in [`docs/whitepaper/`](docs/whitepaper/). The inaugural **CyberSafe America AI** whitepaper covers:

1. Executive Summary
2. Cybersecurity Challenges in America
3. Threats Facing Small Businesses, Nonprofits, Seniors, Students, and Immigrants
4. AI-Powered Education Model
5. Risk Assessment Framework
6. Public Awareness Methodology
7. Open Source Platform
8. National Impact Goals
9. Research Findings
10. Future Roadmap

[Download the latest whitepaper →](docs/whitepaper/)

---

## Contributing

NamKural is built by volunteers. We welcome contributions of all kinds:

- Code (features, bug fixes, tests)
- Content (educational materials, translations)
- Design (UI/UX, accessibility improvements)
- Research (cybersecurity data, community outreach)
- Documentation

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a pull request.

### Development workflow

```bash
# Create a feature branch from develop
git checkout -b feature/your-feature-name develop

# Make your changes, commit with a clear message
git commit -m "feat: add phishing detection quiz module"

# Push and open a pull request against develop
git push origin feature/your-feature-name
```

We use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages.

---

## Volunteers Network

NamKural runs entirely on volunteer effort. We are looking for:

- **Cybersecurity professionals** — assessment review, content accuracy
- **Educators** — workshop facilitation, curriculum development
- **Developers** — PHP/Laravel, JavaScript, AI/ML
- **Translators** — Spanish, Tamil, Mandarin, and other languages
- **Community organizers** — outreach to libraries, senior centers, colleges

[Join the Volunteers Network →](https://namkural.org/volunteer)

---

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold a welcoming, inclusive, and respectful community.

---

## License

This project is licensed under the **MIT License** — see [LICENSE](LICENSE) for details.

You are free to use, copy, modify, merge, publish, distribute, sublicense, and sell copies of this software, with attribution.

---

## Contact

**Founder:** Saravanan Kirubananthan (Kripa Saravanan)

- Website: [namkural.org](https://namkural.org)
- GitHub: [@namkural](https://github.com/namkural)
- Contact form: [namkural.org/contact](https://namkural.org/contact)

---

## Acknowledgments

NamKural is an independent public-interest initiative. It is not affiliated with any government agency, political organization, or corporation. It is built in the spirit of giving back — for the people, by volunteers, at no cost.

> *"நம் குரல்"* — Our voice, in service of all.

---

<p align="center">
  Made with care by <strong>Kripa Saravanan</strong> and volunteers across America.<br>
  Free forever. Open always.
</p>
