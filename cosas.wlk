object knightRider {
	var property peso = 500
	var property nivelPeligrosidad = 10
	method peso() { return peso }
	method nivelPeligrosidad() { return nivelPeligrosidad }
}

object arenaAGranel{
	var property peso = 0 
	var property nivelPeligrosidad = 1
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method pesoA(kilos){   peso = kilos }
}

object bumblebee{
	var property estaTransformado = false
	method peso() { return 300 }
	method nivelPeligrosidad() { 
		return if(estaTransformado){
			 30
		} else { 
			15
		}
	}
	method seTransforma(siono){ estaTransformado = siono }
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