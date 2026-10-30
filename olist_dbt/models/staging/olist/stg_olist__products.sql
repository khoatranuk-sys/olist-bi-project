-- stg_olist__products.sql
-- Mục đích: staging sản phẩm, sửa lỗi chính tả lenght thành length ở tên cột.
-- Ô category trống (610 dòng) là NULL, giữ nguyên, xử lý ở mart.
select
    product_id,
    product_category_name as category_name,
    safe_cast(product_name_lenght as int64) as name_length,
    safe_cast(product_description_lenght as int64) as description_length,
    safe_cast(product_photos_qty as int64) as photos_qty,
    safe_cast(product_weight_g as int64) as weight_g,
    safe_cast(product_length_cm as int64) as length_cm,
    safe_cast(product_height_cm as int64) as height_cm,
    safe_cast(product_width_cm as int64) as width_cm
from {{ source('olist', 'products') }}