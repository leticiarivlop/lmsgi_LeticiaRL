<libros>
{for $a in doc('books')/bookstore/book
return
<libro autores="{count($a/author)}">{$a/title/text()}</libro>}
</libros>