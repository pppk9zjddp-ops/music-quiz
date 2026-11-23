-- Erkennst du den Song? Supabase-Setup
-- Einmal im Supabase-Dashboard unter "SQL Editor" einfügen und auf "Run" klicken.

create table if not exists public.profiles (
  id uuid primary key references auth.users on delete cascade,
  name text check (char_length(name) <= 20),
  photo text check (char_length(photo) <= 80000),
  updated_at timestamptz default now()
);

create table if not exists public.solo_scores (
  id bigint generated always as identity primary key,
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  pts int not null check (pts between 0 and 100000),
  played int check (played between 0 and 100),
  cat text check (char_length(cat) <= 40),
  artist_mode text check (artist_mode in ('none','bonus','required')),
  created_at timestamptz default now()
);
create index if not exists solo_scores_pts on public.solo_scores (pts desc);

alter table public.profiles enable row level security;
alter table public.solo_scores enable row level security;

-- Angemeldete Spieler sehen alle Profile und Scores (für eine gemeinsame Bestenliste)
create policy "profiles lesen" on public.profiles for select to authenticated using (true);
create policy "eigenes Profil anlegen" on public.profiles for insert to authenticated with check (id = auth.uid());
create policy "eigenes Profil ändern" on public.profiles for update to authenticated using (id = auth.uid()) with check (id = auth.uid());

create policy "scores lesen" on public.solo_scores for select to authenticated using (true);
create policy "eigene scores speichern" on public.solo_scores for insert to authenticated with check (user_id = auth.uid());
create policy "eigene scores löschen" on public.solo_scores for delete to authenticated using (user_id = auth.uid());

-- Zugriffsrechte für eingeloggte Nutzer (neue Supabase-Projekte vergeben die nicht mehr automatisch)
grant usage on schema public to authenticated;
grant select, insert, update on public.profiles to authenticated;
grant select, insert, delete on public.solo_scores to authenticated;

-- Feedback: jeder darf schreiben, lesen nur im Supabase-Dashboard
create table if not exists public.feedback (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  kind text not null check (kind in ('idee','feedback','bug')),
  text text not null check (char_length(text) between 3 and 2000),
  contact text check (char_length(contact) <= 100),
  name text check (char_length(name) <= 40),
  user_id uuid references auth.users on delete set null,
  version text, ua text
);
alter table public.feedback enable row level security;
create policy "feedback senden" on public.feedback for insert to anon, authenticated
  with check (user_id is null or user_id = auth.uid());
grant usage on schema public to anon;
grant insert on public.feedback to anon, authenticated;
