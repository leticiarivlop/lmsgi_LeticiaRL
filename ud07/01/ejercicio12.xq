(:mostrar el numero de libros:)

for $a in doc('books')/bookstore
return count($a/book)


