# Quick Start Guide

## 🚀 Deploy to GitHub Pages NOW

```bash
# 1. Add all files to git
git add .

# 2. Commit
git commit -m "Add showreel embed and photo gallery features"

# 3. Push to GitHub
git push origin main

# 4. Enable GitHub Pages
# Go to: Repository Settings → Pages → Source: "GitHub Actions"

# 5. Watch it deploy!
# Go to: Actions tab → Watch the workflow run
```

Your site will be live in ~2 minutes!

## 📝 Preview Locally First

```bash
hugo server -D
```

Visit: http://localhost:1313

## 🎬 What's New

### Vimeo Showreel
- Embedded on homepage after hero section
- Fully responsive video player
- Direct link from hero button

### Photo Galleries
- Click any portfolio item to see full photo grid
- Tight, gallery-style layout
- Internal pages (no external links)
- Responsive on all devices

### Restored Sections
- Intro section explaining your work
- Services section showing all capabilities
- Demonstrates full potential of the site

## 📸 Adding Your Images

### Quick Method:
1. Download images from your Wix site (see IMAGES_GUIDE.md)
2. Place in `static/images/portfolio/[category-name]/`
3. Update the `gallery` array in portfolio markdown files

### Example:
```markdown
---
title: "World"
gallery:
  - "/images/portfolio/world/beach.jpg"
  - "/images/portfolio/world/forest.jpg"
  - "/images/portfolio/world/sunset.jpg"
---
```

## ➕ Add New Portfolio Project

```bash
./add-portfolio-item.sh
```

Or manually:
```bash
hugo new content/portfolio/project-name.md
```

Then add gallery images:
```yaml
gallery:
  - "/images/portfolio/project/img1.jpg"
  - "/images/portfolio/project/img2.jpg"
```

## 🎨 Customize

### Colors:
Edit `themes/abrilliant/static/css/style.css` → lines 9-20 (`:root` section)

### Contact Email:
Edit `hugo.toml` → line 11

### Social Media:
Edit `hugo.toml` → lines 17-20

### Showreel Video:
Edit `themes/abrilliant/layouts/index.html` → line 15 (change Vimeo ID)

## 📚 Full Documentation

- **FEATURE_UPDATES.md** - Showreel and gallery system details
- **CONTENT_UPDATES.md** - Content changes to match original site
- **STYLING_NOTES.md** - Design and typography details
- **DEPLOYMENT_SUMMARY.md** - Complete deployment guide
- **IMAGES_GUIDE.md** - How to transfer images from Wix
- **GETTING_STARTED.md** - Detailed customization guide
- **README.md** - Technical documentation

## ⚡ Common Commands

```bash
# Start development server
hugo server -D

# Build for production
hugo --minify

# Create new portfolio item
./add-portfolio-item.sh

# Push changes (triggers auto-deploy)
git add .
git commit -m "Update site"
git push
```

## 🎯 What You Have Now

✅ Vimeo showreel embed on homepage
✅ Internal photo galleries for portfolio items
✅ Intro and services sections showcasing capabilities
✅ Responsive on all devices
✅ Professional black/white design
✅ Excellent text spacing and typography
✅ GitHub Actions auto-deployment
✅ Full flexibility to customize

## 📝 Next Steps

1. **Deploy to GitHub Pages** (see commands above)
2. **Add real images** to replace placeholders
3. **Update About page** with final bio text
4. **Add social media links** in hugo.toml
5. **Customize colors** if desired

That's it! Your site showcases both the original content AND demonstrates what's possible with the new flexible Hugo system.

---

## 🔧 Important: Deployment URL

**Current Configuration**: Site is configured for `https://garrettflynn.com/andrew/`

### To deploy to the final domain (abrilliantfilm.com):

1. Update `hugo.toml`:
```toml
baseURL = 'https://www.abrilliantfilm.com/'
```

2. Rebuild:
```bash
hugo --minify
```

3. Deploy to your production server or GitHub Pages

All images and links will automatically adjust thanks to the `relURL` filters in the templates.

See **SUBDIRECTORY_DEPLOYMENT_FIX.md** for complete details.
