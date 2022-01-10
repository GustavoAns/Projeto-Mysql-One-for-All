SELECT
musica AS cancao, count(historicos.musica_id) AS reproducoes
FROM historicos
INNER JOIN musicas ON historicos.musica_id = musicas.musica_id
GROUP BY musica
ORDER BY reproducoes DESC, musica
limit 2;
