{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace TABLE CORE.T_ORDER_POSITIONS (\
	CREATED_AT TIMESTAMP_NTZ(9),\
	UPDATED_AT TIMESTAMP_NTZ(9),\
	ORDER_ID NUMBER(38,0),\
	ORDER_POS_ID NUMBER(38,0),\
	PRODUCT_ID VARCHAR(16777216),\
	PRODUCT_UNIT VARCHAR(16777216),\
	PRODUCT_NAME VARCHAR(16777216),\
	PRICE NUMBER(38,17),\
	QUANTITY NUMBER(38,17)\
);}