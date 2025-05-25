{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh15500\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace view KPI_REPORT.V_ORDER_INTAKE_PER_SALES_EVENT(\
	SALES_EVENT,\
	TOTAL_REVENUE,\
	SHOP_ID,\
	BOOKING_DATE,\
	LOCALE\
) as (\
    select \
    t2.sales_event, sum (price*quantity) as total_revenue, t2.shop_id, t2.booking_date, t3.locale \
    \
    from core.t_order_positions as t1\
\
    inner join core.t_orders as t2\
    on t1.order_id = t2.order_id \
\
    inner join core.t_shops as t3\
    on t2.shop_id = t3. shop_id\
\
    group by t2.shop_id, t2.booking_date, t3.locale, t2.sales_event ) ;}