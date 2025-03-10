#!/bin/bash
echo "🚀 Restarting Rails server, rebuilding Tailwind, and clearing tmp cache..."

# Restart Rails
rails restart

# Rebuild Tailwind CSS
rails tailwindcss:build

# Clear temp cache
rails tmp:cache:clear

echo "✅ Tailwind rebuild complete!"
