<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>
  
  <xsl:param name="toVirtualUri"/>
  <xsl:param name="messageID"/>
  <xsl:param name="action"/>
  <xsl:param name="createdTime"/>
  <xsl:param name="expiredTime"/> 
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  
  <xsl:template match="/">   
    <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Header>
      <wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
			<wsu:Timestamp xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" wsu:Id="D6CD5232-14CF-11DF-9423-1F9A910D4703">
				<wsu:Created><xsl:value-of select="$createdTime" disable-output-escaping="yes" /></wsu:Created>
				<wsu:Expires><xsl:value-of select="$expiredTime" disable-output-escaping="yes" /></wsu:Expires>
			</wsu:Timestamp>
			<wsse:UsernameToken>
				<wsse:Username>none</wsse:Username>
			</wsse:UsernameToken>
		</wsse:Security>
        <Action xmlns="http://www.w3.org/2005/08/addressing"><xsl:value-of select="$action" disable-output-escaping="yes" /></Action>
        <MessageID xmlns="http://www.w3.org/2005/08/addressing"><xsl:value-of select="translate($messageID, $smallcase, $uppercase)" disable-output-escaping="yes" /></MessageID>
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
            