-- stg_olist__customers.sql
-- Mục đích: staging khách hàng, chỉ đổi tên cột, mọi cột giữ STRING.
select
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix as zip_code_prefix,   -- zip giữ STRING để không mất số 0 đầu
    customer_city as city,
    customer_state as state
from {{ source('olist', 'customers') }}