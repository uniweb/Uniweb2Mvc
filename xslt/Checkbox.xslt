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
	
	<xsl:template match="uw:checkbox">
		<!-- Asserts -->
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@id" />
			<xsl:with-param name="message" select="'id is required for element uw:checkbox'" />
		</xsl:call-template>
		
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@label" />
			<xsl:with-param name="message" select="'label is required for element uw:checkbox'" />
		</xsl:call-template>
		
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@checkedvalue" />
			<xsl:with-param name="message" select="'checkedvalue is required for element uw:checkbox'" />
		</xsl:call-template>
		
		<div class="fieldContainer">
			<label for="{@id}"><xsl:value-of select="@label"/>
				<xsl:call-template name="PlaceholderAttribute" >
					<xsl:with-param name="placeholder" select="@placeholder" />
				</xsl:call-template>
			</label>
			<input type="checkbox" id="{@id}">
				<xsl:call-template name="InputNameAttribute" />
			</input>

			<xsl:choose>
				<xsl:when test="@uncheckedvalue and @uncheckedvalue != ''">
					<input type="hidden" value="{@uncheckedvalue}" >
						<xsl:call-template name="InputNameAttribute" />
					</input>
				</xsl:when>
			</xsl:choose>
			
		</div>

	</xsl:template>
</xsl:stylesheet>
