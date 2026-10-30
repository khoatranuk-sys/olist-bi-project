-- tests/assert_order_reviews_grain.sql
-- Mục đích: trả về các cặp (review_id, order_id) bị trùng. 0 dòng là PASS.
select review_id, order_id, count(*) as n
from {{ ref('stg_olist__order_reviews') }}
group by review_id, order_id
having count(*) > 1