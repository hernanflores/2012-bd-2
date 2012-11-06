package based2

import grails.converters.*
import org.springframework.dao.DataIntegrityViolationException

class ContratosController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def list = Contratos.list (params)
		 
		if ( params.query ) {
			List<Contratos> newList = new ArrayList<Contratos>()
			list.each{
				CompradoresInquilinos titular = it.titular 
				println titular
				if(titular.apellido.toLowerCase().contains(params.query.toLowerCase())){
					newList.add(it)
				}
			}
			list = newList
		}
		
        [contratosInstanceList: list, contratosInstanceTotal: Contratos.count()]
    }

    def create() {
        [contratosInstance: new Contratos(params)]
    }

    def save() {
		
		def contratosInstance = new Contratos(params)
		//Si tengo que crear el titular lo creo primero
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
			
			contratosInstance.titular = titu
//			contratosInstance.titularId = titu.id
		}
        if (!contratosInstance.save(flush: true)) {
            render(view: "create", model: [contratosInstance: contratosInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contratos.label', default: 'Contratos'), contratosInstance.id])
        redirect(action: "show", id: contratosInstance.id)
    }

    def show(Long id) {
        def contratosInstance = Contratos.get(id)
        if (!contratosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "list")
            return
        }

        [contratosInstance: contratosInstance]
    }

    def edit(Long id) {
        def contratosInstance = Contratos.get(id)
        if (!contratosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "list")
            return
        }

        [contratosInstance: contratosInstance]
    }

    def update(Long id, Long version) {
        def contratosInstance = Contratos.get(id)
        if (!contratosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contratosInstance.version > version) {
                contratosInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contratos.label', default: 'Contratos')] as Object[],
                          "Another user has updated this Contratos while you were editing")
                render(view: "edit", model: [contratosInstance: contratosInstance])
                return
            }
        }

        contratosInstance.properties = params

        if (!contratosInstance.save(flush: true)) {
            render(view: "edit", model: [contratosInstance: contratosInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contratos.label', default: 'Contratos'), contratosInstance.id])
        redirect(action: "show", id: contratosInstance.id)
    }

    def delete(Long id) {
        def contratosInstance = Contratos.get(id)
        if (!contratosInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "list")
            return
        }

        try {
//            contratosInstance.delete(flush: true)
			contratosInstance.finOcup = new Date()
			contratosInstance.save(flush:true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "show", id: id)
        }
    }
	
	
	def ajaxPropiedades = {
		def query = {
			and{
				eq("estado","disponible")
				eq("tipoContrato","alquiler")
			}
			or {
			 ilike("direccion", "%${params.term}%") // term is the parameter send by jQuery autocomplete
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
	
	
	def listVigentes = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def c = Contratos.createCriteria()
		def results = c.list {
			ge("finOcup", new Date())
			order("finOcup", "asc")
		}
		
		render(view:"list", model: [contratosInstanceList: results, contratosInstanceTotal: Contratos.count()])
	}
	
	
	def listPorVencer = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def c = Contratos.createCriteria()
		def results = c.list {
			and{gt("finOcup", new Date()-7)
				le("finOcup", new Date()+7)}
			order("finOcup", "desc")
		}
		
		render(view:"list", model: [contratosInstanceList: results, contratosInstanceTotal: Contratos.count()])
	}
}
