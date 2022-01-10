SELECT
count(historicos.usuario_id) AS quantidade_musicas_no_historico
FROM usuarios
INNER JOIN historicos ON usuarios.usuario_id = historicos.usuario_id
WHERE usuario = "Bill";
