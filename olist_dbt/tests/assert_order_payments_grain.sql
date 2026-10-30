-- tests/assert_order_payments_grain.sql
-- Mục đích: trả về các cặp (order_id, payment_sequential) bị trùng. 0 dòng là PASS.
select order_id, payment_sequential, count(*) as n
from {{ ref('stg_olist__order_payments') }}
group by order_id, payment_sequential
having count(*) > 1