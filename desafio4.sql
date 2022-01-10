SELECT
usuario,
IF(max(YEAR(data_reproducao) = '2021'), 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM usuarios
INNER JOIN historicos ON usuarios.usuario_id = historicos.usuario_id
GROUP BY usuario
ORDER BY usuario ASC;
