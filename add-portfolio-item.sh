#!/bin/bash

# Script to quickly add a new portfolio item with image

echo "=== Add New Portfolio Item ==="
echo ""

# Get project title
read -p "Project title: " title

# Get project date (default to today)
read -p "Date (YYYY-MM-DD, default today): " date
if [ -z "$date" ]; then
    date=$(date +%Y-%m-%d)
fi

# Get description
read -p "Brief description: " description

# Get categories
echo "Select category (can add more later):"
echo "1) Documentary"
echo "2) Commercial"
echo "3) Event"
echo "4) Music Video"
echo "5) Photography"
read -p "Choose (1-5): " cat_choice

case $cat_choice in
    1) categories='["Documentary", "Film"]';;
    2) categories='["Commercial", "Video"]';;
    3) categories='["Event", "Photography"]';;
    4) categories='["Music Video", "Video"]';;
    5) categories='["Photography"]';;
    *) categories='["Film"]';;
esac

# Create filename from title
filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

# Get image path
read -p "Image filename (in static/images/portfolio/): " image_name
if [ -z "$image_name" ]; then
    image_path="/images/portfolio/placeholder-1.svg"
else
    image_path="/images/portfolio/$image_name"
fi

# Create the markdown file
cat > "content/portfolio/$filename.md" << MDEOF
---
title: "$title"
date: $date
description: "$description"
image: "$image_path"
categories: $categories
draft: false
---

## $title

$description

### Project Details

- **Duration**: 
- **Format**: 
- **Role**: 
- **Year**: $(date +%Y)

### About the Project

[Add your project description here]

### Production Notes

- 
- 
- 

MDEOF

echo ""
echo "✅ Created: content/portfolio/$filename.md"
echo ""
echo "Next steps:"
echo "1. Edit content/portfolio/$filename.md to add more details"
echo "2. Add your image to static/images/portfolio/$image_name"
echo "3. Run 'hugo server -D' to preview"
