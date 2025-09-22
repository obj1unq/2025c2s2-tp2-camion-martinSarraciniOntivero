import cosas.*

object camion {
	const property cosas = #{}
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
			self.error("La cosa ++unaCosa++ ya está cargada")
		}
	}
	method validarDescarga(unaCosa){
		if(not cosas.contains(unaCosa)){
			self.error("La cosa ++unaCosa++ no está cargada")
		}
	}

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
		return cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	method cosasMasPeligrosasQue(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method cosasMasPeligrosasQueOtraCosa(unaCosa){
		return self.cosasMasPeligrosasQue(unaCosa.nivelPeligrosidad())
	}
	method hayCosasMasPeligrosasQue(nivel){
		return cosas.any({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method puedeCircularEnRutaNivel(nivel){
		return not self.excesoDePeso() and not self.hayCosasMasPeligrosasQue(nivel)
	}
	method tieneAlgunaCargaEntre( min, max){
		return cosas.any({cosa => cosa.peso() >= min and cosa.peso() <= max})
	}
	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}
	method pesosDeCargas(){
		return cosas.map({cosa => cosa.peso()})
	}
	method cantidadDeBultos(){
		return cosas.sum({cosa => cosa.bulto()})
	}
	method accidente(){
		cosas.forEach({cosa => cosa.accidente()})
	}
	method transportar (destino,camino){
		camino.puedeCircular()
		destino.cargarTodo()
	}
}



object almacen{
	var property cosasAlmacen = #{}
	method cargarTodo(){
		camion.cosas().forEach({elemento => self.cargar(elemento)})
		camion.cosas().clear()
	}
	method cargar(unaCosa){
		self.validarCarga(unaCosa)
		cosasAlmacen.add(unaCosa)
	}
	method validarCarga(unaCosa){
		if(cosasAlmacen.contains(unaCosa)){
			self.error("La cosa ++unaCosa++ ya está cargada")
		}
	}
}

object ruta9{
	method puedeCircular(){
		if(camion.cosasMasPeligrosasQue(20).size()>0 || camion.excesoDePeso()){
			self.error("no se puede realizar el viaje porque hay cosas muy peligrosas o exceso de peso")
		}
	}
}

object caminosVecinales{
	var property pesoMaximo = 0
	method puedeCircular(){
		if (camion.pesoTotal() > pesoMaximo){
			self.error("No puede realizarse el viaje por caminos vecinales por exceso de peso")
		}
	}
} 
