SELECT
artista_nome AS artista,
album_nome AS album,
count(follows.artista_id) AS seguidores
FROM albuns
INNER JOIN artistas ON artistas.artista_id = albuns.artista_id
INNER JOIN `follows` ON follows.artista_id = albuns.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista_nome, album;
