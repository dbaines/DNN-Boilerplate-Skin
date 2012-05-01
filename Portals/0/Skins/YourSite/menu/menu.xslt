<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
  <!ENTITY space "<xsl:text> </xsl:text>">
  <!ENTITY cr "<xsl:text>
</xsl:text>">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:param name="ControlID" />
	<xsl:param name="Options" />
    <xsl:param name="ManifestPath" />
  <xsl:template match="/*">
    <xsl:apply-templates select="root" />
  </xsl:template>
	<xsl:template match="root"> 
		<div id="{$ControlID}">
			<ul class="topLevelNav">
        <xsl:apply-templates select="node">
          <xsl:with-param name="nodeType">toplevel</xsl:with-param>
        </xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>
  <xsl:template match="node">
    <xsl:param name="nodeType" />
		<li>
      <xsl:variable name="nodeClass">
        <xsl:value-of select="$nodeType"/> 
        <xsl:if test="@separator = 1"> mmSeparator</xsl:if>
        <xsl:if test="@selected = 1"> mmSelected</xsl:if>
        <xsl:if test="@breadcrumb = 1"> mmBreadcrumb</xsl:if>
        <xsl:if test="@first = 1"> mmFirst</xsl:if>
        <xsl:if test="@last = 1"> mmLast</xsl:if>
        <xsl:if test="node"> mmHasChild</xsl:if>
        <xsl:text> navid-</xsl:text><xsl:value-of select="@id"/>
        <xsl:text> child-</xsl:text><xsl:value-of select="position()"/>
      </xsl:variable>
      <xsl:attribute name="class">
        <xsl:value-of select="$nodeClass"/>
      </xsl:attribute>      
      <xsl:choose>
        <xsl:when test="@enabled = 1">
          <a href="{@url}">
                <xsl:if test="@icon">
                    <img src="{@icon}" class="mmIcon" />
                </xsl:if>
                <xsl:value-of select="@text" />
                <xsl:if test="node and $nodeType = 'root'">                    
                </xsl:if>          </a>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="@icon">
            <img src="{@icon}" />
          </xsl:if>
            <span class="nolink"><xsl:value-of select="@text" /></span>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="node">
        <xsl:choose>
          <xsl:when test="$nodeType = 'root'">
                  <ul class="M">
                    <xsl:apply-templates select="node">
                      <xsl:with-param name="nodeType" >sublevel</xsl:with-param>
                    </xsl:apply-templates>
                  </ul>   
          </xsl:when>
          <xsl:otherwise>
            <ul>
              <xsl:apply-templates select="node">
                <xsl:with-param name="nodeType">sublevel</xsl:with-param>
              </xsl:apply-templates>
            </ul>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>      
    </li>
	</xsl:template>
</xsl:stylesheet>