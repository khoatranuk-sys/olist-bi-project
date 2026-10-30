-- stg_olist__order_reviews.sql
-- Mục đích: staging đánh giá. review_id có trùng, cặp review_id + order_id thì không.
select
    review_id,
    order_id,
    safe_cast(review_score as int64) as review_score,
    review_comment_title as comment_title,
    review_comment_message as comment_message,
    safe_cast(review_creation_date as timestamp) as created_at,
    safe_cast(review_answer_timestamp as timestamp) as answered_at
from {{ source('olist', 'order_reviews') }}