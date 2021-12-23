<?xml version="1.0" encoding="UTF-8"?>
<!-- PARCIAL1_PARTE2_GRUPO06 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>  
  <xsl:template match="registro">
    <html>
      <header>
        <title>Registro de Facturas </title>
        <style>
            table.colapsado {border-collapse: collapse; border: 1px solid black;}   
            td.arriba, th {border-collapse: collapse; border: none; text-align: left;  padding: 5px;}        
            table.detalle {border-collapse: collapse; border: 1px solid black;}
            
             td.detalle, th.detalle {
                    border: 1px solid black; 
                    border-collapse: collapse; 
                    text-align: left;  
                    padding: 5px;}
        </style>
      </header>
      <body>
        <h1 align="center"> Registro de Facturas</h1>
        
          <xsl:apply-templates select="factura"/>
      
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="factura">
    <xsl:if test="@tipo='final'"> <!-- Para seleccionar solo de consumidor final-->
    <table style="width:100%" class="colapsado" border="1" >
      <tr>
          <th > Factura No. </th>
          <td class="arriba"><u><xsl:value-of select="num"/></u> </td>
          <th cospan="2">Tipo: Consumidor Final </th>
          
      </tr>
      <tr>
          <th colspan="4">Cliente </th>      
      </tr>
      <tr>
        <th> Nombre: </th>
        <td class="arriba"><xsl:value-of select="cliente/nombre"/></td>
        <th>Documento: </th>
        <td class="arriba"><xsl:value-of select="cliente/documento"/></td>
      </tr>
      <tr>
        <th>Telefono: </th>
        <td class="arriba"><xsl:value-of select="cliente/telefono"/></td>
        <th>Email: </th>
        <td class="arriba"><xsl:value-of select="cliente/email"/></td>       
      </tr>
      </table>
       
    <table style="width:100%" class="detalle" >
    <tr >
            <th class="detalle">código</th>
            <th class="detalle">detalle</th>
            <th class="detalle">cantidad</th>
            <th class="detalle">precio</th>
            <th class="detalle">subtotal</th>
        </tr> 
    <tr>
    
    <td class="detalle" ><xsl:value-of select="lineafactura/codigo"/></td>
    <td class="detalle"><xsl:value-of select="lineafactura/detalle"/></td>   
    <td class="detalle"><xsl:value-of select="lineafactura/cantidad"/></td>   
    <td class="detalle"><xsl:value-of select="lineafactura/precio"/></td>
    <td class="detalle"><xsl:value-of select="lineafactura/subtotal"/></td>         
   </tr>
   <tr>
            <td class="detalle" colspan="4" style="text-align: right;"><b>TOTAL</b></td>
            <td class="detalle"><xsl:value-of select="total/moneda"/><xsl:value-of select="total/valor"/></td>
        </tr>
  </table> 
    <br></br><br></br><br></br>
    </xsl:if>  
    
    <xsl:if test="@tipo='credito'"> <!--  Para selecionar los de credito fiscal-->
        <table style="width:100%" class="colapsado" border="1" >
      <tr>
          <th > Factura No. </th>
          <td class="arriba"><u><xsl:value-of select="num"/></u> </td>
          <th cospan="2">Tipo: Comprobante de Credito Fiscal </th>
          
      </tr>
      <tr>
          <th colspan="4">Cliente </th>      
      </tr>
      <tr>
        <th> Nombre: </th>
        <td class="arriba"><xsl:value-of select="cliente/nombre"/></td>
        <th>Documento: </th>
        <td class="arriba"><xsl:value-of select="cliente/documento"/></td>
      </tr>
      <tr>
        <th>Telefono: </th>
        <td class="arriba"><xsl:value-of select="cliente/telefono"/></td>
        <th>Email: </th>
        <td class="arriba"><xsl:value-of select="cliente/email"/></td>       
      </tr>
      </table>
       
    <table style="width:100%" class="detalle" >
    <tr >
            <th class="detalle">código</th>
            <th class="detalle">detalle</th>
            <th class="detalle">cantidad</th>
            <th class="detalle">precio</th>
            <th class="detalle">subtotal</th>
        </tr> 
    <tr>
    
    <td class="detalle" ><xsl:value-of select="lineafactura/codigo"/></td>
    <td class="detalle"><xsl:value-of select="lineafactura/detalle"/></td>   
    <td class="detalle"><xsl:value-of select="lineafactura/cantidad"/></td>   
    <td class="detalle"><xsl:value-of select="lineafactura/precio"/></td>
    <td class="detalle"><xsl:value-of select="lineafactura/subtotal"/></td>         
   </tr>
   <tr>
            <td class="detalle" colspan="4" style="text-align: right;"><b>TOTAL</b></td>
            <td class="detalle"><xsl:value-of select="total/moneda"/><xsl:value-of select="total/valor"/></td>
        </tr>
  </table> 
    <br></br><br></br><br></br>    
    </xsl:if>
  </xsl:template>
  

</xsl:stylesheet>
