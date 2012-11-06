<%@ page import="based2.Zonas" %>



<div class="fieldcontain ${hasErrors(bean: zonasInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="zonas.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${zonasInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: zonasInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="zonas.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${zonasInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: zonasInstance, field: 'propiedades', 'error')} ">
	<label for="propiedades">
		<g:message code="zonas.propiedades.label" default="Propiedades" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${zonasInstance?.propiedades?}" var="p">
    <li><g:link controller="propiedades" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="propiedades" action="create" params="['zonas.id': zonasInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'propiedades.label', default: 'Propiedades')])}</g:link>
</li>
</ul>

</div>

