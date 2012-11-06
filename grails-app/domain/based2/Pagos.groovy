package based2


class Pagos {
	static belongsTo = [contrato: Contratos]

	Date fechaPago
	String periodo
	String status
	//	Long nroSerieCont

	String toString() {
		return periodo
	}

	static mapping = {
		//    	id name:'nroSerieCont', generator:'assigned'
	}

	static constraints = { status(display:false, nullable:true) }
}
