<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="http://www.infermed.com/AzWebService">
    <xsl:output method="xml" indent="yes"/>

      <xsl:template match="/">        
        <table>             
          <xsl:apply-templates select="//ns1:DataInstance"/>
        </table>
      </xsl:template>
      
      <xsl:template match="ns1:DataInstance">
        <tr>
          <td>Name</td>
          <td><xsl:value-of select="ns1:Name"/></td>
        </tr>
        <tr>
          <td>Question</td>
          <td><xsl:value-of select="ns1:Caption"/></td>
        </tr>
        <tr>
          <td>Answer</td>
          <td>           
            <list listType="ordered">
            <xsl:for-each select="ns1:Values/*">      
              <item><xsl:value-of select="." /></item>   
            </xsl:for-each>
            </list>           
          </td>
        </tr>
        <tr>
          <td>Time</td>
          <td><xsl:value-of select="ns1:EndTime"/></td>
        </tr>
      </xsl:template>      
</xsl:stylesheet>
        