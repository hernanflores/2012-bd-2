package based2

import grails.converters.*
import org.springframework.dao.DataIntegrityViolationException

class PropiedadesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def list = Propiedades.createCriteria().list (params) {
			if ( params.query ) {
				ilike("direccion", "%${params.query}%")
			}
		}
        [propiedadesInstanceList: list, propiedadesInstanceTotal: list.totalCount]
    }

    def create() {
        [propiedadesInstance: new Propiedades(params)]
    }

    def save() {
        def propiedadesInstance = new Propiedades(params)
		
		if(params.crearTitular == 'on'){
			DueOs due = new DueOs()
			due.nombre =   params.nombre
			due.apellido =   params.apellido
			due.domicilio =   params.domicilio
			due.documento =   Long.valueOf(params.documento as String)
			
			due.addToTelefonosContacto(new PersonasTelefonos(telefonoContacto : params.telefonoDeContacto))
			due.save(flush: true)
			
			propiedadesInstance.dueño = due
//			contratosInstance.titularId = titu.id
		}
        if (!propiedadesInstance.save(flush: true)) {
            render(view: "create", model: [propiedadesInstance: propiedadesInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), propiedadesInstance.id])
        redirect(action: "show", id: propiedadesInstance.id)
    }

    def show(Long id) {
        def propiedadesInstance = Propiedades.get(id)
        if (!propiedadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "list")
            return
        }

        [propiedadesInstance: propiedadesInstance]
    }

    def edit(Long id) {
        def propiedadesInstance = Propiedades.get(id)
        if (!propiedadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "list")
            return
        }

        [propiedadesInstance: propiedadesInstance]
    }

    def update(Long id, Long version) {
        def propiedadesInstance = Propiedades.get(id)
        if (!propiedadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (propiedadesInstance.version > version) {
                propiedadesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'propiedades.label', default: 'Propiedades')] as Object[],
                          "Another user has updated this Propiedades while you were editing")
                render(view: "edit", model: [propiedadesInstance: propiedadesInstance])
                return
            }
        }

        propiedadesInstance.properties = params

        if (!propiedadesInstance.save(flush: true)) {
            render(view: "edit", model: [propiedadesInstance: propiedadesInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), propiedadesInstance.id])
        redirect(action: "show", id: propiedadesInstance.id)
    }

    def delete(Long id) {
        def propiedadesInstance = Propiedades.get(id)
        if (!propiedadesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "list")
            return
        }

        try {
//            propiedadesInstance.delete(flush: true)
			propiedadesInstance.estado = "eliminada"
			propiedadesInstance.save(flush:true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def ajaxDueos = {
		def query = {
			or {
			 like("nombre", "${params.term}%") // term is the parameter send by jQuery autocomplete
			 like("apellido", "${params.term}%")
			}
			projections { // good to select only the required columns.
				property("id")
				property("apellido")
				property("nombre")
			   }
		   }
		   def clist = DueOs.createCriteria().list(query) // execute  to the get the list of companies
		   def dueñosSelectList = [] // to add each company details
		   clist.each {
			def dueñosMap = [:] // add to map. jQuery autocomplete expects the JSON object to be with id/label/value.
			dueñosMap.put("id", it[0])
			dueñosMap.put("label", it[2] +" "+ it[1])
			dueñosMap.put("value", it[2] +" "+ it[1])
			dueñosMap.put("apellido", it[1]) // will use this to pre-populate the Emp Id
			dueñosSelectList.add(dueñosMap) // add to the arraylist
		 }
		 render (dueñosSelectList as JSON)
	}
}
