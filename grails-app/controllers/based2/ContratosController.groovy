package based2

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
            contratosInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contratos.label', default: 'Contratos'), id])
            redirect(action: "show", id: id)
        }
    }
}
