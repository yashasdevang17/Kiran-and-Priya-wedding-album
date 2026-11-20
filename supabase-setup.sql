-- Run this entire script in Supabase Dashboard > SQL Editor.
create table if not exists public.wishes (
  id uuid primary key default gen_random_uuid(),
  name text not null default 'Guest' check (char_length(name) <= 40),
  text text not null check (char_length(text) between 1 and 300),
  created_at timestamptz not null default now()
);
create table if not exists public.replies (
  id uuid primary key default gen_random_uuid(),
  wish_id uuid not null references public.wishes(id) on delete cascade,
  name text not null default 'Guest' check (char_length(name) <= 40),
  text text not null check (char_length(text) between 1 and 300),
  created_at timestamptz not null default now()
);
create table if not exists public.likes (
  id uuid primary key default gen_random_uuid(),
  wish_id uuid not null references public.wishes(id) on delete cascade,
  created_at timestamptz not null default now()
);
create table if not exists public.media (
  id uuid primary key default gen_random_uuid(),
  path text not null unique,
  filename text not null,
  kind text not null check (kind in ('image','video')),
  by text not null default 'Guest',
  created_at timestamptz not null default now()
);
alter table public.wishes enable row level security;
alter table public.replies enable row level security;
alter table public.likes enable row level security;
alter table public.media enable row level security;
drop policy if exists "Public can read wishes" on public.wishes;
create policy "Public can read wishes" on public.wishes for select to anon using (true);
drop policy if exists "Anyone can post wishes" on public.wishes;
create policy "Anyone can post wishes" on public.wishes for insert to anon with check (true);
drop policy if exists "Public can read replies" on public.replies;
create policy "Public can read replies" on public.replies for select to anon using (true);
drop policy if exists "Anyone can reply" on public.replies;
create policy "Anyone can reply" on public.replies for insert to anon with check (true);
drop policy if exists "Public can read likes" on public.likes;
create policy "Public can read likes" on public.likes for select to anon using (true);
drop policy if exists "Anyone can like" on public.likes;
create policy "Anyone can like" on public.likes for insert to anon with check (true);
drop policy if exists "Public can read media records" on public.media;
create policy "Public can read media records" on public.media for select to anon using (true);
drop policy if exists "Anyone can add media records" on public.media;
create policy "Anyone can add media records" on public.media for insert to anon with check (true);
-- Create a PUBLIC bucket for guest uploads; max 50 MB per file.
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('wedding-media','wedding-media',true,52428800,array['image/jpeg','image/png','image/webp','image/gif','image/heic','video/mp4','video/quicktime','video/webm','video/3gpp'])
on conflict (id) do update set public=true,file_size_limit=52428800,allowed_mime_types=excluded.allowed_mime_types;
drop policy if exists "Public can view wedding media" on storage.objects;
create policy "Public can view wedding media" on storage.objects for select to anon using (bucket_id='wedding-media');
drop policy if exists "Anyone can upload wedding media" on storage.objects;
create policy "Anyone can upload wedding media" on storage.objects for insert to anon with check (bucket_id='wedding-media');

-- Data API table privileges (RLS policies above still control row access).
grant usage on schema public to anon;
grant select, insert on table public.wishes to anon;
grant select, insert on table public.replies to anon;
grant select, insert on table public.likes to anon;
grant select, insert on table public.media to anon;
