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
	<xsl:include href="common.xslt" />
	<xsl:include href="Interface.xslt" />
	<xsl:include href="errorlist.xslt"/>
	<xsl:include href="Form.xslt" />
	<xsl:include href="Textbox.xslt" />
  <xsl:include href="select.xslt" />
	<xsl:include href="Textarea.xslt" />
	<xsl:include href="Checkbox.xslt" />
	<xsl:include href="Email.xslt" />
	<xsl:include href="URL.xslt" />
	<xsl:include href="Controls.xslt" />
	<xsl:include href="Savebutton.xslt" />
</xsl:stylesheet>
