SELECT
artista_nome AS artista,
album_nome AS album
FROM artistas
INNER JOIN albuns ON albuns.artista_id = artistas.artista_id
WHERE artista_nome = "Walter Phoenix"
ORDER BY album ASC;
