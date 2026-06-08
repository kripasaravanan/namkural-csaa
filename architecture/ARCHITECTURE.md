# NamKural — System Architecture

## Overview
LAMP stack: Linux + Apache/Nginx + MySQL 8 + PHP 8.3 (Laravel)

## Components
- website/ — Public HTML pages (Bootstrap 5)
- cybersafe-ai/assessment/ — Multi-step cyber assessment form
- cybersafe-ai/ai-engine/ — OpenAI API integration (VAI engine)
- cybersafe-ai/reports/ — PDF report generation (DomPDF)
- cybersafe-ai/dashboard/ — National statistics (Chart.js)
- api/ — Laravel REST API
- database/ — MySQL 8 schema (4 core tables)

## Data Flow
User fills assessment -> Score computed -> POST to /api/assessment/submit
-> Laravel stores in MySQL -> Calls OpenAI API
-> AI returns risk report JSON -> PDF generated -> Emailed to user
