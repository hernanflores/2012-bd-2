
<%@ page import="based2.PersonasTelefonos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'personasTelefonos.label', default: 'PersonasTelefonos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-personasTelefonos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-personasTelefonos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
					
						<th><g:message code="personasTelefonos.persona.label" default="Persona" /></th>
					
						<g:sortableColumn property="telefonoContacto" title="${message(code: 'personasTelefonos.telefonoContacto.label', default: 'Telefono Contacto')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personasTelefonosInstanceList}" status="i" var="personasTelefonosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personasTelefonosInstance.id}">${fieldValue(bean: personasTelefonosInstance, field: "persona")}</g:link></td>
					
						<td>${fieldValue(bean: personasTelefonosInstance, field: "telefonoContacto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personasTelefonosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
