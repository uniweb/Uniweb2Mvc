<?xml version="1.0" encoding="Windows-1252"?>
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

	<xsl:template match="uw:select">
		<!-- Asserts -->
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@id" />
			<xsl:with-param name="message" select="'id is required for element uw:select'" />
		</xsl:call-template>
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@label" />
			<xsl:with-param name="message" select="'label is required for element uw:select'" />
		</xsl:call-template>
		<xsl:if test="count(uw:option[@selected='selected']) > 1">
			<xsl:message terminate="yes">
				<xsl:value-of select="'One and only one uw:option can be selected'"/>
			</xsl:message>
		</xsl:if>
		
		<div class="fieldContainer">
			<label for="{@id}">
				<xsl:value-of select="@label"/>
				<xsl:call-template name="PlaceholderAttribute" >
					<xsl:with-param name="placeholder" select="@placeholder" />
				</xsl:call-template>
			</label>
			<select id="{@id}">
				<xsl:call-template name="InputNameAttribute" />
				
				<xsl:apply-templates />
			</select>
		</div>
	</xsl:template>

	<xsl:template match="uw:option">
		<!-- Asserts -->
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@value" />
			<xsl:with-param name="message" select="'value is required for element uw:option'" />
		</xsl:call-template>
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@label" />
			<xsl:with-param name="message" select="'label is required for element uw:option'" />
		</xsl:call-template>


		<xsl:choose>
			<xsl:when test="@selected and @selected='selected'">
				<option value="{@value}" selected="selected" >
					<xsl:value-of select="@label" />
				</option>
			</xsl:when>
			<xsl:otherwise>
				<option value="{@value}" >
					<xsl:value-of select="@label" />
				</option>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	

	<xsl:template match="uw:optiondatasource">
		<!-- Asserts -->
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@sourcename" />
			<xsl:with-param name="message" select="'sourcename is required for element uw:optiondatasource'" />
		</xsl:call-template>
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@labelkey" />
			<xsl:with-param name="message" select="'labelkey is required for element uw:optiondatasource'" />
		</xsl:call-template>
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@valuekey" />
			<xsl:with-param name="message" select="'valuekey is required for element uw:optiondatasource'" />
		</xsl:call-template>
		<xsl:call-template name="VerifyEmptyValue">
			<xsl:with-param name="value" select="@selectedValue" />
			<xsl:with-param name="message" select="'selectedValue is required for element uw:optiondatasource'" />
		</xsl:call-template>
		
		<xsl:comment> SERVER LOOP BEG </xsl:comment>
		<![CDATA[ <% ]]>foreach(var optionItem in <xsl:value-of select="@sourcename" />){<![CDATA[ %><option value="<%= optionItem. ]]><xsl:value-of select="@valuekey" /><![CDATA[ %>"<%= ]]><xsl:value-of select="@selectedValue" /><![CDATA[.Equals(optionItem.]]><xsl:value-of select="@valuekey" /><![CDATA[ ) ? " selected=\"selected\"" : "" %>><%= optionItem.]]><xsl:value-of select="@labelkey" /><![CDATA[ %></option><% ]]>	}<![CDATA[ %> ]]>
		<xsl:comment> SERVER LOOP END </xsl:comment>
	</xsl:template>
</xsl:stylesheet>