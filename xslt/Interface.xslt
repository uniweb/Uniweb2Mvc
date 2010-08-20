<?xml version="1.0" encoding="utf-8"?>
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

	<xsl:template match="uw:interface">
		<![CDATA[<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>]]>
		<html>
			<head>
				<script type="text/javascript" src="/JavascriptServer/enhance"></script>
				<script type="text/javascript" src="/JavascriptServer/uniweb"></script>
			</head>
			<body>
				<xsl:if test="@id and @id != ''">
					<xsl:attribute name="id">
						<xsl:value-of select="@id" />
					</xsl:attribute>
				</xsl:if>
				
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>