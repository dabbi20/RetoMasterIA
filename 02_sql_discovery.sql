-- =========================================
-- Q1 - SELECT DISTINCT
-- Productos únicos disponibles
-- =========================================

SELECT DISTINCT producto AS producto_unico
FROM ventas;


-- =========================================
-- Q2 - WHERE + BETWEEN
-- Pedidos del primer trimestre con cantidad > 5
-- =========================================

SELECT *
FROM ventas
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31'
  AND cantidad > 5;


-- =========================================
-- Q3 - GROUP BY + HAVING
-- Vendedores con ingreso bruto > 10000
-- =========================================

SELECT
    vendedor,
    SUM(cantidad * precio_unitario) AS ingreso_bruto
FROM ventas
GROUP BY vendedor
HAVING SUM(cantidad * precio_unitario) > 10000;


-- =========================================
-- Q4 - COUNT + SUM + AVG
-- Estadísticas por categoría
-- =========================================

SELECT
    categoria,
    COUNT(*) AS total_pedidos,
    SUM(cantidad) AS unidades_vendidas,
    AVG(precio_unitario) AS precio_promedio
FROM ventas
GROUP BY categoria;


-- =========================================
-- Q5 - JOIN
-- Cumplimiento de metas por vendedor
-- =========================================

SELECT
    v.vendedor,
    vd.zona,
    vd.meta_mensual,
    SUM(v.cantidad * v.precio_unitario) AS ventas_totales,
    ROUND(
        (SUM(v.cantidad * v.precio_unitario)
        / vd.meta_mensual) * 100,
        2
    ) AS porcentaje_cumplimiento
FROM ventas v
JOIN vendedores vd
    ON v.vendedor = vd.vendedor
GROUP BY
    v.vendedor,
    vd.zona,
    vd.meta_mensual;


-- =========================================
-- Q6 - SUBCONSULTA
-- Cliente con mayor ingreso total
-- =========================================

SELECT
    cliente_nombre,
    SUM(cantidad * precio_unitario) AS ingreso_total
FROM ventas
WHERE fecha BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY cliente_nombre
HAVING ingreso_total = (
    SELECT MAX(total_ingreso)
    FROM (
        SELECT
            SUM(cantidad * precio_unitario) AS total_ingreso
        FROM ventas
        WHERE fecha BETWEEN '2024-01-01' AND '2024-06-30'
        GROUP BY cliente_nombre
    )
);