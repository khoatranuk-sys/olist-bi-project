-- stg_olist__product_category_translation.sql
-- Mục đích: staging bảng dịch tên category sang tiếng Anh.
select
    product_category_name as category_name,
    product_category_name_english as category_name_english
from {{ source('olist', 'product_category_translation') }}