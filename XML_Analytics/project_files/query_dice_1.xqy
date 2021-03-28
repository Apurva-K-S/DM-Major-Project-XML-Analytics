(: dice - 1 :)
let $fact_product_entries := (doc("factProductSales.xml")/FactProductSales/ProductSales-collection/ProductSale)
return <table><tr><th>customer_id</th><th>product_id</th> <th> transaction_id </th></tr>
{
   for $x in $fact_product_entries  
   where $x/customer_id=1 and $x/product_id>1
   return <tr><td>{string($x/customer_id)}</td><td>{string($x/product_id)}</td> <td>{string($x/transaction_id)}</td></tr>
}
</table>


(: OUTPUT:

apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ saxonb-xquery -q:query.xqy -s:factProductSales.xml
Source document ignored - query does not access the context item
<?xml version="1.0" encoding="UTF-8"?>
<table>
   <tr>
      <th>customer_id</th>
      <th>product_id</th>
      <th> transaction_id </th>
   </tr>
   <tr>
      <td> 1</td>
      <td>2 </td>
      <td> 2</td>
   </tr>
   <tr>
      <td> 1</td>
      <td>3 </td>
      <td> 3</td>
   </tr>
   <tr>
      <td> 1</td>
      <td>4 </td>
      <td> 10</td>
   </tr>
   <tr>
      <td> 1</td>
      <td>5 </td>
      <td> 11</td>
   </tr>
   <tr>
      <td> 1</td>
      <td>4 </td>
      <td> 12</td>
   </tr>
   <tr>
      <td> 1</td>
      <td>2 </td>
      <td> 16</td>
   </tr>
   <tr>
      <td> 1</td>
      <td>3 </td>
      <td> 17</td>
   </tr>
apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ 

:)