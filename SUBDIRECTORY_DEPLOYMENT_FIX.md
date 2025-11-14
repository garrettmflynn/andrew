# Subdirectory Deployment Fix

## Problem

When deployed to GitHub Pages at `https://garrettflynn.com/andrew/`, images and links were breaking because they were using absolute paths from the domain root (e.g., `/images/...` resolved to `https://garrettflynn.com/images/...` instead of `https://garrettflynn.com/andrew/images/...`).

## Solution Applied

### 1. Updated baseURL

**File**: `hugo.toml`

Changed from:
```toml
baseURL = 'https://www.abrilliantfilm.com/'
```

To:
```toml
baseURL = 'https://garrettflynn.com/andrew/'
```

### 2. Updated Image Paths in Templates

Added Hugo's `relURL` filter to all image references to make them relative to the baseURL:

**Updated Files**:
- `themes/abrilliant/layouts/index.html` - Homepage portfolio grid
- `themes/abrilliant/layouts/_default/list.html` - List page images
- `themes/abrilliant/layouts/portfolio/single.html` - Gallery images

**Change Example**:
```html
<!-- Before -->
<img src="{{ .Params.image }}" alt="{{ .Title }}">

<!-- After -->
<img src="{{ .Params.image | relURL }}" alt="{{ .Title }}">
```

### 3. Updated Internal Links

Changed internal links to use `relURL`:

```html
<!-- Before -->
<a href="/portfolio/">View Portfolio</a>

<!-- After -->
<a href="{{ "portfolio/" | relURL }}">View Portfolio</a>
```

### 4. Updated Menu URLs

**File**: `hugo.toml`

Removed leading slashes from menu URLs:

```toml
# Before
url = '/portfolio/'

# After
url = 'portfolio/'
```

Hugo automatically handles these relative to the baseURL.

### 5. Fixed GitHub Actions Workflow

**File**: `.github/workflows/deploy.yml`

Removed the `--baseURL` flag that was overriding hugo.toml:

```yaml
# Before
run: |
  hugo \
    --gc \
    --minify \
    --baseURL "${{ steps.pages.outputs.base_url }}/"

# After
run: |
  hugo \
    --gc \
    --minify
```

**Critical**: The workflow was overriding the baseURL from hugo.toml, causing images and links to use the wrong path. Removing the flag ensures Hugo uses the baseURL configured in hugo.toml.

---

## For Different Deployment Scenarios

### Deploying to Root Domain

If deploying to `https://www.abrilliantfilm.com/`:

1. Update `hugo.toml`:
```toml
baseURL = 'https://www.abrilliantfilm.com/'
```

2. Rebuild:
```bash
hugo --minify
```

3. Deploy

**No other changes needed** - the `relURL` filters will work correctly.

### Deploying to a Different Subdirectory

If deploying to a different path (e.g., `https://example.com/portfolio-site/`):

1. Update `hugo.toml`:
```toml
baseURL = 'https://example.com/portfolio-site/'
```

2. Rebuild and deploy

### Local Development

For local development, Hugo server automatically handles paths:

```bash
hugo server -D
# Visit http://localhost:1313
```

The `relURL` filter ensures everything works in development mode too.

---

## What `relURL` Does

Hugo's `relURL` function:
- Takes a path like `/images/photo.jpg`
- Makes it relative to the site's baseURL
- Returns the correct path for your deployment

**Examples**:

| baseURL | Input | Output |
|---------|-------|--------|
| `https://example.com/` | `/images/photo.jpg` | `/images/photo.jpg` |
| `https://example.com/subdir/` | `/images/photo.jpg` | `/subdir/images/photo.jpg` |
| `http://localhost:1313/` | `/images/photo.jpg` | `/images/photo.jpg` |

---

## Verification

After deploying, check that:

1. ✅ Homepage portfolio images load
2. ✅ Portfolio detail page gallery images load
3. ✅ Navigation menu links work
4. ✅ "Back to Portfolio" link works
5. ✅ Logo link returns to homepage

---

## GitHub Pages Deployment

Your site is currently configured for:
```
Repository: garrettflynn/andrew-site (or similar)
URL: https://garrettflynn.com/andrew/
```

### GitHub Actions Workflow

The workflow in `.github/workflows/deploy.yml` automatically:
1. Installs Hugo
2. Runs `hugo --minify --baseURL "${{ steps.pages.outputs.base_url }}/"`
3. Deploys to GitHub Pages

The workflow uses the Pages output URL, which should match your `hugo.toml` baseURL.

---

## Image Paths in Content

Portfolio item markdown files use absolute paths from site root:

```yaml
image: "/images/portfolio/placeholder-1.svg"
gallery:
  - "/images/portfolio/photo1.jpg"
  - "/images/portfolio/photo2.jpg"
```

**This is correct** - Hugo's `relURL` filter in the templates converts these to the proper paths during build.

---

## Troubleshooting

**Images still not loading?**

1. Check the browser console for 404 errors
2. Verify the baseURL in `hugo.toml` matches your deployment URL exactly
3. Ensure baseURL ends with a trailing slash
4. Clear browser cache and hard refresh (Cmd/Ctrl + Shift + R)
5. Check that images exist in `static/images/` directory

**Links not working?**

1. Verify menu URLs in `hugo.toml` don't have leading slashes
2. Check that all internal links use `relURL` filter
3. Ensure `.Permalink` is used for content pages (not hardcoded paths)

**Local vs Production differences?**

Make sure you're using:
- `{{ .Params.image | relURL }}` for images
- `{{ .Permalink }}` for page links
- `{{ "path/" | relURL }}` for static paths

---

## Summary of Changes

| File | What Changed | Why |
|------|--------------|-----|
| `hugo.toml` | baseURL updated to subdirectory path | Tells Hugo where site will be deployed |
| `hugo.toml` | Menu URLs remove leading slashes | Makes them relative to baseURL |
| `layouts/index.html` | Added `relURL` to image paths | Converts absolute paths to deployment-relative |
| `layouts/index.html` | Added `relURL` to internal links | Ensures links work in subdirectory |
| `layouts/_default/list.html` | Added `relURL` to images | Same as above |
| `layouts/portfolio/single.html` | Added `relURL` to gallery images and links | Same as above |
| `.github/workflows/deploy.yml` | Removed `--baseURL` flag override | Allows Hugo to use baseURL from hugo.toml |

---

**Fixed**: 2024-11-14
**Deployment**: https://garrettflynn.com/andrew/
**Status**: ✅ Ready for deployment with correct path handling
