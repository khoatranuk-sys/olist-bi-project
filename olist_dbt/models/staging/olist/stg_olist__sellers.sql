-- stg_olist__sellers.sql
-- Mục đích: staging người bán, chỉ đổi tên cột.
select
    seller_id,
    seller_zip_code_prefix as zip_code_prefix,
    seller_city as city,
    seller_state as state
from {{ source('olist', 'sellers') }}