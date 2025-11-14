# A Brilliant Film - Hugo Website

This is a custom Hugo website for A Brilliant Film, a film production, photography, and videography company.

## Project Overview

**Technology**: Hugo (v0.125.0+) static site generator
**Theme**: Custom theme (`abrilliant`) built specifically for this project
**Deployment**: GitHub Pages via GitHub Actions workflow
**Purpose**: Flexible, customizable portfolio website for film/photo/video work

## Project Structure

```
andrew-site/
├── content/              # All page content in Markdown
│   ├── _index.md        # Homepage content
│   ├── about/           # About page
│   ├── services/        # Services offered
│   ├── contact/         # Contact information
│   └── portfolio/       # Portfolio items (projects/work)
├── static/              # Static assets (images, files)
│   └── images/          # All images organized by purpose
│       ├── portfolio/   # Project images
│       ├── hero/        # Hero/banner images
│       └── about/       # About page images
├── themes/abrilliant/   # Custom theme
│   ├── layouts/         # HTML templates
│   │   ├── _default/    # Default layouts
│   │   ├── partials/    # Reusable components (header, footer)
│   │   └── index.html   # Homepage template
│   └── static/          # Theme assets
│       ├── css/         # Stylesheets
│       └── js/          # JavaScript
├── hugo.toml            # Site configuration
└── .github/workflows/   # CI/CD automation
```

## Coding Conventions

### Content (Markdown)

**Front Matter Format**:
```yaml
---
title: "Project Title"
date: 2024-11-14
description: "Brief description for SEO and listings"
image: "/images/portfolio/image-name.jpg"
categories: ["Category1", "Category2"]
draft: false
---
```

**Naming Convention**:
- Files: lowercase with hyphens (e.g., `my-project.md`)
- Images: descriptive lowercase with hyphens (e.g., `wedding-video-2024.jpg`)
- NO generic names like `IMG_1234.jpg` or `Untitled.jpg`

### HTML Templates

**Location**: `themes/abrilliant/layouts/`

**Key Templates**:
- `baseof.html` - Base template (every page uses this)
- `index.html` - Homepage layout
- `_default/single.html` - Single page template
- `_default/list.html` - List/section pages (portfolio, etc.)
- `partials/header.html` - Site header/navigation
- `partials/footer.html` - Site footer

**Template Conventions**:
- Use semantic HTML5 elements (`<header>`, `<main>`, `<section>`, `<article>`)
- Add descriptive class names (e.g., `hero-content`, `portfolio-grid`)
- Keep templates modular using partials
- Use Hugo's built-in functions: `.Site.`, `.Page.`, `range`, `with`

### CSS Styling

**Location**: `themes/abrilliant/static/css/style.css`

**Architecture**:
1. CSS Variables (`:root`) - All colors and spacing defined here
2. Reset/Base styles
3. Component styles (header, footer, buttons, etc.)
4. Page-specific styles
5. Responsive media queries at the end

**Conventions**:
- Mobile-first responsive design
- Use CSS variables for colors: `var(--primary-color)`
- BEM-like naming: `.component-element` or `.component--modifier`
- Group related styles together
- Comment major sections

**Color Scheme**:
- Professional black/white/gray palette
- Minimal accent colors
- High contrast for readability

### JavaScript

**Location**: `themes/abrilliant/static/js/main.js`

**Purpose**:
- Mobile menu toggle
- Smooth scrolling
- Progressive enhancement only

**Conventions**:
- Vanilla JavaScript (no jQuery)
- Use `addEventListener` for events
- Check if elements exist before manipulating
- Keep it minimal - Hugo does the heavy lifting

### Configuration

**File**: `hugo.toml`

**Key Settings**:
- `baseURL` - Must match deployment URL
- `[params]` - Custom parameters (email, social links)
- `[menu.main]` - Navigation menu items
- `theme = 'abrilliant'` - Points to custom theme

**Important**: Update `baseURL` after initial GitHub Pages deployment

## Common Tasks

### Adding a Portfolio Item

**Method 1 - Interactive Script**:
```bash
./add-portfolio-item.sh
```

**Method 2 - Hugo CLI**:
```bash
hugo new content/portfolio/project-name.md
```

**Method 3 - Manual**:
1. Create file in `content/portfolio/`
2. Add front matter with title, date, description, image
3. Write content in Markdown
4. Add image to `static/images/portfolio/`

### Modifying Navigation Menu

Edit `hugo.toml` → `[menu]` section:
```toml
[[menu.main]]
  name = 'Menu Item'
  url = '/path/'
  weight = 1  # Controls order
```

### Changing Colors

Edit `themes/abrilliant/static/css/style.css` → `:root` section (lines ~13-20):
```css
:root {
    --primary-color: #000000;
    --accent-color: #333333;
    /* etc. */
}
```

### Updating Contact Info

1. Email: `hugo.toml` → `params.email`
2. Social links: `hugo.toml` → `params.social`
3. Contact page content: `content/contact/_index.md`

### Adding Images

1. Place image in appropriate `static/images/` subfolder
2. Reference in Markdown: `![Alt text](/images/folder/image.jpg)`
3. Or in front matter: `image: "/images/portfolio/photo.jpg"`
4. Optimize images before adding (see IMAGES_GUIDE.md)

## Development Workflow

```bash
# 1. Start development server
hugo server -D

# 2. Make changes to content/templates/styles
# 3. View changes at http://localhost:1313
# 4. When satisfied, build for production
hugo --minify

# 5. Commit and push (triggers auto-deployment)
git add .
git commit -m "Description of changes"
git push origin main
```

## Deployment

**Automatic**: GitHub Actions workflow deploys on every push to `main`

**Workflow**: `.github/workflows/deploy.yml`
- Installs Hugo
- Builds site with `hugo --minify`
- Deploys to GitHub Pages

**Manual Deploy**:
```bash
hugo --minify
# Upload contents of public/ to web server
```

## Best Practices

### Content
- Write descriptive, SEO-friendly titles and descriptions
- Use proper heading hierarchy (h1 → h2 → h3)
- Optimize images before uploading (< 200KB each)
- Add alt text to all images
- Keep portfolio descriptions concise but informative

### Code
- Test responsive design on mobile/tablet/desktop
- Validate HTML (https://validator.w3.org/)
- Keep templates DRY (Don't Repeat Yourself)
- Comment complex Hugo template logic
- Use semantic HTML elements

### Performance
- Optimize images (TinyPNG, Squoosh)
- Use Hugo's minification (`hugo --minify`)
- Lazy load images for long pages
- Keep JavaScript minimal

### Git
- Write descriptive commit messages
- Commit related changes together
- Test locally before pushing
- Use `.gitignore` to exclude build artifacts

## Troubleshooting

**Site not building?**
- Check Hugo version: `hugo version` (need v0.100.0+)
- Look for errors in terminal output
- Verify `hugo.toml` syntax
- Check front matter in content files

**Images not showing?**
- Ensure path starts with `/` (e.g., `/images/photo.jpg`)
- Verify image exists in `static/images/`
- Check for typos in filename
- Run `hugo server` and check console for 404s

**Styles not updating?**
- Hard refresh browser (Cmd/Ctrl + Shift + R)
- Clear browser cache
- Verify CSS file path in `baseof.html`
- Check for CSS syntax errors

**GitHub Pages not deploying?**
- Check Actions tab for workflow errors
- Ensure GitHub Pages is enabled in repo settings
- Verify `baseURL` in `hugo.toml` matches Pages URL
- Check workflow permissions (needs write access)

## Quick Reference

```bash
# Development
hugo server -D              # Start dev server with drafts
hugo server --bind=0.0.0.0  # Allow network access

# Content
hugo new content/portfolio/project.md  # New portfolio item
hugo new content/page.md               # New regular page

# Building
hugo                        # Build site
hugo --minify              # Build and minify
hugo --buildDrafts         # Include draft content

# Cleaning
rm -rf public/             # Remove built files
rm .hugo_build.lock        # Remove build lock

# Help
hugo help                  # General help
hugo server --help         # Server options
```

---

**Last Updated**: 2024-11-14
**Hugo Version**: v0.125.0
**Theme Version**: 1.0 (custom)
