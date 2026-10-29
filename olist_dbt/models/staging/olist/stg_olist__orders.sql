-- Mục đích: staging cho bảng orders. Mỗi dòng là một đơn hàng.
-- Chỉ đổi tên cột và ép kiểu STRING sang TIMESTAMP bằng SAFE_CAST.
-- Chưa có quy tắc nghiệp vụ. Ngày hỏng thành NULL, không làm cả query lỗi.
-- Không viết dấu ngoặc nhọn trong comment vì Jinja vẫn xử lý.

select
    order_id,
    customer_id,
    order_status,
    safe_cast(order_purchase_timestamp as timestamp)      as purchased_at,
    safe_cast(order_approved_at as timestamp)             as approved_at,
    safe_cast(order_delivered_carrier_date as timestamp)  as delivered_to_carrier_at,
    safe_cast(order_delivered_customer_date as timestamp) as delivered_to_customer_at,
    safe_cast(order_estimated_delivery_date as timestamp) as estimated_delivery_at
from {{ source('olist', 'orders') }}