(: profit or loss incurred given store_id :)

let $fact := doc("factProductSales.xml")/FactProductSales/ProductSales-collection/ProductSale
let $store := doc("DimStores.xml")/DimStores/store-collection/store


let $result := sum( 
    for $f in $fact, $s in $store
    let $temp := ($f/sales_total_cost - $f/product_actual_cost) 
    where $f/store_id = 1 and $f/store_id = $s/StoreID
    return $temp
)
return $result

(:

OUTPUT:
apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ saxonb-xquery -q:query_profit_loss.xqy -s:factProductSales.xml
Source document ignored - query does not access the context item
<?xml version="1.0" encoding="UTF-8"?>63apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ 

:)