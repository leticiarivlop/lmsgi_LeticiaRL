for $a in doc('books')/bookstore/book
where $a/price>30
order by $a/title
return concat($a/title/text(),": ",$a/price/text(),"$")