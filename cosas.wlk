object knightRider {
	var property peso = 500
	var property nivelPeligrosidad = 10
	method peso() { return peso }
	method nivelPeligrosidad() { return nivelPeligrosidad }
	method pesoA(kilos){   peso = kilos }
}

object arenaAGranel{
	var property peso = 0
	var property nivelPeligrosidad = 1
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method pesoA(kilos){   peso = kilos }
}

object bumblebee{
	var property estaTransformadoRobot = false
	method peso() { return 800 }
	method nivelPeligrosidad() { 
		return if(estaTransformadoRobot){
			 30
		} else { 
			15
		}
	}
	method seTransforma(siono){ estaTransformadoRobot = siono }
}

object paqueteLadrillos{
	var property peso = 2
	var property cantidadLadrillos = 0 
	var property nivelPeligrosidad = 5
	method peso() { return peso * cantidadLadrillos }
	method nivelPeligrosidad() { return nivelPeligrosidad }
	method cantidadLadrillosA(cantidad){ cantidadLadrillos = cantidad }
}

object bateriaAntiaerea{
	var misiles = false
	method activarMisiles(siono){ misiles = siono }
	method peso() { 
		return if(misiles){
			300
		}else{
			200
		}
	}
	method nivelPeligrosidad() { 
		return if(misiles){
			100
		}else{
			0
		}
	}
}

object residuosRadiactivos{
	var property peso = 100
	method pesoA(kilos){ peso = kilos }
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
}

object contenedorPortuario{
	const property contenido = #{}
	method peso(){ return 100 + contenido.sum({cosa => cosa.peso()}) }
	method nivelPeligrosidad(){ 
		return if(contenido.isEmpty()){
				0
				}else{
					contenido.max({objeto => objeto.nivelPeligrosidad()}).nivelPeligrosidad()
				}
	}
	method cargar(unaCosa){ return contenido.add(unaCosa) }
	method descargar(unaCosa){ return contenido.remove(unaCosa) }
}

object embalaje{
	var property embalado = null
	method embalar(unaCosa){ embalado = unaCosa }
	method peso(){ return  embalado.peso()}
	method nivelPeligrosidad(){ return embalado.nivelPeligrosidad() / 2 }
}