(:mostrar el numero de libros y el titulo:)
<resultado>

<titulo>{for $a in doc('books')/bookstore/book
return ($a/title)}</titulo>
<num_libros>
{for $a in doc('books')/bookstore
return count($a/book)}
</num_libros>
</resultado>
