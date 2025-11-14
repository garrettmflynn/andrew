# Guide: Transferring Images from Your Wix Site

Since your existing site is built on Wix, the images need to be manually downloaded and added to the new Hugo site. Here's how to do it:

## Method 1: Download from Wix Dashboard (Recommended)

1. **Log into your Wix account**
2. **Go to your site's dashboard**
3. **Navigate to "Site Files" or "Media Manager"**
4. **Select all images** you want to use
5. **Download them** to your computer
6. **Organize them** into the folders below

## Method 2: Download from Live Site

1. **Visit your live site** at https://www.abrilliantfilm.com/
2. **Right-click on each image** you want to save
3. **Select "Save Image As..."**
4. **Save to your computer** with a descriptive filename
5. **Repeat for all images**

### Pro Tip: Use Browser DevTools
1. Open your site in Chrome/Firefox
2. Press F12 to open DevTools
3. Go to the "Network" tab
4. Filter by "Images"
5. Reload the page
6. Right-click on any image in the list
7. Select "Open in new tab" and save

## Where to Place Images in Your New Hugo Site

```
static/images/
├── hero/                  # Hero section/banner images
│   └── main-hero.jpg
├── about/                 # About page images
│   └── andrew-photo.jpg
├── portfolio/             # Portfolio project images
│   ├── project-1.jpg
│   ├── project-2.jpg
│   └── project-3.jpg
└── services/              # Service page images (optional)
```

## Image Organization Tips

### File Naming Convention
Use descriptive, lowercase names with hyphens:
- ✅ GOOD: `wedding-video-2024.jpg`, `corporate-event-photography.jpg`
- ❌ BAD: `IMG_1234.jpg`, `DSC0001.jpg`, `Untitled.jpg`

### Recommended Image Sizes

**Hero/Banner Images:**
- Dimensions: 1920x1080px or 2560x1440px
- Format: JPEG
- Quality: 80-90%

**Portfolio Images:**
- Dimensions: 1200x800px or 1600x1200px
- Format: JPEG
- Quality: 80-85%

**Thumbnails:**
- Dimensions: 600x400px
- Format: JPEG
- Quality: 75-80%

## Image Optimization (Important!)

Large images slow down your site. Use these free tools to optimize:

### Online Tools (Easy)
1. **TinyPNG** (https://tinypng.com/) - Drag and drop, automatic compression
2. **Squoosh** (https://squoosh.app/) - Google's image optimizer
3. **ImageOptim Online** (https://imageoptim.com/online)

### Command Line Tools (Advanced)
If you have many images, install ImageMagick:

```bash
# Install on Mac
brew install imagemagick

# Batch resize and optimize
cd static/images/portfolio
for img in *.jpg; do
  convert "$img" -resize 1200x800^ -quality 85 "optimized-$img"
done
```

## Adding Images to Your Content

### In Portfolio Items

Edit any `.md` file in `content/portfolio/`:

```markdown
---
title: "Your Project Name"
image: "/images/portfolio/your-image.jpg"
---

Your content here...

![Additional photo](/images/portfolio/detail-shot.jpg)
```

### In Regular Pages

```markdown
## Section Title

![Description of image](/images/about/team-photo.jpg)

Or use HTML for more control:

<img src="/images/about/studio.jpg" alt="Our studio" style="width: 100%; max-width: 800px;">
```

## Quick Reference: Update These Files

Once you've added your images:

1. **Homepage Hero** - Edit `themes/abrilliant/layouts/index.html` line 2-8 (hero section)
2. **Portfolio Items** - Update `image:` field in each portfolio `.md` file
3. **About Page** - Add images in `content/about/_index.md`

## Creating a Hero Background Image

If you want a photo background instead of the gradient:

1. Add your hero image to `static/images/hero/main-hero.jpg`
2. Edit `themes/abrilliant/static/css/style.css`
3. Find `.hero` (around line 117)
4. Replace this:

```css
.hero {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    /* ... */
}
```

With this:

```css
.hero {
    background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), 
                url('/images/hero/main-hero.jpg') center/cover no-repeat;
    /* ... */
}
```

## Batch Download Script (Advanced)

If you're comfortable with browser automation, you can use this approach:

1. Open browser console on your Wix site (F12)
2. Run this script to get all image URLs:

```javascript
// Get all images
const images = Array.from(document.querySelectorAll('img'));
const urls = images.map(img => img.src).filter(src => src.includes('http'));
console.log(urls.join('\n'));
```

3. Copy the URLs
4. Use wget or curl to download them:

```bash
# Create a file called urls.txt with one URL per line
# Then run:
wget -i urls.txt -P static/images/portfolio/
```

## Need Help?

- For Wix export questions, see: https://support.wix.com/
- For image editing help, try: https://www.canva.com/ (free online tool)
- For bulk image optimization: https://tinypng.com/

---

**Remember:** Web-optimized images should generally be:
- Under 500KB each (preferably under 200KB)
- JPEG format for photos
- PNG format for logos/graphics with transparency
- WebP format for best compression (if you're technical)
