for $libro in /bookstore/book
return 
  <libro>
    {$libro/title}
    <autores>{count($libro/author)}</autores>
  </libro>