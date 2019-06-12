import semillas.*


class Parcelas{ 
	
	var property ancho 
	var property largo
	var property horasDeSol 
	var property plantas = []
	
	
	method superficie(){
		
		return ancho * largo 
	}
	
	method cantidadMaximaDeTolerancia(){
		
		if(ancho > largo){
			
		return self.superficie() / 5 
		
		}else{
			
	    return  self.superficie() / 3 + largo 
		
		}
		
	}
	
	method tieneComplicaciones(){
		
		return plantas.any({planta => planta.horasDeSol() < horasDeSol})
	}
	
	method plantarUnaPlanta(planta){
		
		plantas.add(planta)
		self.superaCantidadDePlantas(planta)
			
	}
	
	method superaCantidadDePlantas(planta){
		
	 if(self.cantidadMaximaDeTolerancia() == plantas.size() or horasDeSol + 2 > plantas.horasDeSol()){
			
		  self.error("supera cantidad de plantas")
			
			
		}
	}
	
	method parcelaEcologica(planta){
		
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
	
	method parcelaIndustrial(planta){
		
		return plantas.size() >= 2 and planta.esFuerte()
	}
	
	method plantasBienAsociadas(){
		
		return plantas.filter({planta => planta.estaBienASociada(self)})
	
	}
	
	method cantDePlantasBienAsocadas(){
		
		return self.plantasBienAsociadas().size()
	}
	
	
	
}

object inta{
	
	var property parcelas = []
	
	method promedioDePlantas(){
		
		return self.cantDePlantas() / parcelas.size()
	}
	
	method cantDePlantas(){
		
		return parcelas.sum({parcela => parcela.plantas().size()})
	}
	
	method masAutosustentable(){
		
		self.parcelasConMasDe4Plantas().max({parcela => parcela.cantDePlantasBienAsocadas() })
	}
	
 
	method parcelasConMasDe4Plantas(){
		
	  return parcelas.filter({parcela => parcela.plantas().size() > 4})
	}
	
	
}



