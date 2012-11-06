<%@ page import="based2.Contratos" %>



<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'nroSerie', 'error')} required">
	<label for="nroSerie">
		<g:message code="contratos.nroSerie.label" default="Nro Serie" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nroSerie" type="number" value="${contratosInstance.nroSerie}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'finOcup', 'error')} required">
	<label for="finOcup">
		<g:message code="contratos.finOcup.label" default="Fin Ocup" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="finOcup" precision="day"  value="${contratosInstance?.finOcup}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'inicioOcup', 'error')} required">
	<label for="inicioOcup">
		<g:message code="contratos.inicioOcup.label" default="Inicio Ocup" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="inicioOcup" precision="day"  value="${contratosInstance?.inicioOcup}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'fechaCont', 'error')} required">
	<label for="fechaCont">
		<g:message code="contratos.fechaCont.label" default="Fecha Cont" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaCont" precision="day"  value="${contratosInstance?.fechaCont}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'escribano', 'error')} required">
	<label for="escribano">
		<g:message code="contratos.escribano.label" default="Escribano" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="escribano" name="escribano.id" from="${based2.Escribanos.list()}" optionKey="id" required="" value="${contratosInstance?.escribano?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="contratos.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: contratosInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'pagos', 'error')} ">
	<label for="pagos">
		<g:message code="contratos.pagos.label" default="Pagos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contratosInstance?.pagos?}" var="p">
    <li><g:link controller="pagos" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="pagos" action="create" params="['contratos.id': contratosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'pagos.label', default: 'Pagos')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'propiedad', 'error')} required">
	<label for="propiedad">
		<g:message code="contratos.propiedad.label" default="Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="propiedad" name="propiedad.id" from="${based2.Propiedades.createCriteria().list{
			and{
				eq("estado","disponible")
				eq("tipoContrato","alquiler")
				}
			}}" optionKey="id" required="" value="${contratosInstance?.propiedad?.id}" class="many-to-one"/>
	<!-- g:select id="propiedad" name="propiedad.id" from="${based2.Propiedades.list()}" optionKey="id" required="" value="${contratosInstance?.propiedad?.id}" class="many-to-one"/ -->
</div>

<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'titular', 'error')} required">
	<label for="titular">
		<g:message code="contratos.titular.label" default="Titular" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="titular" name="titular.id" from="${based2.CompradoresInquilinos.list()}" optionKey="id" required="" value="${contratosInstance?.titular?.id}" class="many-to-one"/>
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
		<g:message code="contratos.nombre.label" default="Nombre Titular" />
		
	</label>
	<g:textField name="nombre" value="${contratosInstance?.nombre}"/>
</div>
	
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="contratos.apellido.label" default="Apellido Titular" />
		
	</label>
	<g:textField name="apellido" value="${contratosInstance?.apellido}"/>
</div>
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'domicilio', 'error')} ">
	<label for="domicilio">
		<g:message code="contratos.domicilio.label" default="Domicilio Titular" />
		
	</label>
	<g:textField name="domicilio" value="${contratosInstance?.domicilio}"/>
</div>
	
	<div class="fieldcontain ${hasErrors(bean: contratosInstance, field: 'documento', 'error')} ">
	<label for="documento">
		<g:message code="contratos.documento.label" default="DNI Titular" />
		
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