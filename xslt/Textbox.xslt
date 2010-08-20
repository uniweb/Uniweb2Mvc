<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
								xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
								xmlns:uw="http://www.projet-uniweb.org/ns/uniweb"
								exclude-result-prefixes="uw"
>
	<xsl:output method="xml"
							indent="yes"
							omit-xml-declaration="yes"
							encoding="utf-8"
							doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	/>

	<xsl:template match="uw:textbox">
		<!-- Asserts -->
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@id" />
			<xsl:with-param name="message" select="'id is required for element uw:textbox'" />
		</xsl:call-template>
		
		<div class="fieldContainer">
			<label for="{@id}">
				<xsl:call-template name="RequiredIndicator">
					<xsl:with-param name="required" select="@mandatory" />
				</xsl:call-template>
				
				<xsl:value-of select="@label" />

				<xsl:call-template name="PlaceholderAttribute" >
					<xsl:with-param name="placeholder" select="@placeholder" />
				</xsl:call-template>
			</label>
			<xsl:element name="input">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<xsl:attribute name="type">text</xsl:attribute>
				
				<xsl:call-template name="InputNameAttribute" />
				
				<xsl:attribute name="maxlength">
					<xsl:value-of select="@maxlength"/>
				</xsl:attribute>
				
				<xsl:if test="@value and @value != ''" >
					<xsl:attribute name="value"><![CDATA[<%=]]><xsl:value-of select="@value"/><![CDATA[%>]]></xsl:attribute>
				</xsl:if>
			</xsl:element>				
		</div>
	</xsl:template>
	
</xsl:stylesheet>
