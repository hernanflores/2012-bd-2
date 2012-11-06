package based2


class Propiedades {

	static hasMany = [pagos:Pagos]
	static belongsTo = DueOs
	
	String tipo
	String tipoContrato
	String direccion
	Float supCubierta
	Integer cantAmbientes
	Integer antiguedad
	Float valorPropiedad
	String clasificacion
	String estado
	Zonas zona
	DueOs dueño
	
	String status
	
	Long padronCatastral	//primary key
	
	/* Transients para el alta del dueño */
	String lugarTrabajo
	String nombre
	String apellido
	String domicilio
	Long documento
	
	String telefonoDeContacto
	static transients = ['telefonoDeContacto', 'documento', 'domicilio', 'apellido','nombre', 'lugarTrabajo' ]
	
	String toString() {
		return direccion
	}

    static constraints = {
		tipoContrato(inList:["venta", "alquiler"])
		estado(inList:["vendida", "alquilada", "disponible"])
		tipo(inList:["departamento", "casa", "quinta", "hotel", "chalet", "cabaña", "local comercial"])
		clasificacion(inList:["residencial", "familiar", "no habitable", "comercial"])
		padronCatastral(unique:true)
		status(display:false, nullable:true)
    }

    static mapping = {
//    	id name:'padronCatastral', generator:'assigned'
    }
}
