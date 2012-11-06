package based2


class Ventas {

	Float precio
	Float comision
	CompradoresInquilinos comprador
	Propiedades propiedad
	String status

	static mapping = {
    	//id composite:['padronCatastral', 'compradorId']
    }
	
	def afterInsert() {
		propiedad.setEstado("vendida")
		propiedad.setTipoContrato("venta")
	}
	
	String toString() {
		return id
	}

    static constraints = {
		status(display:false, nullable:true)
    }
}
