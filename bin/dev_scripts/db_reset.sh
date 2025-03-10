#!/bin/bash
echo "⚠️  Resetting database and regenerating schema.rb..."

# Single command to reset DB, migrate, and seed
rails db:reset db:schema:dump

echo "✅ Database reset complete!"
