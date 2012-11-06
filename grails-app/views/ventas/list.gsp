
<%@ page import="based2.Ventas" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ventas.label', default: 'Ventas')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ventas" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ventas" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<fieldset class="form">
			    <g:form action="list" method="GET">
			        <div class="fieldcontain">
			            <label for="query">Buscar por direccion:</label>
			            <g:textField name="query" value="${params.query}"/>
			        </div>
			    </g:form>
			</fieldset>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="ventas.propiedad.label" default="Propiedad" /></th>
					
						<g:sortableColumn property="comision" title="${message(code: 'ventas.comision.label', default: 'Comision')}" />
					
						<th><g:message code="ventas.comprador.label" default="Comprador" /></th>
					
						<g:sortableColumn property="precio" title="${message(code: 'ventas.precio.label', default: 'Precio')}" />
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ventasInstanceList}" status="i" var="ventasInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ventasInstance.id}">${fieldValue(bean: ventasInstance, field: "propiedad")}</g:link></td>
					
						<td>${fieldValue(bean: ventasInstance, field: "comision")}</td>
					
						<td>${fieldValue(bean: ventasInstance, field: "comprador")}</td>
					
						<td>${fieldValue(bean: ventasInstance, field: "precio")}</td>
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ventasInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
