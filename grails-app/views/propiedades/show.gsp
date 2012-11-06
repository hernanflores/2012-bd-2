
<%@ page import="based2.Propiedades" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'propiedades.label', default: 'Propiedades')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-propiedades" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-propiedades" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list propiedades">
			
				<g:if test="${propiedadesInstance?.tipoContrato}">
				<li class="fieldcontain">
					<span id="tipoContrato-label" class="property-label"><g:message code="propiedades.tipoContrato.label" default="Tipo Contrato" /></span>
					
						<span class="property-value" aria-labelledby="tipoContrato-label"><g:fieldValue bean="${propiedadesInstance}" field="tipoContrato"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="propiedades.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${propiedadesInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="propiedades.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${propiedadesInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.clasificacion}">
				<li class="fieldcontain">
					<span id="clasificacion-label" class="property-label"><g:message code="propiedades.clasificacion.label" default="Clasificacion" /></span>
					
						<span class="property-value" aria-labelledby="clasificacion-label"><g:fieldValue bean="${propiedadesInstance}" field="clasificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.padronCatastral}">
				<li class="fieldcontain">
					<span id="padronCatastral-label" class="property-label"><g:message code="propiedades.padronCatastral.label" default="Padron Catastral" /></span>
					
						<span class="property-value" aria-labelledby="padronCatastral-label"><g:fieldValue bean="${propiedadesInstance}" field="padronCatastral"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="propiedades.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${propiedadesInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.antiguedad}">
				<li class="fieldcontain">
					<span id="antiguedad-label" class="property-label"><g:message code="propiedades.antiguedad.label" default="Antiguedad" /></span>
					
						<span class="property-value" aria-labelledby="antiguedad-label"><g:fieldValue bean="${propiedadesInstance}" field="antiguedad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.cantAmbientes}">
				<li class="fieldcontain">
					<span id="cantAmbientes-label" class="property-label"><g:message code="propiedades.cantAmbientes.label" default="Cant Ambientes" /></span>
					
						<span class="property-value" aria-labelledby="cantAmbientes-label"><g:fieldValue bean="${propiedadesInstance}" field="cantAmbientes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="propiedades.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${propiedadesInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.dueño}">
				<li class="fieldcontain">
					<span id="dueño-label" class="property-label"><g:message code="propiedades.dueño.label" default="Dueño" /></span>
					
						<span class="property-value" aria-labelledby="dueño-label"><g:link controller="dueOs" action="show" id="${propiedadesInstance?.dueño?.id}">${propiedadesInstance?.dueño?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.pagos}">
				<li class="fieldcontain">
					<span id="pagos-label" class="property-label"><g:message code="propiedades.pagos.label" default="Pagos" /></span>
					
						<g:each in="${propiedadesInstance.pagos}" var="p">
						<span class="property-value" aria-labelledby="pagos-label"><g:link controller="pagos" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.supCubierta}">
				<li class="fieldcontain">
					<span id="supCubierta-label" class="property-label"><g:message code="propiedades.supCubierta.label" default="Sup Cubierta" /></span>
					
						<span class="property-value" aria-labelledby="supCubierta-label"><g:fieldValue bean="${propiedadesInstance}" field="supCubierta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.valorPropiedad}">
				<li class="fieldcontain">
					<span id="valorPropiedad-label" class="property-label"><g:message code="propiedades.valorPropiedad.label" default="Valor Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="valorPropiedad-label"><g:fieldValue bean="${propiedadesInstance}" field="valorPropiedad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${propiedadesInstance?.zona}">
				<li class="fieldcontain">
					<span id="zona-label" class="property-label"><g:message code="propiedades.zona.label" default="Zona" /></span>
					
						<span class="property-value" aria-labelledby="zona-label"><g:link controller="zonas" action="show" id="${propiedadesInstance?.zona?.id}">${propiedadesInstance?.zona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${propiedadesInstance?.id}" />
					<g:link class="edit" action="edit" id="${propiedadesInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
