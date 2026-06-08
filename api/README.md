# NamKural API

REST API endpoints for the CyberSafe America AI platform.

## Planned Endpoints

| Method | Endpoint                  | Description                        |
|--------|---------------------------|------------------------------------|
| POST   | /api/assessment/submit    | Submit assessment answers          |
| GET    | /api/assessment/{id}      | Retrieve assessment result         |
| POST   | /api/volunteer/register   | Register as volunteer              |
| POST   | /api/contact              | Submit contact form                |
| GET    | /api/stats/national       | Get anonymized national statistics |

All endpoints return JSON. Rate limiting: 60 requests/minute per IP.
Authentication required for admin endpoints via Laravel Sanctum.
