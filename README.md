# Druid CD Demo

Simple CI/CD pipeline demonstration.

## Pipeline Flow

1. **Push to main** → Triggers GitHub Actions
2. **Validate** → Checks if config files are valid
3. **Deploy** → Simulates deployment

## Local Testing

```bash
./scripts/validate.sh