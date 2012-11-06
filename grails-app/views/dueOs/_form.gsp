<%@ page import="based2.DueOs" %>



<div class="fieldcontain ${hasErrors(bean: dueOsInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="dueOs.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${dueOsInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dueOsInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="dueOs.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${dueOsInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dueOsInstance, field: 'domicilio', 'error')} required">
	<label for="domicilio">
		<g:message code="dueOs.domicilio.label" default="Domicilio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="domicilio" required="" value="${dueOsInstance?.domicilio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dueOsInstance, field: 'documento', 'error')} required">
	<label for="documento">
		<g:message code="dueOs.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="documento" type="number" value="${dueOsInstance.documento}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: dueOsInstance, field: 'propiedades', 'error')} ">
	<label for="propiedades">
		<g:message code="dueOs.propiedades.label" default="Propiedades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${dueOsInstance?.propiedades?}" var="p">
    <li><g:link controller="propiedades" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="propiedades" action="create" params="['dueOs.id': dueOsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'propiedades.label', default: 'Propiedades')])}</g:link>
</li>
</ul>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'telefonoDeContacto', 'error')} ">
	<label for="telefonoDeContacto">
		<g:message code="compradoresInquilinos.telefonoDeContacto.label" default="Telefono De Contacto" />
		
	</label>
	<g:textField name="telefonoDeContacto" value="${compradoresInquilinosInstance?.telefonoDeContacto}"/>
</div>

</div>

