
<%@ page import="based2.DueOs" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dueOs.label', default: 'Dueños')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dueOs" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dueOs" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<fieldset class="form">
			    <g:form action="list" method="GET">
			        <div class="fieldcontain">
			            <label for="query">Buscar por apellido:</label>
			            <g:textField name="query" value="${params.query}"/>
			        </div>
			    </g:form>
			</fieldset>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'dueOs.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'dueOs.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="domicilio" title="${message(code: 'dueOs.domicilio.label', default: 'Domicilio')}" />
					
						<g:sortableColumn property="documento" title="${message(code: 'dueOs.documento.label', default: 'Documento')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dueOsInstanceList}" status="i" var="dueOsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dueOsInstance.id}">${fieldValue(bean: dueOsInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: dueOsInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: dueOsInstance, field: "domicilio")}</td>
					
						<td>${fieldValue(bean: dueOsInstance, field: "documento")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dueOsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
