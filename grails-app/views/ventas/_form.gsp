<%@ page import="based2.Ventas" %>



<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'comision', 'error')} required">
	<label for="comision">
		<g:message code="ventas.comision.label" default="Comision" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="comision" value="${fieldValue(bean: ventasInstance, field: 'comision')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="ventas.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: ventasInstance, field: 'precio')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'propiedad', 'error')} required">
	<label for="propiedad">
		<g:message code="ventas.propiedad.label" default="Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="propiedad" name="propiedad.id" from="${based2.Propiedades.createCriteria().list{
			and{
				eq("estado","disponible")
				eq("tipoContrato","venta")
				}
			}}" optionKey="id" required="" value="${ventasInstance?.propiedad?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ventasInstance, field: 'comprador', 'error')} required">
	<label for="comprador">
		<g:message code="ventas.comprador.label" default="Comprador" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comprador" name="comprador.id" from="${based2.CompradoresInquilinos.list()}" optionKey="id" required="" value="${ventasInstance?.comprador?.id}" class="many-to-one"/>
</div>
<!-- FIELDS PARA ALTA TITULAR -->

<div class="fieldcontain required">
	<label for="crearTitular">
		<g:message code="contratos.titular.label" default="¿Crear nuevo titular?" />
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="crearTitular" value="${false}" />
</div>


	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="contratos.nombre.label" default="Nombre Comprador" />
		
	</label>
	<g:textField name="nombre" value="${contratosInstance?.nombre}"/>
</div>
	
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="contratos.apellido.label" default="Apellido Comprador" />
		
	</label>
	<g:textField name="apellido" value="${contratosInstance?.apellido}"/>
</div>
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'domicilio', 'error')} ">
	<label for="domicilio">
		<g:message code="contratos.domicilio.label" default="Domicilio Comprador" />
		
	</label>
	<g:textField name="domicilio" value="${contratosInstance?.domicilio}"/>
</div>
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'documento', 'error')} ">
	<label for="documento">
		<g:message code="contratos.documento.label" default="DNI Comprador" />
		
	</label>
	<g:textField name="documento" value="${contratosInstance?.documento}"/>
</div>
	
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'lugarTrabajo', 'error')} ">
	<label for="lugarTrabajo">
		<g:message code="contratos.lugarTrabajo.label" default="Lugar de trabajo" />
		
	</label>
	<g:textField name="lugarTrabajo" value="${contratosInstance?.lugarTrabajo}"/>
</div>

	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'telefonoDeContacto', 'error')} ">
	<label for="telefonoDeContacto">
		<g:message code="contratos.telefonoDeContacto.label" default="Telefono de Contacto" />
		
	</label>
	<g:textField name="telefonoDeContacto" value="${contratosInstance?.telefonoDeContacto}"/>
</div>