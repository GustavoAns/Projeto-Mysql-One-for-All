SELECT
min(valor_plano) AS faturamento_minimo,
max(valor_plano) AS faturamento_maximo,
round(avg(valor_plano),2) AS faturamento_medio,
sum(valor_plano) AS faturamento_total
FROM usuarios
INNER JOIN planos ON planos.plano_id = usuarios.plano_id;