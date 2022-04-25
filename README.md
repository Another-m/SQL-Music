Схема:
![logo](https://github.com/Another-m/SQL-Music/blob/main/%D0%A1%D1%85%D0%B5%D0%BC%D0%B0%20%D0%91%D0%94-2.png?raw=true)

Код:
```sql
create database music with owner netology_bd;
\q
psql -U netology_bd -d music

create table if not exists performer (id serial primary key, name text not null);
create table if not exists albums(id serial primary key, name text not null, year integer check (year > 1000));
create table if not exists tracks(id serial primary key, name text not null, length integer, id_albums integer not null references albums(id));
create table if not exists genre(id serial primary key, name text not null);
create table if not exists collection(id serial primary key, name text not null, year integer check (year > 1000));
create table if not exists PerformerGenre(id_performer integer not null references performer(id), id_genre integer not null references genre(id), constraint ids primary key (id_performer, id_genre));
create table if not exists PerformerAlbums(id_performer integer not null references performer(id), id_albums integer not null references albums(id), constraint ids1 primary key (id_performer, id_albums));
create table if not exists collectionTracks(id_collection integer not null references collection(id), id_tracks integer not null references tracks(id), constraint ids2 primary key (id_collection, id_tracks))

```
