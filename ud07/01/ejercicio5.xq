<html>
    <head>
    </head>
    <body>
        <h1>Bookstore</h1>
       <table>
          <thead>
            <tr>
              <th>Titulo</th>
              <th>Categoría</th>
            </tr>
          </thead>
          <tbody>
           {for $a in doc('books')//book
            return if ($a/@category="children") then <tr><td style="color: blue">{$a/title/text()}</td><td>{$a/data(@category)}</td></tr>
          else if ($a/@category="cooking") then <tr><td style="color: green">{$a/title/text()}</td><td>{$a/data(@category)}</td></tr>
        else  <tr><td style="color: red">{$a/title/text()}</td><td>{$a/data(@category)}</td></tr>}
          </tbody>
      </table>
    </body>
</html>