{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace view KPI_REPORT.V_DROP_OFF_RATE(\
	SHOP_ID,\
	LOCALE,\
	BOOKING_DATE,\
	DROP_OFF_RATE\
) as\
    (\
    select \
t1.shop_id, t1.locale, t1.booking_date, (order_intake - total_revenue)/order_intake as drop_off_rate \
\
    from KPI_report.v_order_intake as t1\
    join KPI_report.v_revenue  as t2\
    on t1.shop_id = t2.shop_id \
    and t1.booking_date = t2.booking_date  \
    and  t1.locale = t2.locale);}