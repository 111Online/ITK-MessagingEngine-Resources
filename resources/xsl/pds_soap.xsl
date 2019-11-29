<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>
  
  <xsl:param name="toVirtualUri"/>
  <xsl:param name="messageID"/>
  
  <xsl:template match="/">   
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Header>
        <Action xmlns="http://www.w3.org/2005/08/addressing">urn:nhs-itk:services:201005:getPatientDetails-v1-0</Action>
        <MessageID xmlns="http://www.w3.org/2005/08/addressing"><xsl:value-of select="$messageID" disable-output-escaping="yes" /></MessageID>
        <To xmlns="http://www.w3.org/2005/08/addressing"><xsl:value-of select="$toVirtualUri" disable-output-escaping="yes" /></To>
        <ReplyTo xmlns="http://www.w3.org/2005/08/addressing">
          <Address>http://www.w3.org/2005/08/addressing/anonymous</Address>
        </ReplyTo>
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
            