<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 4 de abril de 2022, 9:03
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>02 XSLT Leticia Rivera López</title>
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
                <h1>Informacion de tickets</h1>
                <h2>Listado de tickets</h2>
                <xsl:apply-templates select="listatickets/ticket"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="listatickets/ticket">
        <div>
            <div class="numeroticket">
            <xsl:value-of select="concat('Ticket:',numero)"/>
            </div>
            <div class="tabla">
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="producto"/>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Total</th>
                        <th>
                            <xsl:value-of select="total"/>
                        </th>
                    </tr>
                </tfoot>
            </table>
            <div class="fecha">
                <xsl:value-of select="concat('Fecha del tickets',fecha)"/>
            </div> 
            </div>
        </div>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
