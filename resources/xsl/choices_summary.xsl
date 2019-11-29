<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://syndication.nhschoices.nhs.uk/services" xmlns:a="http://www.w3.org/2005/Atom">
   <xsl:output method="xml" omit-xml-declaration="no" encoding="utf-8" indent="yes"/>

   <xsl:template match="/">  
   <root>  
       <xsl:for-each select="//a:entry">
          <service>
             <xsl:copy-of select="a:link[@rel='self']" />
             <xsl:copy-of select="a:content/s:servicesummary/s:distance" />
           </service>
        </xsl:for-each>
   </root>
   </xsl:template>
</xsl:stylesheet>