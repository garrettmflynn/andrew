# Feature Updates - Vimeo Showreel & Photo Galleries

## Summary

Added the Vimeo cinematic showreel embed and created an internal photo gallery system for portfolio items, while restoring the intro and services sections to show the full potential of the site.

---

## 1. Vimeo Showreel Embed

### Implementation

**Location**: Homepage, directly after the hero section

**Features**:
- Responsive video container using 16:9 aspect ratio
- Embedded Vimeo player for "Andrew Brilliant Cinematic Showreel"
- Video ID: 1010122643
- Full screen support enabled
- Auto-pause disabled for seamless viewing

**CSS Styling**:
```css
.video-container {
    position: relative;
    padding-bottom: 56.25%; /* 16:9 aspect ratio */
    height: 0;
    overflow: hidden;
    max-width: 900px;
    margin: 0 auto;
    background: var(--primary-color);
    border: 1px solid var(--border-color);
}
```

**Hero Button**:
- "Showreel - View Below" button links to `#showreel` anchor
- Smooth scroll takes users directly to the video

---

## 2. Restored Sections

### Intro Section
- Positioned after showreel
- Tagline: "Creating Brilliant Visual Stories"
- Brief description of services and approach
- Clean, centered layout

### Services Section
- "What We Offer" heading
- 4 service cards:
  - **Film Production**: Documentaries, narratives, brand films
  - **Videography**: Events, commercials, social media
  - **Photography**: Fashion, portraits, landscapes
  - **Post-Production**: Editing, color grading, sound design
- Each card has hover effects (border changes to black)

### Benefits
- Shows visitors the full range of capabilities
- Maintains parity with original site structure
- Demonstrates what's possible with the new flexible Hugo system
- Better for SEO and discovery

---

## 3. Photo Gallery System

### Portfolio Single Page Layout

**New Template**: `themes/abrilliant/layouts/portfolio/single.html`

- Custom layout specifically for portfolio items
- Displays page content (description, story)
- Shows tight photo grid below content
- "Back to Portfolio" navigation button

### Photo Grid Features

**Tight Grid Layout**:
- Responsive grid: `repeat(auto-fill, minmax(300px, 1fr))`
- 1rem gap between images for tight, gallery-feel
- Square aspect ratio (1:1) for consistency
- Hover effect: images scale 1.05x on hover

**Mobile Responsive**:
- Tablet (768px): 200px minimum columns, 0.75rem gap
- Mobile (480px): 150px minimum columns, 0.5rem gap

**CSS**:
```css
.photo-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 1rem;
    margin-top: 4rem;
}

.photo-grid-item {
    position: relative;
    overflow: hidden;
    background: var(--secondary-color);
    aspect-ratio: 1;
}
```

### Gallery Implementation

**Front Matter Structure**:
```yaml
gallery:
  - "/images/portfolio/image1.jpg"
  - "/images/portfolio/image2.jpg"
  - "/images/portfolio/image3.jpg"
```

**Portfolio Items with Galleries**:

1. **World** (Landscapes)
   - 9 placeholder images
   - Description: Mendocino coast, forests, natural wonders

2. **Faces** (Portraits)
   - 12 placeholder images
   - Description: Graduations, headshots, candid moments

3. **Print + Model** (Fashion)
   - 6 placeholder images
   - Description: Editorial shoots, commercial campaigns

### Internal Navigation

**No External Links**:
- All portfolio items open internal pages
- Users stay on your site
- Better for engagement and SEO

**Back Navigation**:
- Styled button: "← Back to Portfolio"
- Hover effect: fills with black, white text
- Clean, professional appearance

---

## 4. Homepage Flow

**New Structure** (top to bottom):

1. **Hero Section**
   - Tagline, title, location
   - "Showreel - View Below" CTA

2. **Showreel Section** ⭐ NEW
   - Vimeo embed
   - "Cinematic Showreel" heading

3. **Intro Section** ⭐ RESTORED
   - "Creating Brilliant Visual Stories"
   - Service overview

4. **Services Section** ⭐ RESTORED
   - 4 service cards
   - Detailed descriptions

5. **Photo Portfolio**
   - Grid of portfolio categories
   - "View Full Portfolio" link

6. **CTA Section**
   - "Be Brilliant" heading
   - Consultation info
   - "Connect!" button

---

## 5. Technical Implementation

### Files Created/Modified

**New Files**:
- `themes/abrilliant/layouts/portfolio/single.html` - Custom portfolio layout
- `themes/abrilliant/layouts/portfolio/` - Portfolio layouts directory

**Modified Files**:
- `themes/abrilliant/layouts/index.html` - Added showreel, restored sections
- `themes/abrilliant/static/css/style.css` - Video container, photo grid styles
- `content/portfolio/world.md` - Added gallery array
- `content/portfolio/faces.md` - Added gallery array
- `content/portfolio/print-model.md` - Added gallery array

### CSS Additions

**Video Container** (~20 lines):
- Responsive iframe wrapper
- 16:9 aspect ratio maintenance
- Max-width constraint

**Photo Grid** (~60 lines):
- Grid layout styles
- Hover effects
- Navigation button styles
- Responsive breakpoints

---

## 6. How to Use

### Adding a New Portfolio Item with Gallery

1. Create the portfolio item:
```bash
hugo new content/portfolio/my-project.md
```

2. Add front matter with gallery:
```yaml
---
title: "My Project"
date: 2024-11-14
description: "Project description"
image: "/images/portfolio/cover.jpg"
categories: ["Photography"]
draft: false
gallery:
  - "/images/portfolio/my-project/photo1.jpg"
  - "/images/portfolio/my-project/photo2.jpg"
  - "/images/portfolio/my-project/photo3.jpg"
---
```

3. Add your images to `static/images/portfolio/my-project/`

4. Write your content (story, description, etc.)

### Replacing Placeholder Images

For each portfolio item:

1. Add real images to `static/images/portfolio/[category-name]/`
2. Update the `gallery` array in the markdown file
3. Update the cover `image` field
4. Rebuild: `hugo --minify`

---

## 7. Benefits

### Visitor Experience
- ✅ Showreel immediately showcases video work
- ✅ Intro explains what you do
- ✅ Services show full capabilities
- ✅ Photo galleries keep users on your site
- ✅ No external links or redirects
- ✅ Smooth, professional navigation

### Content Management
- ✅ Easy to add new portfolio items
- ✅ Simple gallery array in front matter
- ✅ Flexible - add as many or few images as needed
- ✅ All content stored as markdown (future-proof)

### Technical
- ✅ Fully responsive on all devices
- ✅ Fast loading (static generation)
- ✅ SEO-friendly (internal pages)
- ✅ Accessible (semantic HTML)

### Flexibility
- ✅ Shows what's possible beyond original site
- ✅ Maintains original structure/content
- ✅ Demonstrates new capabilities
- ✅ Easy to customize further

---

## 8. Next Steps

To complete the galleries:

1. **Export images from Wix**:
   - Download all portfolio images
   - Organize by category (World, Faces, Print+Model)

2. **Optimize images**:
   - Resize to appropriate dimensions (1200-2000px wide)
   - Compress to 80-85% quality
   - Use TinyPNG or similar tool

3. **Upload to Hugo**:
   - Place in `static/images/portfolio/[category]/`
   - Update gallery arrays in markdown files
   - Update cover images

4. **Add more categories**:
   - Use `./add-portfolio-item.sh` script
   - Or manually create new markdown files
   - Include gallery arrays

---

**Updated**: 2024-11-14
**Version**: 2.0 - Full Featured Portfolio Site
