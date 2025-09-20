import cosas.*

object camion {
	const property cosas = #{arenaAGranel, bumblebee}
	method pesoTara(){ return 1000 }
	method cosas() { return cosas }
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
	/*method sonPesoParEn(carga){
		carga.filter({carga => carga.peso() % 2 == 0})
	}*/
	method todoPesoParEn(carga) {
    return carga.all({cosa => cosa.peso() % 2 == 0})
	}

	method tieneCargaConPeso(kilogramo){
		return cosas.any({cosa => cosa.peso() == kilogramo})
	}

	method pesoTotal() {
		return self.pesoTara() + cosas.sum({cosa => cosa.peso()})
	}
	method excesoDePeso() {
		return self.pesoTotal() > 2500
	}
	method tieneCargaConPeligrosidad(nivel){
		return cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	method cosasMasPeligrosasQue(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQueOtraCosa(unaCosa){
		return self.cosasMasPeligrosasQue(unaCosa.nivelPeligrosidad())
	}
	
}

