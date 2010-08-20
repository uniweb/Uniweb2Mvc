<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="xml" indent="yes"/>

	<xsl:template name="VerifyEmptyValue">
		<xsl:param name="value"></xsl:param>
		<xsl:param name="message"></xsl:param>
		<xsl:choose>
			<xsl:when test="not($value) or $value = ''" >
				<xsl:message terminate="yes">
					<xsl:value-of select="$message"/>
				</xsl:message>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="InputNameAttribute">
		<xsl:attribute name="name">
		  <xsl:choose>
			<xsl:when test="@name and @name!=''">
			  <xsl:value-of select="@name"/>
			</xsl:when>
			<xsl:otherwise>
			  <xsl:value-of select="@id" />
			</xsl:otherwise>
		  </xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="RequiredIndicator">
		<xsl:param name="required"></xsl:param>
		<xsl:if test="$required = 'true'">
			<img class="required-field-indicator" />
		</xsl:if>
	</xsl:template>

	<xsl:template name="PlaceholderAttribute">
		<xsl:param name="placeholder"></xsl:param>
		
		<xsl:if test="@placeholder and @placeholder!=''">
			<span class="placeholder">
				<xsl:value-of select="@placeholder"/>
			</span>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
