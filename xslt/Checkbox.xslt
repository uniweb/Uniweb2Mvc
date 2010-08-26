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
