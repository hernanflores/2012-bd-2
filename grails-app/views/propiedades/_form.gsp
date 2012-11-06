<%@ page import="based2.Propiedades" %>

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
               $('#comauto').autocomplete({
					 source: function(request, response){
					   $.ajax({
					    url: "/based2/propiedades/ajaxDueos", // remote datasource
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
					   $("#dueño\\.id").val(ui.item.id); // update the hidden field.
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

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'tipoContrato', 'error')} ">
	<label for="tipoContrato">
		<g:message code="propiedades.tipoContrato.label" default="Tipo Contrato" />
		
	</label>
	<g:select name="tipoContrato" from="${propiedadesInstance.constraints.tipoContrato.inList}" value="${propiedadesInstance?.tipoContrato}" valueMessagePrefix="propiedades.tipoContrato" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="propiedades.estado.label" default="Estado" />
		
	</label>
	<g:select name="estado" from="${propiedadesInstance.constraints.estado.inList}" value="${propiedadesInstance?.estado}" valueMessagePrefix="propiedades.estado" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="propiedades.tipo.label" default="Tipo" />
		
	</label>
	<g:select name="tipo" from="${propiedadesInstance.constraints.tipo.inList}" value="${propiedadesInstance?.tipo}" valueMessagePrefix="propiedades.tipo" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'clasificacion', 'error')} ">
	<label for="clasificacion">
		<g:message code="propiedades.clasificacion.label" default="Clasificacion" />
		
	</label>
	<g:select name="clasificacion" from="${propiedadesInstance.constraints.clasificacion.inList}" value="${propiedadesInstance?.clasificacion}" valueMessagePrefix="propiedades.clasificacion" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'padronCatastral', 'error')} required">
	<label for="padronCatastral">
		<g:message code="propiedades.padronCatastral.label" default="Padron Catastral" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="padronCatastral" type="number" value="${propiedadesInstance.padronCatastral}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'antiguedad', 'error')} required">
	<label for="antiguedad">
		<g:message code="propiedades.antiguedad.label" default="Antiguedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="antiguedad" type="number" value="${propiedadesInstance.antiguedad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'cantAmbientes', 'error')} required">
	<label for="cantAmbientes">
		<g:message code="propiedades.cantAmbientes.label" default="Cant Ambientes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantAmbientes" type="number" value="${propiedadesInstance.cantAmbientes}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'direccion', 'error')} ">
	<label for="direccion">
		<g:message code="propiedades.direccion.label" default="Direccion" />
		
	</label>
	<g:textField name="direccion" value="${propiedadesInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'supCubierta', 'error')} required">
	<label for="supCubierta">
		<g:message code="propiedades.supCubierta.label" default="Sup Cubierta" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="supCubierta" value="${fieldValue(bean: propiedadesInstance, field: 'supCubierta')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'valorPropiedad', 'error')} required">
	<label for="valorPropiedad">
		<g:message code="propiedades.valorPropiedad.label" default="Valor Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valorPropiedad" value="${fieldValue(bean: propiedadesInstance, field: 'valorPropiedad')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'zona', 'error')} required">
	<label for="zona">
		<g:message code="propiedades.zona.label" default="Zona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="zona" name="zona.id" from="${based2.Zonas.list()}" optionKey="id" required="" value="${propiedadesInstance?.zona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'dueño', 'error')} required">
	<label for="dueño">
		<g:message code="propiedades.dueño.label" default="Dueño" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="dueño.id"></g:hiddenField> 
	<g:textField name="comauto" id="comauto" style="width: 300px;"> </g:textField>
	<!-- g:select id="dueño" name="dueño.id" from="${based2.DueOs.list()}" optionKey="id" required="" value="${propiedadesInstance?.dueño?.id}" class="many-to-one"/ -->
</div>


<!-- FIELDS PARA ALTA TITULAR -->

<div class="fieldcontain required">
	<label for="crearTitular">
		<g:message code="propiedades.titular.label" default="¿Crear nuevo Dueño?" />
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="crearTitular" value="${false}" onclick="showmydiv()"/>
</div>

<div id="wrapperinvisible" style="visibility:hidden">
	<span class="required-indicator">Todos los campos son requeridos</span>
	<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="propiedades.nombre.label" default="Nombre Dueño" />
	</label>
	<g:textField name="nombre" value="${propiedadesInstance?.nombre}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="propiedades.apellido.label" default="Apellido Dueño" />
	</label>
	<g:textField name="apellido" value="${propiedadesInstance?.apellido}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'domicilio', 'error')} ">
	<label for="domicilio">
		<g:message code="propiedades.domicilio.label" default="Domicilio Dueño" />
	</label>
	<g:textField name="domicilio" value="${propiedadesInstance?.domicilio}"/>
	</div>
		
	<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'documento', 'error')} ">
	<label for="documento">
		<g:message code="propiedades.documento.label" default="DNI Dueño" />
	</label>
	<g:textField name="documento" value="${propiedadesInstance?.documento}"/>
	</div>

	
	<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'telefonoDeContacto', 'error')} ">
	<label for="telefonoDeContacto">
		<g:message code="propiedades.telefonoDeContacto.label" default="Telefono de Contacto" />
	</label>
	<g:textField name="telefonoDeContacto" value="${propiedadesInstance?.telefonoDeContacto}"/>
	</div>

</div>