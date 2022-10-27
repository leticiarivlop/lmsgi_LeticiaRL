<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 9 de mayo de 2022, 8:33
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" version="html"/>
    <xsl:param name="solucion" select="'yes'"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
        </xsl:text>
        <xsl:apply-templates select="comment()"/>
        <xsl:text> 
        </xsl:text>
        <html>
            <head>
                <title>05 XSLT Leticia Rivera López</title>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>    
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="robots" content="index,follow"/>
                <meta name="description" content="Prototipo"/>
                <meta name="keywords" content="HTML, CSS,XSLT,XSL"/>
                <meta name="author" content="Leticia Rivera López"/>
                <meta http-equiv="refresh" content="300"/>
                <link href="examen.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" type="image/png" href="../../images/favicon-32x32.png"/> 
            </head>
            <body>
                <h1>
                    <xsl:value-of select="examen/datos/nombreCiclo"/>
                </h1>
                <h2>
                    <xsl:value-of select="examen/datos/nombreModulo"/>
                </h2>
                <h3>
                    <xsl:value-of select="concat('Fecha: ',examen/datos/fecha/dia,' de ',document('meses.xml')/meses/mes[@id=current()/examen/datos/fecha/mes],' de ',examen/datos/fecha/anyo)"/>
                </h3>
                <div id="contenedor">
                    <form action="action_page.php" method="post" name="EXAMEN" id="1" autocomplete="off">
                        <xsl:for-each select="examen/preguntas/pregunta">
                            <fieldset>
                                <div class="contenido">
                                    <div class="enunciado">
                                        <xsl:value-of select="concat(@id,'. ' ,enunciado)"/>
                                    </div>
                                    <xsl:for-each select="respuestas/respuesta">
                                        <div class="respuesta">
                                           <xsl:if test="$solucion='no'">
                                                <xsl:attribute name="class">
                                                    respuesta sombra
                                                </xsl:attribute>
                                            </xsl:if>
                                            <input type="radio">
                                                <xsl:attribute name="id">
                                                    <xsl:value-of select="concat('pregunta',../../@id,position())"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="name">
                                                    <xsl:value-of select="concat('pregunta',../../@id)"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="position()"/>
                                                </xsl:attribute>
                                           
                                                <xsl:if test="$solucion!='no'">
                                                    <xsl:attribute name="disabled">
                                                        <xsl:value-of select="disabled"/>
                                                    </xsl:attribute>
                                                
                                                    <xsl:if test="@correcta='correcta'">
                                                        <xsl:attribute name="checked">
                                                            <xsl:value-of select="checked"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                               </xsl:if>
                                            </input>
                                            <xsl:value-of select="current()"/>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </fieldset>
                        </xsl:for-each>
                        <xsl:if test="$solucion='no'">
                            <div id="botones">
                                <input type="submit" id="Enviar" name="Enviar" value="Enviar Formulario"/> 
                                <input type="reset" id="Borrar" name="Borrar" value="Borrar Formulario"/> 
                            </div>
                        </xsl:if>
                    </form>
                </div>
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
