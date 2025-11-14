# Getting Started with Your New Hugo Website

## What's Been Created

A complete, professional Hugo website for A Brilliant Film with:

### Site Structure
- **Homepage** - Dynamic landing page with hero section, services preview, and portfolio highlights
- **About Page** - Tell Andrew's story and company mission
- **Services Page** - Detailed breakdown of film, video, and photography services
- **Portfolio Section** - Showcase projects with sample items included
- **Contact Page** - Contact information and FAQ section

### Design Features
- Modern, clean, professional design
- Fully responsive (mobile, tablet, desktop)
- Fast loading and SEO-friendly
- Easy-to-customize color scheme
- Smooth animations and transitions
- Mobile-friendly navigation menu

## Quick Commands

### Start Development Server
```bash
hugo server -D
```
Then visit: http://localhost:1313

### Build for Production
```bash
hugo --minify
```
Output will be in the `public/` directory

### Create New Portfolio Item
```bash
hugo new content/portfolio/project-name.md
```

## First Steps to Customize

### 1. Update Site Configuration
Edit `hugo.toml`:
- Change email address
- Add social media links (Instagram, Vimeo, YouTube, LinkedIn)
- Update site description

### 2. Add Real Content
- Replace the About page text with Andrew's actual story
- Update Services page with specific offerings
- Update Contact page with real contact details
- Delete sample portfolio items and add real projects

### 3. Add Images
- Create folders: `static/images/portfolio/`, `static/images/about/`, etc.
- Add project images
- Reference them in markdown: `![Alt text](/images/portfolio/photo.jpg)`

### 4. Customize Colors (Optional)
Edit `themes/abrilliant/static/css/style.css`

Find the `:root` section (around line 13):
```css
:root {
    --primary-color: #1a1a1a;      /* Main dark color */
    --secondary-color: #f4f4f4;    /* Light gray background */
    --accent-color: #d4a574;       /* Gold accent color */
    --text-color: #333;            /* Body text color */
    --text-light: #666;            /* Secondary text color */
    --white: #ffffff;              /* White */
}
```

Change these hex codes to your preferred colors.

## File Organization

```
andrew-site/
├── content/                 # All page content (Markdown files)
│   ├── _index.md           # Homepage content
│   ├── about/              # About page
│   ├── services/           # Services page
│   ├── contact/            # Contact page
│   └── portfolio/          # Portfolio items
├── static/                  # Static assets (images, etc.)
│   └── images/             # Place all images here
├── themes/abrilliant/      # Custom theme
│   ├── layouts/            # HTML templates
│   └── static/             # CSS and JavaScript
├── hugo.toml               # Site configuration
└── README.md               # Documentation
```

## Adding a New Portfolio Project

1. Create a new markdown file:
```bash
hugo new content/portfolio/my-project.md
```

2. Edit the file with your project details:
```markdown
---
title: "My Amazing Project"
date: 2024-11-14
description: "Brief project description"
image: "/images/portfolio/my-project-cover.jpg"
categories: ["Documentary", "Film"]
draft: false
---

## Project Overview

Your project details here...

### What We Did
- List your accomplishments
- Technical details
- Creative approach

Add as much detail as you want!
```

3. Add project images to `static/images/portfolio/`

4. The project will automatically appear in the portfolio grid!

## Deployment Options

### Option 1: Netlify (Recommended - Free)
1. Push code to GitHub
2. Sign up at netlify.com
3. Connect your GitHub repository
4. Build command: `hugo --minify`
5. Publish directory: `public`
6. Deploy!

### Option 2: Vercel (Also Free)
1. Push code to GitHub
2. Sign up at vercel.com
3. Import your repository
4. Framework: Hugo
5. Deploy!

### Option 3: GitHub Pages
1. Build the site: `hugo --minify`
2. Push the `public/` folder to a `gh-pages` branch
3. Enable GitHub Pages in repository settings

## Tips for Success

1. **Add real images** - The site will look much better with actual photography and videography work
2. **Write compelling descriptions** - Tell the story behind each project
3. **Keep it updated** - Regularly add new portfolio items
4. **Test on mobile** - Make sure it looks good on phones and tablets
5. **Optimize images** - Compress images before uploading for faster loading

## Need Help?

- Hugo Documentation: https://gohugo.io/documentation/
- Check the README.md for more detailed information
- All layouts are in `themes/abrilliant/layouts/` if you want to customize HTML structure

## What Makes This Site Flexible

Unlike the previous Wix site, this Hugo site gives you:

- **Full control** over design, structure, and content
- **No monthly fees** - host for free on Netlify/Vercel/GitHub Pages
- **Version control** - track all changes with Git
- **Fast performance** - static site generation means lightning-fast loading
- **Easy updates** - just edit markdown files
- **Portable** - your content isn't locked into a platform
- **Customizable** - modify any aspect of the design or functionality

Enjoy your new website!

## Setting Up GitHub Pages Deployment

A GitHub Actions workflow has been created to automatically deploy your site to GitHub Pages whenever you push changes.

### Setup Steps:

1. **Push your code to GitHub**:
```bash
git add .
git commit -m "Initial commit"
git push origin main
```

2. **Enable GitHub Pages in your repository**:
   - Go to your repository on GitHub
   - Click "Settings" → "Pages"
   - Under "Source", select "GitHub Actions"
   - The workflow will automatically run and deploy your site

3. **Update your baseURL**:
   - After deployment, note your GitHub Pages URL (e.g., `https://username.github.io/repo-name/`)
   - Update `baseURL` in `hugo.toml` to match your GitHub Pages URL
   - Commit and push the change

4. **Access your site**:
   - Your site will be available at the GitHub Pages URL
   - The workflow runs automatically on every push to the `main` branch

### Workflow Details:

The workflow (`.github/workflows/deploy.yml`) will:
- Install Hugo
- Build your site with `hugo --minify`
- Deploy to GitHub Pages
- Run automatically on every push to `main` branch
- Can also be triggered manually from the Actions tab

### Troubleshooting:

- If deployment fails, check the "Actions" tab in your GitHub repository
- Make sure GitHub Pages is enabled in repository settings
- Ensure the repository is public (or you have GitHub Pro for private repo Pages)
