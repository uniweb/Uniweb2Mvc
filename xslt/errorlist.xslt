<?xml version="1.0" encoding="utf-8"?>
<!-- 
This file is part of Uniweb.

    Uniweb is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Uniweb is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with Uniweb.  If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet version="1.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:uw="http://www.projet-uniweb.org/ns/uniweb"
								exclude-result-prefixes="uw"
>
	<xsl:output method="html"
							indent="yes"
							omit-xml-declaration="yes"
							encoding="utf-8"
							doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
							doctype-system="C:\DTD\xhtml1-strict.dtd"
	/>

	<xsl:template match="uw:errorlist">
		<![CDATA[<%]]>if( <xsl:value-of select="@errorlistkey"/>.Count > 0 ){<![CDATA[%>]]><h2>Erreur lors de la validation du formulaire</h2><ul><![CDATA[<%]]>foreach (var error in <xsl:value-of select="@errorlistkey"/>){<![CDATA[%>]]><li><a href="#&lt;%= error.{@erronousfieldidkey} %&gt;"><![CDATA[<%:]]>error.<xsl:value-of select="@errormessagekey"/><![CDATA[%>]]></a></li><![CDATA[<%]]>}<![CDATA[%>]]></ul><![CDATA[<%]]>}<![CDATA[%>]]>
		<xsl:apply-templates />
	</xsl:template>
	
</xsl:stylesheet>
