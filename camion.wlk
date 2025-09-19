import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	method validarCarga(unaCosa){
		if(cosas.contains(unaCosa)){
			throw "La cosa ++unaCosa++ ya está cargada"
		}
	}
	method validarDescarga(unaCosa){
		if(not cosas.contains(unaCosa)){
			throw "La cosa ++unaCosa++ no está cargada"
		}
	}
	/*method todoPesoParEn(carga){
		carga.filter(cosas => cosas.peso() % 2 == 0)
	}
	method todoPesoParEn(carga) {
    carga.all(cosa => cosa.peso() % 2 == 0)
	}*/
}

