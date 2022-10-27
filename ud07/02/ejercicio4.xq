for $libro in /bookstore/book
where ends-with($libro/year, "3")
return $libro