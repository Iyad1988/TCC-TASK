{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace view KPI_REPORT.V_LAG_TIME(\
	ORDER_ID,\
	SHOP_ID,\
	LOCALE,\
	BOOKING_DATE,\
	LAG_TIME_IN_DAYS\
) as\
    (\
        SELECT  order_id,\
                o.shop_id,\
                s.locale,\
                booking_date, \
                DATEDIFF (DAY, order_date, delivery_date) AS lag_time_in_days\
                \
        FROM CORE.T_ORDERS as o\
        JOIN CORE.T_SHOPS as s\
        ON o.shop_id = s.shop_id\
    \
        WHERE delivery_date IS NOT NULL);}