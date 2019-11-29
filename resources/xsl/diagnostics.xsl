<xsl:stylesheet version="2.0"
		    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		    xmlns:soap2="http://www.w3.org/2003/05/soap-envelope"
		    xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"
		    xmlns:urn="urn:nhs-itk:ns:201005">
			  	<xsl:output method="html" indent="yes"/>
			  	<xsl:param name="OohToggle"/>
			  	<xsl:param name="OohStatus"/>
		 	 	<xsl:template match="text()" />
			    <xsl:template match="/">
				  <html>
				  <body>
                  <xsl:variable name='alltext'>
                    <xsl:value-of select='normalize-space(.)' />
                   </xsl:variable>
				  <h2>ESB - MessageEngine Diagnostics</h2>
				  <table border="1">				  
				    <tr bgcolor="#9acd32">
                      <xsl:if test='(contains(translate($alltext, "FAIL", "fail"),"fail"))'>
                        <xsl:attribute name='bgcolor'>red</xsl:attribute>
                      </xsl:if>
				      <th align="left">Results</th>      
				    </tr>
				    <xsl:for-each select="string-array/string">
				    <tr>
				      <td bgcolor="#DAF5A4"><xsl:if test='(contains(translate(node(), "FAIL", "fail"),"fail"))'><xsl:attribute name='bgcolor'>#FFD6D6</xsl:attribute></xsl:if><xsl:value-of select="node()" /></td>      
				    </tr>
				    </xsl:for-each>
				  </table>
				  <div>
				  	<form method="post" >
				  		<xsl:attribute name="action">
				  			<xsl:value-of select="$OohToggle" disable-output-escaping="yes" />
				  		</xsl:attribute>	
				  					  	
				  		<button name="oohToggle" value="true" type="submit" onClick="return confirm('Are you sure you wish to submit?')">Toggle OOH Status</button>
				  	</form>
				  </div>
				  </body>
				  </html>
			    </xsl:template>    
</xsl:stylesheet>