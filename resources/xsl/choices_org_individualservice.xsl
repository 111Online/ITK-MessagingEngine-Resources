<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d2p1="http://schemas.datacontract.org/2004/07/NHSChoices.Syndication.Resources" >
   <xsl:output method="xml" omit-xml-declaration="no" encoding="utf-8" indent="yes"/>

   <xsl:template match="/">
   <root>
       <xsl:for-each select="//d2p1:Link">
          <xsl:copy-of select="." />
        </xsl:for-each>
   </root>
   </xsl:template>
</xsl:stylesheet>