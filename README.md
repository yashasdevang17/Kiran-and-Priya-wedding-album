# Kiran ♥ Priya Wedding Album — Free deployment

This is a static GitHub Pages site with Supabase for shared photo/video storage and wishes. The original design and embedded couple photo are retained.

## 1. Create the free Supabase backend
1. Create a project at https://supabase.com/ (Free plan).
2. Open **SQL Editor** → **New query**, paste `supabase-setup.sql`, and run it. This creates the tables, public-read/guest-write policies, and public media bucket.
3. Open **Project Settings → API**. Copy the Project URL and the `anon` / publishable public key.
4. Edit `config.js` and replace `YOUR_SUPABASE_PROJECT_URL` and `YOUR_SUPABASE_ANON_KEY`. Do not use a `service_role` or secret key in browser code.

## 2. Publish free on GitHub Pages
1. Create/sign in to https://github.com/ and create a **Public** repository, e.g. `kiran-priya-wedding`.
2. Upload `index.html` and `config.js` to the repository root. (You may also upload this README and SQL file.)
3. In repository **Settings → Pages**, under **Build and deployment**, choose **Deploy from a branch**, branch `main`, folder `/ (root)`, then Save.
4. Wait for GitHub Pages to publish. The public URL will be `https://YOUR-GITHUB-USERNAME.github.io/kiran-priya-wedding/`. Share that link.

## Features
- Public live photo/video gallery; upload, view, and download.
- Guest wishes, replies, and hearts.
- Responsive layout and original hero image.
- Maximum upload size is 50 MB per file in this free setup.

## Important free-tier and privacy notes
- GitHub Pages is static hosting; Supabase stores visitor uploads and messages.
- Supabase Free currently includes 1 GB file storage and a limited monthly transfer allowance; large wedding videos can use it up quickly. Free projects may pause after a week of inactivity. Check current limits before the event.
- This setup intentionally allows anyone with the link to read, upload, and post. It has no sign-in or moderation. Do not upload private/sensitive media. Anyone can share the public URL, and public media can be downloaded. For stronger protection, add an upload approval/moderation step or a guest passcode before sharing widely.
- The website is not published until the Supabase configuration and GitHub Pages steps above are completed.