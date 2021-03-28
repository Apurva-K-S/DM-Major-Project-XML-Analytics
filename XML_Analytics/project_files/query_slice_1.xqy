(: choose the customer_id, total_sales_cost and customer_name when customer_name = Henry ford :)

let $fact := doc("factProductSales.xml")/FactProductSales/ProductSales-collection/ProductSale
let $cust := doc("dimcust.xml")/DimCustomer/Customer-collection/customer

return <table> <tr> <th> customer_id </th> <th> total_sales_cost </th> <th> customer_name </th> </tr>
{
    for $i in $fact, $j in $cust
    where $j/CustomerID = $i/customer_id and $j/CustomerName = "Henry Ford"
    return <tr> <td> {string($j/CustomerID)} </td> <td> {string($i/sales_total_cost)} </td> <td> {string($j/CustomerName)} </td> </tr>
}</table>


(:

apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ saxonb-xquery -q:query_dice_2.xqy -s:factProductSales.xml
Source document ignored - query does not access the context item
<?xml version="1.0" encoding="UTF-8"?>
<table>
   <tr>
      <th> customer_id </th>
      <th> total_sales_cost </th>
      <th> customer_name </th>
   </tr>
   <tr>
      <td>1</td>
      <td>26</td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td>48 </td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td>130.5 </td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td>60 </td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td>139 </td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td> 60 </td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td>6.5 </td>
      <td>Henry Ford</td>
   </tr>
   <tr>
      <td>1</td>
      <td>43.5 </td>
      <td>Henry Ford</td>
   </tr>
</table>apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ 

:)