{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf840
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 create or replace TABLE CORE.T_PRODUCTS (\
	PRODUCT_ID VARCHAR(16777216),\
	SKU_ID VARCHAR(16777216),\
	UPDATED_AT TIMESTAMP_NTZ(9),\
	CREATED_AT TIMESTAMP_NTZ(9),\
	PRODUCT_NAME VARCHAR(16777216),\
	PRODUCT_NUMBER VARCHAR(16777216),\
	VARIANT_NAME VARCHAR(16777216),\
	IS_VARIANT BOOLEAN,\
	PRODUCT_STATE_DESC VARCHAR(16777216),\
	FIRST_PUBLISHED_AT TIMESTAMP_NTZ(9)\
);}