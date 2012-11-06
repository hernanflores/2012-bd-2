<%@ page import="based2.Propiedades" %>



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

<div class="fieldcontain ${hasErrors(bean: propiedadesInstance, field: 'dueño', 'error')} required">
	<label for="dueño">
		<g:message code="propiedades.dueño.label" default="Dueño" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dueño" name="dueño.id" from="${based2.DueOs.list()}" optionKey="id" required="" value="${propiedadesInstance?.dueño?.id}" class="many-to-one"/>
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

