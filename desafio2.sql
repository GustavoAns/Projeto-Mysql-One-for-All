SELECT
(SELECT count(musica) from SpotifyClone.musicas) as cancoes,
(SELECT count(artista_id) from SpotifyClone.artistas) as artistas,
(SELECT count(album_id) from SpotifyClone.albuns) as albuns;