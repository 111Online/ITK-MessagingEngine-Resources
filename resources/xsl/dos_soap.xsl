<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>
    
  <xsl:param name="action"/>
  <xsl:param name="serviceVersion"/>  
    
  <xsl:template match="/">   
	<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:web="https://nww.pathwaysdos.nhs.uk/app/api/webservices">
      <soap:Header>
        <Action xmlns="http://www.w3.org/2005/08/addressing"><xsl:value-of select="$action" disable-output-escaping="yes" /></Action>
        <ReplyTo xmlns="http://www.w3.org/2005/08/addressing">
          <Address>http://www.w3.org/2005/08/addressing/anonymous</Address>
        </ReplyTo>
        <web:serviceVersion><xsl:value-of select="$serviceVersion" disable-output-escaping="yes" /></web:serviceVersion>
      </soap:Header>
      <soap:Body>       
        <xsl:apply-templates/>
      </soap:Body>
    </soap:Envelope>
  </xsl:template>
 
  <xsl:template match="//*">
    <xsl:copy-of select="." />
  </xsl:template>
   
</xsl:stylesheet>
            