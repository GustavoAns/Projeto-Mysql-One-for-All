SELECT
musica AS nome,
count(plano_id) AS reproducoes
FROM historicos
INNER JOIN musicas ON historicos.musica_id = musicas.musica_id
INNER JOIN usuarios ON historicos.usuario_id = usuarios.usuario_id
WHERE plano_id = 1 OR plano_id = 4
GROUP BY nome
ORDER BY reproducoes DESC, nome;