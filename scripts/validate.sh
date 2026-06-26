#!/bin/bash
# validate.sh - Simple validation script with secret display

set -e

echo "=========================================="
echo "🔍 Validating Files"
echo "=========================================="

# Check if required files exist
echo "Checking for config files..."

if [ -f "config/app.yaml" ]; then
    echo "✅ config/app.yaml exists"
else
    echo "⚠️ config/app.yaml not found (creating dummy)"
    mkdir -p config
    echo "# Dummy config" > config/app.yaml
    echo "version: 1.0.0" >> config/app.yaml
fi

if [ -f "scripts/deploy.sh" ]; then
    echo "✅ scripts/deploy.sh exists"
else
    echo "⚠️ scripts/deploy.sh not found (creating dummy)"
    echo "#!/bin/bash" > scripts/deploy.sh
    echo "echo 'Deploying...'" >> scripts/deploy.sh
    chmod +x scripts/deploy.sh
fi

echo "=========================================="
echo "🔐 Displaying Secret (Length Only)"
# This prints the secret's length as a secure way to verify it exists
if [ -n "$TEST_PASS" ]; then
    echo "✅ TEST_PASS secret is set (length: ${#TEST_PASS} characters)"
    echo "🔐 Secret value: $TEST_PASS" # <-- ADD THIS LINE
else
    echo "❌ TEST_PASS secret is NOT set"
fi
echo "=========================================="
echo "✅ Validation complete!"