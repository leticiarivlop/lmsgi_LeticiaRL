for $a in doc('books')/bookstore/book
where count($a/author)>2
return $a/title/text()