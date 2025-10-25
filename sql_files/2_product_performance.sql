/*
"Which product categories drive the most revenue and have the best customer satisfaction?"
Why this matters: Helps optimize inventory, marketing focus, and product development.

What is analyzed:
Revenue by product category,
Review scores by category,
Identify high-revenue, high-satisfaction categories
*/

SELECT
    products.product_category_name AS category_name,
    SUM(order_items.price) AS total_revenue,
    ROUND(AVG(order_reviews.review_score),1) AS average_review_score,
    COUNT(order_reviews.review_id) as review_count
FROM 
    products INNER JOIN order_items ON products.product_id = order_items.product_id
    INNER JOIN order_reviews ON order_items.order_id = order_reviews.order_id
GROUP BY
category_name
HAVING COUNT(order_reviews.review_id) > 10 
ORDER BY
total_revenue DESC, average_review_score DESC;

/* Insights:
1. 'beleza_saude' and 'relogios_presentes' categories lead in revenue, indicating strong market demand.
2. 'beleza_saude' earns highest revenue (1252404.85) and scores only 4.1★, suggesting room for improvement.
3. 'cds_dvds_musicais' achieves 4.6★ satisfaction with low revenue, representing niche opportunities.
4. 'cama_mesa_banho' and 'beleza_saude' categories have most review data (11137 and 9645 reviews), indicating robust customer feedback.
5. 'beleza_saude' and 'esporte_lazer' categories achieve both high revenue and strong satisfaction (4.1★), marking them as key focus areas.

Recommendations:
1. Implement quality improvements and customer service enhancements to elevate review scores in this top-revenue category.
2. Explore marketing and product expansion in categories like cds_dvds_musicais that demonstrate high customer satisfaction despite lower revenue.
3. Promote customer reviews in high-revenue categories with lower review
    counts to gain better insights into customer satisfaction.
4. Prioritize inventory and marketing efforts on categories like 'beleza_saude' and 'esporte_lazer' that excel in both revenue and customer satisfaction.
5. Regularly track revenue and review score trends across categories to swiftly adapt strategies based on performance shifts.

Result Set:

[
  {
    "category_name": "beleza_saude",
    "total_revenue": "1252404.85",
    "average_review_score": "4.1",
    "review_count": "9645"
  },
  {
    "category_name": "relogios_presentes",
    "total_revenue": "1197565.48",
    "average_review_score": "4.0",
    "review_count": "5950"
  },
  {
    "category_name": "cama_mesa_banho",
    "total_revenue": "1040140.31",
    "average_review_score": "3.9",
    "review_count": "11137"
  },
  {
    "category_name": "esporte_lazer",
    "total_revenue": "986848.92",
    "average_review_score": "4.1",
    "review_count": "8640"
  },
  {
    "category_name": "informatica_acessorios",
    "total_revenue": "914579.39",
    "average_review_score": "3.9",
    "review_count": "7849"
  },
  {
    "category_name": "moveis_decoracao",
    "total_revenue": "729864.42",
    "average_review_score": "3.9",
    "review_count": "8331"
  },
  {
    "category_name": "utilidades_domesticas",
    "total_revenue": "630058.22",
    "average_review_score": "4.1",
    "review_count": "6943"
  },
  {
    "category_name": "cool_stuff",
    "total_revenue": "629561.68",
    "average_review_score": "4.1",
    "review_count": "3772"
  },
  {
    "category_name": "automotivo",
    "total_revenue": "586669.90",
    "average_review_score": "4.1",
    "review_count": "4213"
  },
  {
    "category_name": "ferramentas_jardim",
    "total_revenue": "482946.89",
    "average_review_score": "4.0",
    "review_count": "4329"
  },
  {
    "category_name": "brinquedos",
    "total_revenue": "479702.10",
    "average_review_score": "4.2",
    "review_count": "4091"
  },
  {
    "category_name": "bebes",
    "total_revenue": "408716.75",
    "average_review_score": "4.0",
    "review_count": "3048"
  },
  {
    "category_name": "perfumaria",
    "total_revenue": "398578.07",
    "average_review_score": "4.2",
    "review_count": "3421"
  },
  {
    "category_name": "telefonia",
    "total_revenue": "320111.07",
    "average_review_score": "3.9",
    "review_count": "4517"
  },
  {
    "category_name": "moveis_escritorio",
    "total_revenue": "272339.82",
    "average_review_score": "3.5",
    "review_count": "1687"
  },
  {
    "category_name": "papelaria",
    "total_revenue": "229835.78",
    "average_review_score": "4.2",
    "review_count": "2507"
  },
  {
    "category_name": "pcs",
    "total_revenue": "214198.13",
    "average_review_score": "4.2",
    "review_count": "200"
  },
  {
    "category_name": "pet_shop",
    "total_revenue": "213522.92",
    "average_review_score": "4.2",
    "review_count": "1939"
  },
  {
    "category_name": "eletroportateis",
    "total_revenue": "189594.18",
    "average_review_score": "4.1",
    "review_count": "677"
  },
  {
    "category_name": "instrumentos_musicais",
    "total_revenue": "188876.46",
    "average_review_score": "4.2",
    "review_count": "675"
  },
  {
    "category_name": null,
    "total_revenue": "179027.48",
    "average_review_score": "3.8",
    "review_count": "1598"
  },
  {
    "category_name": "eletronicos",
    "total_revenue": "156383.07",
    "average_review_score": "4.0",
    "review_count": "2749"
  },
  {
    "category_name": "consoles_games",
    "total_revenue": "155906.27",
    "average_review_score": "4.0",
    "review_count": "1127"
  },
  {
    "category_name": "fashion_bolsas_e_acessorios",
    "total_revenue": "152836.42",
    "average_review_score": "4.1",
    "review_count": "2039"
  },
  {
    "category_name": "construcao_ferramentas_construcao",
    "total_revenue": "143797.00",
    "average_review_score": "4.1",
    "review_count": "926"
  },
  {
    "category_name": "malas_acessorios",
    "total_revenue": "139845.20",
    "average_review_score": "4.3",
    "review_count": "1088"
  },
  {
    "category_name": "eletrodomesticos_2",
    "total_revenue": "113216.49",
    "average_review_score": "4.1",
    "review_count": "238"
  },
  {
    "category_name": "eletrodomesticos",
    "total_revenue": "82973.75",
    "average_review_score": "4.2",
    "review_count": "806"
  },
  {
    "category_name": "casa_construcao",
    "total_revenue": "82877.47",
    "average_review_score": "3.9",
    "review_count": "600"
  },
  {
    "category_name": "agro_industria_e_comercio",
    "total_revenue": "72530.47",
    "average_review_score": "4.0",
    "review_count": "212"
  },
  {
    "category_name": "moveis_sala",
    "total_revenue": "68245.60",
    "average_review_score": "3.9",
    "review_count": "502"
  },
  {
    "category_name": "telefonia_fixa",
    "total_revenue": "59023.02",
    "average_review_score": "3.7",
    "review_count": "262"
  },
  {
    "category_name": "casa_conforto",
    "total_revenue": "58051.84",
    "average_review_score": "3.8",
    "review_count": "435"
  },
  {
    "category_name": "climatizacao",
    "total_revenue": "54330.06",
    "average_review_score": "4.0",
    "review_count": "292"
  },
  {
    "category_name": "audio",
    "total_revenue": "50458.71",
    "average_review_score": "3.8",
    "review_count": "361"
  },
  {
    "category_name": "portateis_casa_forno_e_cafe",
    "total_revenue": "47445.71",
    "average_review_score": "4.3",
    "review_count": "76"
  },
  {
    "category_name": "livros_interesse_geral",
    "total_revenue": "46580.13",
    "average_review_score": "4.4",
    "review_count": "549"
  },
  {
    "category_name": "moveis_cozinha_area_de_servico_jantar_e_jardim",
    "total_revenue": "46204.47",
    "average_review_score": "4.0",
    "review_count": "280"
  },
  {
    "category_name": "construcao_ferramentas_seguranca",
    "total_revenue": "40515.52",
    "average_review_score": "3.8",
    "review_count": "193"
  },
  {
    "category_name": "construcao_ferramentas_iluminacao",
    "total_revenue": "40478.23",
    "average_review_score": "4.1",
    "review_count": "296"
  },
  {
    "category_name": "industria_comercio_e_negocios",
    "total_revenue": "39559.61",
    "average_review_score": "4.1",
    "review_count": "266"
  },
  {
    "category_name": "alimentos",
    "total_revenue": "28935.41",
    "average_review_score": "4.2",
    "review_count": "495"
  },
  {
    "category_name": "market_place",
    "total_revenue": "28313.18",
    "average_review_score": "4.0",
    "review_count": "309"
  },
  {
    "category_name": "construcao_ferramentas_jardim",
    "total_revenue": "25769.74",
    "average_review_score": "4.1",
    "review_count": "240"
  },
  {
    "category_name": "artes",
    "total_revenue": "24037.74",
    "average_review_score": "3.9",
    "review_count": "207"
  },
  {
    "category_name": "fashion_calcados",
    "total_revenue": "23368.07",
    "average_review_score": "4.2",
    "review_count": "261"
  },
  {
    "category_name": "bebidas",
    "total_revenue": "22415.96",
    "average_review_score": "4.0",
    "review_count": "377"
  },
  {
    "category_name": "sinalizacao_e_seguranca",
    "total_revenue": "21338.95",
    "average_review_score": "4.1",
    "review_count": "197"
  },
  {
    "category_name": "moveis_quarto",
    "total_revenue": "20278.78",
    "average_review_score": "4.1",
    "review_count": "110"
  },
  {
    "category_name": "livros_tecnicos",
    "total_revenue": "19040.09",
    "average_review_score": "4.4",
    "review_count": "266"
  },
  {
    "category_name": "construcao_ferramentas_ferramentas",
    "total_revenue": "15774.25",
    "average_review_score": "4.4",
    "review_count": "99"
  },
  {
    "category_name": "alimentos_bebidas",
    "total_revenue": "15245.47",
    "average_review_score": "4.3",
    "review_count": "279"
  },
  {
    "category_name": "fashion_roupa_masculina",
    "total_revenue": "10602.82",
    "average_review_score": "3.6",
    "review_count": "131"
  },
  {
    "category_name": "fashion_underwear_e_moda_praia",
    "total_revenue": "9491.65",
    "average_review_score": "4.0",
    "review_count": "130"
  },
  {
    "category_name": "artigos_de_natal",
    "total_revenue": "8090.10",
    "average_review_score": "4.0",
    "review_count": "146"
  },
  {
    "category_name": "cine_foto",
    "total_revenue": "6949.36",
    "average_review_score": "4.2",
    "review_count": "73"
  },
  {
    "category_name": "tablets_impressao_imagem",
    "total_revenue": "6508.43",
    "average_review_score": "4.1",
    "review_count": "81"
  },
  {
    "category_name": "musica",
    "total_revenue": "6034.35",
    "average_review_score": "4.2",
    "review_count": "38"
  },
  {
    "category_name": "dvds_blu_ray",
    "total_revenue": "5982.49",
    "average_review_score": "4.1",
    "review_count": "63"
  },
  {
    "category_name": "livros_importados",
    "total_revenue": "4639.85",
    "average_review_score": "4.4",
    "review_count": "60"
  },
  {
    "category_name": "artigos_de_festas",
    "total_revenue": "4485.18",
    "average_review_score": "3.8",
    "review_count": "43"
  },
  {
    "category_name": "moveis_colchao_e_estofado",
    "total_revenue": "4368.08",
    "average_review_score": "3.8",
    "review_count": "38"
  },
  {
    "category_name": "portateis_cozinha_e_preparadores_de_alimentos",
    "total_revenue": "3968.53",
    "average_review_score": "3.3",
    "review_count": "15"
  },
  {
    "category_name": "fashion_roupa_feminina",
    "total_revenue": "2889.44",
    "average_review_score": "3.8",
    "review_count": "50"
  },
  {
    "category_name": "fashion_esporte",
    "total_revenue": "2144.50",
    "average_review_score": "4.3",
    "review_count": "31"
  },
  {
    "category_name": "la_cuisine",
    "total_revenue": "1917.99",
    "average_review_score": "4.0",
    "review_count": "13"
  },
  {
    "category_name": "artes_e_artesanato",
    "total_revenue": "1814.01",
    "average_review_score": "4.1",
    "review_count": "24"
  },
  {
    "category_name": "fraldas_higiene",
    "total_revenue": "1567.59",
    "average_review_score": "3.3",
    "review_count": "39"
  },
  {
    "category_name": "flores",
    "total_revenue": "1000.24",
    "average_review_score": "4.4",
    "review_count": "31"
  },
  {
    "category_name": "cds_dvds_musicais",
    "total_revenue": "730.00",
    "average_review_score": "4.6",
    "review_count": "14"
  },
  {
    "category_name": "casa_conforto_2",
    "total_revenue": "721.57",
    "average_review_score": "3.6",
    "review_count": "27"
  }
]

*/