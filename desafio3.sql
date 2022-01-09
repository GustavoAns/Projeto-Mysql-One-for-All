select
usuario,
COUNT(historicos.usuario_id) AS qtde_musicas_ouvidas,
ROUND((SUM(musicas.duracao_segundos)/60),2) AS total_minutos
FROM usuarios
INNER JOIN historicos ON usuarios.usuario_id = historicos.usuario_id
INNER JOIN musicas ON historicos.musica_id = musicas.musica_id
GROUP BY usuario
ORDER BY usuario ASC;