<%@ page import="based2.CompradoresInquilinos" %>



<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="compradoresInquilinos.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${compradoresInquilinosInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="compradoresInquilinos.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${compradoresInquilinosInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'domicilio', 'error')} required">
	<label for="domicilio">
		<g:message code="compradoresInquilinos.domicilio.label" default="Domicilio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="domicilio" required="" value="${compradoresInquilinosInstance?.domicilio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'documento', 'error')} required">
	<label for="documento">
		<g:message code="compradoresInquilinos.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="documento" type="number" value="${compradoresInquilinosInstance.documento}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'lugarTrabajo', 'error')} ">
	<label for="lugarTrabajo">
		<g:message code="compradoresInquilinos.lugarTrabajo.label" default="Lugar Trabajo" />
		
	</label>
	<g:textField name="lugarTrabajo" value="${compradoresInquilinosInstance?.lugarTrabajo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'telefonoDeContacto', 'error')} ">
	<label for="telefonoDeContacto">
		<g:message code="compradoresInquilinos.telefonoDeContacto.label" default="Telefono De Contacto" />
		
	</label>
	<g:textField name="telefonoDeContacto" value="${compradoresInquilinosInstance?.telefonoDeContacto}"/>
</div>