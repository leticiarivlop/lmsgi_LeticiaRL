for $a in(1 to 7), $b in (1 to 3) 
return <div>
       <a href="{concat($a,"/",$b,".html")}">{concat("Tema",$a," ","Ejercicio",$b)}</a>    
        </div>