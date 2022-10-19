select product_id, sum(quantity) as quantity_on_hand
from {{ref("fact_stock_item_transaction")}}
group by product_id