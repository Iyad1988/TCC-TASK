{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace view KPI_REPORT.V_ORDER_INTAKE(\
	ORDER_INTAKE,\
	SHOP_ID,\
	BOOKING_DATE,\
	LOCALE\
) as\
    (select sum (total_revenue) as order_intake, shop_id, booking_date, locale \
     from KPI_report.v_order_intake_per_sales_event \
     group by shop_id, booking_date, locale);}