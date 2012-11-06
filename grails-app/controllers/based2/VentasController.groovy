package based2

import grails.converters.*
import org.springframework.dao.DataIntegrityViolationException

class VentasController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def list = Ventas.list (params)
		 
		if ( params.query ) {
			List<Ventas> newList = new ArrayList<Ventas>()
			list.each{
				Propiedades propiedad = it.propiedad
				println propiedad
				if(propiedad.direccion.toLowerCase().contains(params.query.toLowerCase())){
					newList.add(it)
				}
			}
			list = newList
		}
        [ventasInstanceList: list, ventasInstanceTotal: Ventas.count()]
    }

    def create() {
        [ventasInstance: new Ventas(params)]
    }

    def save() {
        def ventasInstance = new Ventas(params)
		
		if(params.crearTitular == 'on'){
			CompradoresInquilinos titu = new CompradoresInquilinos()
			titu.lugarTrabajo =   params.lugarTrabajo
			titu.nombre =   params.nombre
			titu.apellido =   params.apellido
			titu.domicilio =   params.domicilio
			titu.documento =   Long.valueOf(params.documento as String)
			titu.lugarTrabajo = params.lugarTrabajo
			
			titu.addToTelefonosContacto(new PersonasTelefonos(telefonoContacto : params.telefonoDeContacto))
			titu.save(flush: true)
			
			ventasInstance.comprador = titu
//			contratosInstance.titularId = titu.id
		}
		
        if (!ventasInstance.save(flush: true)) {
            render(view: "create", model: [ventasInstance: ventasInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ventas.label', default: 'Ventas'), ventasInstance.id])
        redirect(action: "show", id: ventasInstance.id)
    }

    def show(Long id) {
        def ventasInstance = Ventas.get(id)
        if (!ventasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        [ventasInstance: ventasInstance]
    }

    def edit(Long id) {
        def ventasInstance = Ventas.get(id)
        if (!ventasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        [ventasInstance: ventasInstance]
    }

    def update(Long id, Long version) {
        def ventasInstance = Ventas.get(id)
        if (!ventasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ventasInstance.version > version) {
                ventasInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ventas.label', default: 'Ventas')] as Object[],
                          "Another user has updated this Ventas while you were editing")
                render(view: "edit", model: [ventasInstance: ventasInstance])
                return
            }
        }

        ventasInstance.properties = params

        if (!ventasInstance.save(flush: true)) {
            render(view: "edit", model: [ventasInstance: ventasInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ventas.label', default: 'Ventas'), ventasInstance.id])
        redirect(action: "show", id: ventasInstance.id)
    }

    def delete(Long id) {
        def ventasInstance = Ventas.get(id)
        if (!ventasInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
            return
        }

        try {
//            ventasInstance.delete(flush: true)
			Propiedades prop = ventasInstance.propiedad
			prop.estado = "disponible"
			prop.save(flush:true)
			
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def ajaxPropiedades = {
		def query = {
			and{
				eq("estado","disponible")
				eq("tipoContrato","venta")
			}
			or {
			 ilike("direccion", "${params.term}%") // term is the parameter send by jQuery autocomplete
			}
			projections { // good to select only the required columns.
				property("id")
				property("direccion")
			   }
		   }
		   def clist = Propiedades.createCriteria().list(query) // execute  to the get the list of companies
		   def propList = [] // to add each company details
		   clist.each {
				def propMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
				propMap.put("id", it[0])
				propMap.put("label", it[1])
				propMap.put("value", it[1])
				propMap.put("direccion", it[1]) // will use this to pre-populate the Emp Id
				propList.add(propMap) // add to the arraylist
		 }
		 render (propList as JSON)
	}
	
	def ajaxComprador = {
		def query = {
			or {
			 ilike("nombre", "${params.term}%") // term is the parameter send by jQuery autocomplete
			 ilike("apellido", "${params.term}%")
			}
			projections { // good to select only the required columns.
				property("id")
				property("apellido")
				property("nombre")
			   }
		   }
		   def clist = CompradoresInquilinos.createCriteria().list(query) // execute  to the get the list of companies
		   def compradorList = [] // to add each company details
		   clist.each {
			def compradorMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
			compradorMap.put("id", it[0])
			compradorMap.put("label", it[2] +" "+ it[1])
			compradorMap.put("value", it[2] +" "+ it[1])
			compradorMap.put("apellido", it[1]) // will use this to pre-populate the Emp Id
			compradorList.add(compradorMap) // add to the arraylist
		 }
		 render (compradorList as JSON)
	}
}
