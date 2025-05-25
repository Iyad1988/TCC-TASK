{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww17040\viewh12480\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace view KPI_REPORT.V_NEW_OR_RETURN_CUST(\
	DATE_OF_ORDER,\
	NEW_CUSTOMERS,\
	RETURNING_CUSTOMERS,\
	TOTAL_CUSTOMERS,\
	NEW_CUSTOMER_PERCENTAGE,\
	RETURNING_CUSTOMER_PERCENTAGE\
) as WITH \
\
first_orders AS (\
\
   SELECT\
    c.address_hash_id, \
    DATE_TRUNC('DAY', MIN(o.created_at)) AS first_order_date\
    \
   FROM\
    core.t_customers AS c\
   JOIN core.t_orders AS o \
   ON c.customer_id = o.customer_id\
    \
  GROUP BY c.address_hash_id\
),\
\
customer_type AS (\
\
  SELECT \
  \
    DATE_TRUNC ('DAY', o.created_at) AS date_of_order,\
    c.address_hash_id,\
    \
    CASE\
      WHEN date_of_order =  fo.first_order_date THEN 'New' \
      ELSE 'Returning'\
    END AS new_or_ret_cust\
    \
  FROM\
    core.t_orders AS o\
    \
    JOIN core.t_customers AS c \
    ON o.customer_id = c.customer_id\
\
    JOIN first_orders AS fo \
    ON c.address_hash_id = fo.address_hash_id\
\
),\
\
\
aggregated_metrics AS (\
\
  SELECT\
    date_of_order,\
    \
    COUNT(\
      DISTINCT CASE\
                WHEN new_or_ret_cust = 'New' THEN address_hash_id \
               END\
         ) AS new_customers,\
    \
    COUNT(\
      DISTINCT CASE\
                WHEN new_or_ret_cust = 'Returning' THEN address_hash_id \
               END\
         ) AS returning_customers,\
\
    \
    COUNT(DISTINCT address_hash_id) AS total_customers\
\
  FROM\
    customer_type\
    \
  GROUP BY\
    date_of_order\
)\
\
SELECT\
  date_of_order,\
  new_customers,\
  returning_customers,\
  total_customers,\
  new_customers * 100 / total_customers AS new_customer_percentage,\
  returning_customers * 100 / total_customers AS returning_customer_percentage\
  \
FROM\
  aggregated_metrics\
  \
ORDER BY\
  date_of_order;}