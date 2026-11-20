# Kiran ♥ Priya Wedding Album

The wedding album website is committed to this repository.

## Publish with GitHub Pages
1. Open **Settings → Pages** in this repository.
2. Under **Build and deployment → Source**, select **GitHub Actions**.
3. The workflow at `.github/workflows/deploy-pages.yml` will publish the site from the `main` branch.
4. The project URL will be: https://yashasdevang17.github.io/Kiran-and-Priya-wedding-album/

## Enable shared uploads and wishes
1. Create a free project at https://supabase.com/.
2. In the Supabase SQL Editor, run `supabase-setup.sql`.
3. In Project Settings → API, copy the Project URL and anon/publishable public key.
4. Replace the two placeholders in `config.js` and commit the file.
5. Never put a Supabase service_role/secret key in browser code.

Until the Supabase URL and public anon key are configured, the page can be hosted but guest photo/video uploads and wishes will remain unavailable.

The upload setup is public-link access with no sign-in or moderation. Only use it for media intended to be publicly visible and downloadable.
