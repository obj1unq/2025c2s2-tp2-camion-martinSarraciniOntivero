object knightRider {
	var property peso = 500
	var property nivelPeligrosidad = 10
	method peso() { return peso }
	method nivelPeligrosidad() { return nivelPeligrosidad }
	method bulto() { return 1 }
	method accidente(){
		
	}
}

object arenaAGranel{
	var property peso = 0
	var property nivelPeligrosidad = 1
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1 }
	method accidente(){
		 peso += 20
	}
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
	method bulto() { return 2 }
	method accidente(){
		 self.seTransforma(self.transformacionContraria())
	}
	method transformacionContraria(){
	return if(estaTransformadoRobot == true){
			false
		}else{
			true
		} //no estoy seguro de hacerlo asi
	}
}

object paqueteLadrillos{
	var property peso = 2
	var property cantidadLadrillos = 0 
	var property nivelPeligrosidad = 5
	method peso() { return peso * cantidadLadrillos }
	method nivelPeligrosidad() { return nivelPeligrosidad }
	method bulto() { 
		return if(cantidadLadrillos <= 100){
		 			1
		}else if(cantidadLadrillos > 100 and cantidadLadrillos <= 300){
			 2
		}else{
			 3
		}
	}
	method accidente(){
		 if(cantidadLadrillos >= 12){
		 	cantidadLadrillos -= 12
		 }else{
		 	cantidadLadrillos = 0
		 }
	}
}

object bateriaAntiaerea{
	var property misiles = false
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
	method bulto() {  
		return if(misiles){
			2
		}else{
			1
		}
	}
	method accidente(){
		misiles = false
	}
}

object residuosRadiactivos{
	var property peso = 100
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	method bulto() { return 1 }
	method accidente(){
		 peso += 15
	}
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
	method bulto(){
		return if(contenido.isEmpty()){
			1
		}else{
			1 + contenido.sum({objeto => objeto.bulto()}) 
		}
	}
	method accidente(){
		contenido.forEach({cosa => cosa.accidente()})
	}
}

object embalaje{
	var property embalado = null
	method embalar(unaCosa){ embalado = unaCosa }
	method peso(){ return  embalado.peso()}
	method nivelPeligrosidad(){ return embalado.nivelPeligrosidad() / 2 }
	method bulto() { return 2 }
	method accidente(){

	}
}