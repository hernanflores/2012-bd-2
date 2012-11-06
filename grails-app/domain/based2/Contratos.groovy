package based2


import java.text.SimpleDateFormat

class Contratos {
	
	static hasMany = [pagos: Pagos]
	
	Long nroSerie
	Date fechaCont
	Date inicioOcup
	Date finOcup
	Float monto
	Escribanos escribano
	CompradoresInquilinos titular
	Propiedades propiedad
	
	String status
	
	/* Transients para el alta del inquilino */
	String lugarTrabajo
	String nombre
	String apellido
	String domicilio
	Long documento
	
	String telefonoDeContacto
	static transients = ['telefonoDeContacto', 'documento', 'domicilio', 'apellido','nombre', 'lugarTrabajo' ]
	
	String toString() {
		return nroSerie
	}
	
	def afterInsert() {
		propiedad.setEstado("alquilada")
		propiedad.setTipoContrato("alquiler")
	}

	static mapping = {
    }

    static constraints = {
		nroSerie(unique:true)
		finOcup(min: new SimpleDateFormat("dd/MM/yyyy").parse(
			new SimpleDateFormat("dd/MM/yyyy").format(new Date())))
		inicioOcup(min: new SimpleDateFormat("dd/MM/yyyy").parse(
			new SimpleDateFormat("dd/MM/yyyy").format(new Date())))
		fechaCont(min: new SimpleDateFormat("dd/MM/yyyy").parse(
			new SimpleDateFormat("dd/MM/yyyy").format(new Date())))
		
		status(display:false, nullable:true)
    }
}
