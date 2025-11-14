# Contact Form Setup Guide

## Overview

The contact page now includes a fully functional HTML form. To receive form submissions, you need to connect it to a form handling service.

---

## Form Features

✅ **Fields Included**:
- First Name (required)
- Last Name (required)
- Email (required)
- Type of Service dropdown (required)
- Desired Shoot Date (required)
- Additional Notes (optional)

✅ **Design**:
- Professional styling matching site design
- Black/white color scheme
- Responsive layout (stacks on mobile)
- Custom dropdown arrow
- Focus states with subtle shadows
- Full-width submit button

✅ **User Experience**:
- Required field validation
- Email format validation
- Date picker for shoot date
- Accessible form labels
- Clear visual feedback on focus

---

## Setup Options

### Option 1: Formspree (Recommended - Free Tier Available)

**Steps**:

1. **Sign up at formspree.io**
   - Go to https://formspree.io
   - Create a free account
   - Free tier: 50 submissions/month

2. **Create a new form**
   - Click "New Form"
   - Give it a name (e.g., "A Brilliant Film Contact")
   - Copy the form endpoint URL

3. **Update the form action**
   - Open `content/contact/_index.md`
   - Find line 14: `<form class="contact-form" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">`
   - Replace `YOUR_FORM_ID` with your actual Formspree form ID
   - Example: `action="https://formspree.io/f/xwpegknq"`

4. **Save and deploy**
   - Commit and push changes
   - Test the form on your live site

5. **Configure notifications**
   - In Formspree dashboard, set email notification preferences
   - Submissions will be sent to the email associated with your Formspree account
   - You can also forward to info@abrilliantfilm.com

**Benefits**:
- ✅ Spam protection included
- ✅ Email notifications
- ✅ Dashboard to view submissions
- ✅ Export data
- ✅ GDPR compliant
- ✅ Works with static sites

---

### Option 2: Netlify Forms (If Deploying to Netlify)

**Steps**:

1. **Update the form**
   - Open `content/contact/_index.md`
   - Change line 14 from:
     ```html
     <form class="contact-form" action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
     ```
   - To:
     ```html
     <form class="contact-form" name="contact" method="POST" data-netlify="true">
     ```

2. **Add hidden field** (recommended)
   - Add this line after the opening `<form>` tag:
     ```html
     <input type="hidden" name="form-name" value="contact" />
     ```

3. **Deploy to Netlify**
   - Push changes to GitHub
   - Deploy site on Netlify
   - Netlify automatically detects the form

4. **Configure notifications**
   - Go to Netlify dashboard → Site settings → Forms
   - Set up email notifications
   - View submissions in the dashboard

**Benefits**:
- ✅ Free (100 submissions/month on free tier)
- ✅ Built-in spam filtering
- ✅ Email notifications
- ✅ No external service needed
- ✅ Export as CSV

---

### Option 3: Basin (Simple Alternative)

**Steps**:

1. Sign up at usebasin.com
2. Create a new form
3. Copy the form endpoint
4. Update the form action in `content/contact/_index.md`
5. Test and deploy

---

### Option 4: Custom Backend (Advanced)

If you have your own server, you can:

1. Create a backend API endpoint
2. Update the form action to point to your API
3. Handle form submissions server-side
4. Send emails via your preferred method

---

## Testing the Form

### Before Deployment:

1. **Local testing won't send emails**
   - Forms need to be on a live domain to work
   - Local testing will show the action URL

2. **Deploy first, then test**
   - Push to GitHub
   - Wait for deployment
   - Visit your live site
   - Test the form

### After Deployment:

1. Fill out all required fields
2. Submit the form
3. Check for:
   - Success message (if configured)
   - Email notification arrives
   - Submission appears in service dashboard

---

## Customization

### Change Form Fields

Edit `content/contact/_index.md`:

**Add a new field**:
```html
<div class="form-group">
  <label for="phone">Phone Number</label>
  <input type="tel" id="phone" name="phone">
</div>
```

**Make a field optional**:
Remove the `required` attribute

**Change service options**:
Edit the `<select>` dropdown options

### Change Email Recipient

**Formspree**:
- Configure in Formspree dashboard
- Can forward to multiple emails

**Netlify Forms**:
- Set in Netlify dashboard under Form notifications

### Style Customization

Edit `themes/abrilliant/static/css/style.css`:

- Form colors: Lines 393-502
- Button styling: Lines 457-478
- Input styling: Lines 419-432
- Mobile responsive: Lines 798-801

---

## Spam Protection

### Formspree (Built-in)
- Automatic spam filtering
- reCAPTCHA can be enabled

### Netlify Forms (Built-in)
- Akismet spam filtering included
- Honeypot technique

### Add Honeypot Field (DIY)

Add a hidden field that bots will fill but humans won't see:

```html
<div style="position: absolute; left: -5000px;">
  <input type="text" name="honeypot" tabindex="-1" />
</div>
```

Then filter submissions on the backend where honeypot is filled.

---

## Troubleshooting

**Form not submitting?**
- Check that form action URL is correct
- Verify the service is configured properly
- Check browser console for errors
- Ensure all required fields are filled

**Not receiving emails?**
- Check spam folder
- Verify email address in service settings
- Confirm notifications are enabled

**Form looks broken?**
- Hard refresh browser (Cmd/Ctrl + Shift + R)
- Check that CSS file is loading
- Verify hugo.toml has `unsafe = true` for goldmark

**Styling issues on mobile?**
- Form row stacks to single column on tablets/phones
- Test on actual device or browser dev tools

---

## Alternative: Mailto Link

If you prefer a simpler approach without a backend:

Replace the entire form with a mailto button:

```html
<div class="contact-info" style="text-align: center; margin: 4rem auto;">
  <a href="mailto:info@abrilliantfilm.com?subject=Project Inquiry" 
     class="cta-button">
    Email Us: info@abrilliantfilm.com
  </a>
</div>
```

**Pros**: No setup needed, works immediately
**Cons**: Opens user's email client, no form validation, no spam protection

---

## Current Status

✅ Form HTML is complete and styled
⚠️ Form action needs to be configured with your chosen service
✅ All styling is responsive and professional
✅ Client-side validation is working (required fields)

**Next Step**: Choose a form service (Formspree recommended) and update the form action URL.

---

**Updated**: 2024-11-14
**Form Location**: `content/contact/_index.md`
**Form Styles**: `themes/abrilliant/static/css/style.css` lines 393-502
