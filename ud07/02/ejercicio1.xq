let $max := max(/bookstore/book/price), 
    $min := min(/bookstore/book/price)
return
<resultado>
  {$max},{$min}
</resultado>