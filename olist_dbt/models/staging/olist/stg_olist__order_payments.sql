-- stg_olist__order_payments.sql
-- Mục đích: staging thanh toán. Grain: order_id + payment_sequential.
select
    order_id,
    safe_cast(payment_sequential as int64) as payment_sequential,
    payment_type,
    safe_cast(payment_installments as int64) as payment_installments,
    safe_cast(payment_value as numeric) as payment_value
from {{ source('olist', 'order_payments') }}