xquery version "3.0";

let $fact := doc("factProductSales.xml")/FactProductSales/ProductSales-collection/ProductSale
let $cust := doc("dimcust.xml")/DimCustomer/Customer-collection/customer
let $prod := doc("dimProd.xml")/DimProduct/Product-Collection/Product

return <table> <tr> <th>transaction_id</th> <th>store_id</th> <th>customer_id</th> <th>customer_name</th> <th>product_id</th>
    <th>ProductName</th> <th>quantity</th> <th>sales_total_cost</th> <th>product_actual_cost</th> <th>deviation</th>
 </tr>
{
    for $i in $fact, $j in $cust, $k in $prod
    where $j/CustomerID = $i/customer_id and $i/product_id = $k/ProductKey and ($i/customer_id = "1" or $i/customer_id = "2") and ($i/product_id = "3" or $i/product_id = "4")
    return <tr> <td>{string($i/transaction_id)}</td> <td>{string($i/store_id)}</td> <td>{string($i/customer_id)}</td> 
    <td>{string($j/CustomerName)}</td> <td>{string($i/product_id)}</td> <td>{string($k/ProductName)}</td> 
    <td>{string($i/quantity)}</td> <td>{string($i/sales_total_cost)}</td> <td>{string($i/product_actual_cost)}</td> 
    <td>{string($i/deviation)}</td> </tr>
}</table>


(:

return <table> <tr> <th>transaction_id</th> <th>store_id</th> <th>customer_id</th> <th>customer_name</th> <th>product_id</th>
    <th>ProductName</th> <th>quantity</th> <th>sales_total_cost</th> <th>product_actual_cost</th> <th>deviation</th>
 </tr>
{
    for $i in $fact, $j in $cust, $k in $prod
    where $j/CustomerID = $i/customer_id and $i/product_id = $k/ProductKey and ($i/customer_id = "1" or $i/customer_id = "2") and ($i/product_id = "3" or $i/product_id = "4")
    return <tr> <td>{string($i/transaction_id)}</td> <td>{string($i/store_id)}</td> <td>{string($i/customer_id)}</td> 
    <td>{string($j/CustomerName)}</td> <td>{string($i/product_id)}</td> <td>{string($k/ProductName)}</td> 
    <td>{string($i/quantity)}</td> <td>{string($i/sales_total_cost)}</td> <td>{string($i/product_actual_cost)}</td> 
    <td>{string($i/deviation)}</td> </tr>
}</table>
















OUTPUT: 

apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$ saxonb-xquery -q:query_dice_2.xqy -s:factProductSales.xml
Source document ignored - query does not access the context item
<?xml version="1.0" encoding="UTF-8"?>
<table>
   <tr>
      <th>transaction_id</th>
      <th>store_id</th>
      <th>customer_id</th>
      <th>customer_name</th>
      <th>product_id</th>
      <th>ProductName</th>
      <th>quantity</th>
      <th>sales_total_cost</th>
      <th>product_actual_cost</th>
      <th>deviation</th>
   </tr>
   <tr>
      <td>3</td>
      <td>1</td>
      <td>1</td>
      <td>Henry Ford</td>
      <td>3</td>
      <td>SunFlower Oil 1 ltr</td>
      <td>3</td>
      <td>130.5</td>
      <td>126</td>
      <td>4.5</td>
   </tr>
   <tr>
      <td>4</td>
      <td>1</td>
      <td>2</td>
      <td>Bill Gates</td>
      <td>3</td>
      <td>SunFlower Oil 1 ltr</td>
      <td>2</td>
      <td>87</td>
      <td>84</td>
      <td>3</td>
   </tr>
   <tr>
      <td>5</td>
      <td>1</td>
      <td>2</td>
      <td>Bill Gates</td>
      <td>4</td>
      <td>Nirma Soap</td>
      <td>6</td>
      <td>120</td>
      <td>108</td>
      <td>12</td>
   </tr>
   <tr>
      <td>10</td>
      <td>2</td>
      <td>1</td>
      <td>Henry Ford</td>
      <td>4</td>
      <td>Nirma Soap</td>
      <td>3</td>
      <td>60</td>
      <td>54</td>
      <td>6</td>
   </tr>
   <tr>
      <td>12</td>
      <td>1</td>
      <td>1</td>
      <td>Henry Ford</td>
      <td>4</td>
      <td>Nirma Soap</td>
      <td>3</td>
      <td>60</td>
      <td>54</td>
      <td>6</td>
   </tr>
   <tr>
      <td>17</td>
      <td>2</td>
      <td>1</td>
      <td>Henry Ford</td>
      <td>3</td>
      <td>SunFlower Oil 1 ltr</td>
      <td>1</td>
      <td>43.5</td>
      <td>42</td>
      <td>1.5</td>
   </tr>
apurva@apurva:~/Desktop/DM/xquery/XML_Analytics/project_files$

:)