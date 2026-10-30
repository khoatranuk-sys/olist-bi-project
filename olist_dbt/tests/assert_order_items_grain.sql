-- tests/assert_order_items_grain.sql
-- Mục đích: trả về các cặp (order_id, order_item_id) bị trùng. 0 dòng là PASS.
select order_id, order_item_id, count(*) as n
from {{ ref('stg_olist__order_items') }}
group by order_id, order_item_id
having count(*) > 1