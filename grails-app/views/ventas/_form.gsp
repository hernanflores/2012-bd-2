<%@ page import="based2.Ventas" %>

<r:require module="jquery-ui"/>
<g:javascript library="jquery" />

<style>
    .ui-autocomplete {
        max-height: 100px;
        overflow-y: auto;
        /* prevent horizontal scrollbar */
        overflow-x: hidden;
    }
    /* IE 6 doesn't support max-height
     * we use height instead, but this forces the menu to always be this tall
     */
    * html .ui-autocomplete {
        height: 100px;
    }
    </style>
		<g:javascript>
            $(document).ready(function() {
               $('#comauto1').autocomplete({
					 source: function(request, response){
					   $.ajax({
					    url: "/based2/ventas/ajaxPropiedades", // remote datasource
					    data: request,
					    success: function(data){
					     response(data); // set the response
					    },
					    error: function(){ // handle server errors
					     $.jGrowl("Unable to retrieve Companies", {
					      theme: 'ui-state-error ui-corner-all'   
					     });
					    }
					   });
					  },
					  minLength: 2, // triggered only after minimum 2 characters have been entered.
					  select: function(event, ui) { // event handler when user selects a company from the list.
					   $("#propiedad\\.id").val(ui.item.id); // update the hidden field.
					   $("#empId").val(ui.item.nasSymbol + "-") // populate the employee field with the nasdaq symbol.
					  }
					 });
					 
	                $('#comauto2').autocomplete({
					 source: function(request, response){
					   $.ajax({
					    url: "/based2/ventas/ajaxComprador", // remote datasource
					    data: request,
					    success: function(data){
					     response(data); // set the response
					    },
					    error: function(){ // handle server errors
					     $.jGrowl("Unable to retrieve Companies", {
					      theme: 'ui-state-error ui-corner-all'   
					     });
					    }
					   });
					  },
					  minLength: 2, // triggered only after minimum 2 characters have been entered.
					  select: function(event, ui) { // event handler when user selects a company from the list.
					   $("#comprador\\.id").val(ui.item.id); // update the hidden field.
					   $("#empId").val(ui.item.nasSymbol + "-") // populate the employee field with the nasdaq symbol.
					  }
					 });
					});    
        </g:javascript>


<script language="javascript">
function showmydiv() {
	
	if(document.getElementById('wrapperinvisible').style.visibility == "hidden"){ 
		document.getElementById('wrapperinvisible').style.visibility = "visible";
		document.getElementById('esconder').style.visibility = "hidden";
	}else{ 
		document.getElementById('wrapperinvisible').style.visibility = "hidden"; 
		document.getElementById('esconder').style.visibility = "visible";
	} 
}
</script>


<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'comision', 'error')} required">
	<label for="comision">
		<g:message code="ventas.comision.label" default="Comision" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="comision" value="${fieldValue(bean: ventasInstance, field: 'comision')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="ventas.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: ventasInstance, field: 'precio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'propiedad', 'error')} required">
	<label for="propiedad">
		<g:message code="ventas.propiedad.label" default="Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="propiedad.id"></g:hiddenField> 
	<g:textField name="comauto1" id="comauto1" style="width: 300px;"> </g:textField>
	<!-- g:select id="propiedad" name="propiedad.id" from="${based2.Propiedades.createCriteria().list{
			and{
				eq("estado","disponible")
				eq("tipoContrato","venta")
				}
			}}" optionKey="id" required="" value="${ventasInstance?.propiedad?.id}" class="many-to-one"/-->
</div>

<div id="esconder" class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'comprador', 'error')} required">
	<label for="comprador">
		<g:message code="ventas.comprador.label" default="Comprador" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="comprador.id"></g:hiddenField> 
	<g:textField name="comauto2" id="comauto2" style="width: 300px;"> </g:textField>
	<!-- g:select id="comprador" name="comprador.id" from="${based2.CompradoresInquilinos.list()}" optionKey="id" required="" value="${ventasInstance?.comprador?.id}" class="many-to-one"/ -->
</div>
<!-- FIELDS PARA ALTA TITULAR -->

<div class="fieldcontain required">
	<label for="crearTitular">
		<g:message code="contratos.titular.label" default="¿Crear nuevo comprador?" />
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="crearTitular" value="${false}" onclick="showmydiv()"/>
</div>

<div id="wrapperinvisible" style="visibility:hidden">
	<span class="required-indicator">Todos los campos son requeridos</span>
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="contratos.nombre.label" default="Nombre Comprador" />
	</label>
	<g:textField name="nombre" value="${contratosInstance?.nombre}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="contratos.apellido.label" default="Apellido Comprador" />
	</label>
	<g:textField name="apellido" value="${contratosInstance?.apellido}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'domicilio', 'error')} ">
	<label for="domicilio">
		<g:message code="contratos.domicilio.label" default="Domicilio Comprador" />
	</label>
	<g:textField name="domicilio" value="${contratosInstance?.domicilio}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'documento', 'error')} ">
	<label for="documento">
		<g:message code="contratos.documento.label" default="DNI Comprador" />
	</label>
	<g:textField name="documento" value="${contratosInstance?.documento}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'lugarTrabajo', 'error')} ">
	<label for="lugarTrabajo">
		<g:message code="contratos.lugarTrabajo.label" default="Lugar de trabajo" />
	</label>
	<g:textField name="lugarTrabajo" value="${contratosInstance?.lugarTrabajo}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'telefonoDeContacto', 'error')} ">
	<label for="telefonoDeContacto">
		<g:message code="contratos.telefonoDeContacto.label" default="Telefono de Contacto" />
	</label>
	<g:textField name="telefonoDeContacto" value="${contratosInstance?.telefonoDeContacto}"/>
	</div>

</div>