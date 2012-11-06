<%@ page import="based2.Escribanos" %>



<div class="fieldcontain ${hasErrors(bean: escribanosInstance, field: 'nroMatricula', 'error')} required">
	<label for="nroMatricula">
		<g:message code="escribanos.nroMatricula.label" default="Nro Matricula" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nroMatricula" type="number" value="${escribanosInstance.nroMatricula}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: escribanosInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="escribanos.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${escribanosInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escribanosInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="escribanos.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${escribanosInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escribanosInstance, field: 'domicilio', 'error')} required">
	<label for="domicilio">
		<g:message code="escribanos.domicilio.label" default="Domicilio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="domicilio" required="" value="${escribanosInstance?.domicilio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: escribanosInstance, field: 'documento', 'error')} required">
	<label for="documento">
		<g:message code="escribanos.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="documento" type="number" value="${escribanosInstance.documento}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: escribanosInstance, field: 'dirEstudio', 'error')} ">
	<label for="dirEstudio">
		<g:message code="escribanos.dirEstudio.label" default="Dir Estudio" />
		
	</label>
	<g:textField name="dirEstudio" value="${escribanosInstance?.dirEstudio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compradoresInquilinosInstance, field: 'telefonoDeContacto', 'error')} ">
	<label for="telefonoDeContacto">
		<g:message code="compradoresInquilinos.telefonoDeContacto.label" default="Telefono De Contacto" />
		
	</label>
	<g:textField name="telefonoDeContacto" value="${compradoresInquilinosInstance?.telefonoDeContacto}"/>
</div>