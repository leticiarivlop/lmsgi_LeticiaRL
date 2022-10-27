<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 21 de abril de 2022, 10:14
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" version="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
        </xsl:text>
        <xsl:apply-templates select="comment()"/>
        <xsl:text> 
        </xsl:text>
        <html>
            <head>
                <title>03 XSLT Leticia Rivera López</title>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>    
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="robots" content="index,follow"/>
                <meta name="description" content="Prototipo"/>
                <meta name="keywords" content="HTML, CSS,XSLT,XSL"/>
                <meta name="author" content="Leticia Rivera López"/>
                <meta http-equiv="refresh" content="300"/>
                <link href="estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" href="../../images/favicon-32x32.png"/> 
            </head>
            <body>
                <h1>Información de películas</h1>
                <div id="grande">
                    <xsl:for-each select="peliculas/pelicula">
                        <xsl:sort select="publico" datatype="text" order="ascending"/>
                        <xsl:sort select="valoracion/@puntos" datatype="number" order="ascending"/>
                        <xsl:sort select="nombre" datatype="text" order="ascending"/>
                        <div class="pequeno">
                            <div>
                                <xsl:value-of select="nombre"/>
                            </div>
                            <div>
                                <xsl:choose>
                                    <xsl:when test="valoracion/@puntos=1 or valoracion/@puntos=2">
                                        <p class="Bajo">Puntuacion: Bajo</p>
                                    </xsl:when>
                                    <xsl:when test="valoracion/@puntos=3 or valoracion/@puntos=4">
                                        <p class="Media">Puntuacion: Media</p>
                                    </xsl:when>
                                    <xsl:when test="valoracion/@puntos&gt;4">
                                        <p class="Alta">Puntuacion: Alta</p>
                                    </xsl:when>
                                </xsl:choose>
                            </div>
                            <div>
                                <xsl:value-of select="concat('Dirigido a: ',publico)"/>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <footer>
                    <p><xsl:value-of select="concat('Número total de películas ',count(//pelicula))"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>


</xsl:stylesheet>
