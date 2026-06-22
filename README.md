# Reto Integrador - Unidad 1
## El Lenguaje y la Filosofía de los Datos

### Autor
David Carrasco

---

# Descripción del Proyecto

Este proyecto desarrolla un flujo completo de análisis y procesamiento de datos utilizando:

- NumPy
- SQLite
- SQL
- Pandas

A partir del dataset **ventas_techventas.csv**, se realizaron procesos de:

1. Carga de datos.
2. Limpieza y validación.
3. Análisis estadístico.
4. Consultas SQL.
5. Transformación y enriquecimiento de datos.
6. Exportación a base de datos SQLite.

---

# Estructura del Proyecto

```text
reto_unidad1/

│
├── data/
│   └── ventas_techventas.csv
│
├── notebooks/
│   ├── 01_numpy.ipynb
│   ├── 02_sql_discovery.ipynb
│   └── 03_pandas_pipeline.ipynb
│
├── sql/
│   └── 02_sql_discovery.sql
│
├── techventas.db
│
├── requirements.txt
│
└── README.md
```

---

# Dataset Utilizado

Archivo:

```text
ventas_techventas.csv
```

Contiene información de ventas de la empresa ficticia TechVentas S.A.

Campos principales:

| Campo | Descripción |
|---------|------------|
| order_id | Identificador del pedido |
| fecha | Fecha de venta |
| cliente_id | Identificador del cliente |
| cliente_nombre | Nombre del cliente |
| region | Región de venta |
| producto | Producto vendido |
| categoria | Categoría del producto |
| cantidad | Unidades vendidas |
| precio_unitario | Precio por unidad |
| descuento | Porcentaje de descuento |
| vendedor | Responsable de la venta |

---

# Actividad 1 - NumPy y Álgebra Lineal

Archivo:

```text
01_numpy.ipynb
```

Objetivos desarrollados:

- Importación de datos mediante NumPy.
- Limpieza de registros inválidos.
- Eliminación de valores nulos.
- Validación de cantidades y precios.
- Producto punto utilizando `np.dot()`.
- Cálculo de ingreso total.
- Estadísticas descriptivas:
  - Media
  - Mediana
  - Desviación estándar
  - Percentil 25
  - Percentil 75

Resultados obtenidos:

- Ingreso bruto total calculado mediante álgebra lineal.
- Distribución estadística de precios.
- Interpretación de resultados.

---

# Actividad 2 - SQL Discovery

Archivos:

```text
02_sql_discovery.ipynb
02_sql_discovery.sql
```

Se creó una base de datos SQLite denominada:

```text
techventas.db
```

Consultas desarrolladas:

### Q1 - SELECT DISTINCT

Listado de productos únicos.

### Q2 - WHERE + BETWEEN

Ventas del primer trimestre con cantidad superior a cinco unidades.

### Q3 - GROUP BY + HAVING

Vendedores con ingresos superiores a USD 10.000.

### Q4 - COUNT + SUM + AVG

Indicadores por categoría:

- Total pedidos.
- Unidades vendidas.
- Precio promedio.

### Q5 - JOIN

Cálculo del porcentaje de cumplimiento de metas por vendedor.

### Q6 - Subconsulta

Cliente con mayor ingreso total generado durante el semestre.

---

# Actividad 3 - Pipeline de Datos con Pandas

Archivo:

```text
03_pandas_pipeline.ipynb
```

Proceso desarrollado:

## Extracción

Lectura del dataset utilizando:

```python
pd.read_csv()
```

## Limpieza

- Identificación de valores nulos.
- Eliminación de registros incompletos.
- Conversión de tipos numéricos.
- Validación de consistencia.

## Transformación

Creación de nuevas variables:

- ingreso_bruto
- ingreso_neto
- mes

## Agregación

Generación de resumen mensual:

- Total pedidos.
- Unidades vendidas.
- Ingreso bruto.
- Ingreso neto.

## Integración

Unión con tabla de metas comerciales mediante:

```python
pd.merge()
```

## Cálculo de KPIs

Porcentaje de cumplimiento por vendedor.

## Carga

Exportación a SQLite mediante:

```python
to_sql()
```

Tablas generadas:

- ventas
- resumen_mensual
- cumplimiento_vendedores

---

# Tecnologías Utilizadas

- Python 3.11+
- NumPy
- Pandas
- SQLite
- Jupyter Notebook
- VS Code

---

# Instalación

Crear entorno virtual:

```bash
conda create -n masterIA python=3.11
conda activate masterIA
```

Instalar dependencias:

```bash
pip install numpy pandas sqlalchemy jupyter
```

o

```bash
conda install numpy pandas sqlalchemy jupyter
```

---

# Ejecución

Abrir Jupyter:

```bash
jupyter notebook
```

Ejecutar los notebooks en orden:

```text
01_numpy.ipynb
02_sql_discovery.ipynb
03_pandas_pipeline.ipynb
```

Utilizar:

Kernel → Restart & Run All

---

# Resultados Alcanzados

Se implementó un flujo completo de análisis de datos siguiendo las etapas ETL:

- Extract
- Transform
- Load

Además:

- Se aplicaron conceptos de álgebra lineal.
- Se realizaron consultas SQL avanzadas.
- Se construyó un pipeline de procesamiento con Pandas.
- Se almacenaron los resultados en SQLite para análisis posterior.

---

# Conclusiones

El proyecto permitió integrar herramientas fundamentales del análisis de datos moderno, combinando NumPy para procesamiento numérico, SQL para exploración de información y Pandas para la construcción de pipelines ETL.

La solución desarrollada demuestra la capacidad de transformar datos crudos en información útil para la toma de decisiones, aplicando buenas prácticas de limpieza, validación, análisis y persistencia de datos.