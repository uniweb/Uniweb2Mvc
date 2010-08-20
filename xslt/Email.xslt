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

	<xsl:template match="uw:email">
		<!-- Asserts -->
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@id" />
			<xsl:with-param name="message" select="'id is required for element uw:email'" />
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
			<input id="{@id}" type="textbox" maxlength="{@maxlength}">
				<xsl:call-template name="InputNameAttribute" />

				<xsl:if test="@value and @value != ''" >
					<xsl:attribute name="value"><![CDATA[<%=]]><xsl:value-of select="@value"/><![CDATA[%>]]></xsl:attribute>
				</xsl:if>
			</input>
		</div>
	</xsl:template>
</xsl:stylesheet>
