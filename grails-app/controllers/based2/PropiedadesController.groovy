package based2

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
            propiedadesInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'propiedades.label', default: 'Propiedades'), id])
            redirect(action: "show", id: id)
        }
    }
}
