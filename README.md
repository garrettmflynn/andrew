# A Brilliant Film - Hugo Website

A professional, flexible Hugo website for A Brilliant Film production company.

## Quick Start

### Running the Development Server

```bash
hugo server -D
```

Then open your browser to `http://localhost:1313`

### Building for Production

```bash
hugo
```

The built site will be in the `public/` directory.

## Site Structure

### Content Organization

- `content/_index.md` - Homepage content
- `content/about/` - About page
- `content/services/` - Services page
- `content/contact/` - Contact page
- `content/portfolio/` - Portfolio items (your work)

### Adding Portfolio Items

Create a new markdown file in `content/portfolio/`:

```bash
hugo new content/portfolio/my-new-project.md
```

Edit the file with your project details:

```markdown
---
title: "Your Project Title"
date: 2024-11-14
description: "Brief description of the project"
image: "/images/portfolio/your-image.jpg"
categories: ["Documentary", "Film"]
draft: false
---

Your project content here...
```

### Adding Images

1. Place images in `static/images/`
2. Reference them in content using `/images/filename.jpg`
3. For portfolio items, create a subfolder: `static/images/portfolio/`

### Customization

#### Update Site Information

Edit `hugo.toml`:

- `title` - Your site title
- `baseURL` - Your domain
- `params.email` - Contact email
- `params.social` - Add your social media links

#### Update Colors and Styling

Edit `themes/abrilliant/static/css/style.css`:

Look for the `:root` section to change color scheme:

```css
:root {
    --primary-color: #1a1a1a;
    --accent-color: #d4a574;
    /* etc. */
}
```

#### Navigation Menu

Edit the `[menu]` section in `hugo.toml` to add/remove/reorder menu items.

## Key Features

- ✅ Fully responsive design
- ✅ Mobile-friendly navigation
- ✅ Portfolio showcase system
- ✅ SEO-friendly structure
- ✅ Fast loading times
- ✅ Easy to customize
- ✅ Clean, professional design

## Customizing Pages

All page content is in markdown format. Edit the `.md` files in the `content/` directory to update:

- **About**: `content/about/_index.md`
- **Services**: `content/services/_index.md`
- **Contact**: `content/contact/_index.md`

## Theme Structure

The custom theme is in `themes/abrilliant/`:

- `layouts/` - HTML templates
- `static/css/` - Stylesheets
- `static/js/` - JavaScript
- `static/images/` - Theme images

## Deployment

### Deploy to Netlify

1. Push your code to GitHub
2. Connect your repository to Netlify
3. Build command: `hugo`
4. Publish directory: `public`

### Deploy to Vercel

1. Push your code to GitHub
2. Import project in Vercel
3. Framework preset: Hugo
4. Build command: `hugo`
5. Output directory: `public`

### Deploy to GitHub Pages

1. Update `baseURL` in `hugo.toml` to your GitHub Pages URL
2. Run `hugo` to build
3. Push the `public/` directory to your `gh-pages` branch

## Adding Real Content

1. **Replace sample portfolio items** with your actual projects
2. **Add your images** to `static/images/portfolio/`
3. **Update About page** with your real story
4. **Update Contact information** in both `hugo.toml` and `content/contact/_index.md`
5. **Add social media links** in `hugo.toml`
6. **Customize colors** in the CSS to match your brand

## Support

For Hugo documentation, visit: https://gohugo.io/documentation/

## License

This website template is free to use and modify for A Brilliant Film.
