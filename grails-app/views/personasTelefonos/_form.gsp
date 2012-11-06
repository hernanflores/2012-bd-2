<%@ page import="based2.PersonasTelefonos" %>



<div class="fieldcontain ${hasErrors(bean: personasTelefonosInstance, field: 'persona', 'error')} required">
	<label for="persona">
		<g:message code="personasTelefonos.persona.label" default="Persona" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="persona" name="persona.id" from="${based2.Personas.list()}" optionKey="id" required="" value="${personasTelefonosInstance?.persona?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personasTelefonosInstance, field: 'telefonoContacto', 'error')} ">
	<label for="telefonoContacto">
		<g:message code="personasTelefonos.telefonoContacto.label" default="Telefono Contacto" />
		
	</label>
	<g:textField name="telefonoContacto" value="${personasTelefonosInstance?.telefonoContacto}"/>
</div>

