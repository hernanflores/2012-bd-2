package based2

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
            ventasInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ventas.label', default: 'Ventas'), id])
            redirect(action: "show", id: id)
        }
    }
}
