
<%@ page import="based2.Escribanos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escribanos.label', default: 'Escribanos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-escribanos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-escribanos" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="nroMatricula" title="${message(code: 'escribanos.nroMatricula.label', default: 'Nro Matricula')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'escribanos.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'escribanos.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="domicilio" title="${message(code: 'escribanos.domicilio.label', default: 'Domicilio')}" />
					
						<g:sortableColumn property="documento" title="${message(code: 'escribanos.documento.label', default: 'Documento')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${escribanosInstanceList}" status="i" var="escribanosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${escribanosInstance.id}">${fieldValue(bean: escribanosInstance, field: "nroMatricula")}</g:link></td>
					
						<td>${fieldValue(bean: escribanosInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: escribanosInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: escribanosInstance, field: "domicilio")}</td>
					
						<td>${fieldValue(bean: escribanosInstance, field: "documento")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${escribanosInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
