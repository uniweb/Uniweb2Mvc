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

	<xsl:template match="uw:form">
			<form action="{@action}" method="{@method}">
				<xsl:choose>
					<xsl:when test="*[@mandatory='true']">
						<p>
							Tous les champs marqués
							<xsl:call-template name="RequiredIndicator">
								<xsl:with-param name="required" select="1" />
							</xsl:call-template>
							sont requis.
						</p>
					</xsl:when>
				</xsl:choose>
				<xsl:apply-templates />
			</form>
	</xsl:template>
</xsl:stylesheet>