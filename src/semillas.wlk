class Plantas{
	
	var property anioDeObtencion
	var property altura
	var property horasDeSol
	
	method esFuerte(){
		
		return self.horasDeSol() > 10
	}
	
	method parcelaIdeal(parcela)

   method estaBienAsociada(parcela){
   	
   	return  parcela.parcelaEcologica(self) or parcela.parcelaIndustrial(self)
   }

}

class Menta inherits Plantas{
	
	override method horasDeSol(){
		
		return 6
	}
	
	method espacioQueOcupa(){
		
		return altura * 3
	}
	
	method daNuevasSemillas(){
		
		return self.esFuerte() or  altura > 0.4
	}
	
	override method parcelaIdeal(parcela){
		
		return parcela.superficie() > 6
		
		
	}
	

}

class Soja inherits Plantas{
	
	
	override method horasDeSol(){
		
		if(altura  < 0.5){
			
			return 6
			
		}else if(0.5 < altura < 1){
			
			return 7
			
		}else{
			
			return 9
		}
	}
	
	method espacioQueOcupa(){
		
		return altura / 2 
	}
	
	method daNuevasSemillas(){
		
		return self.esFuerte() or  anioDeObtencion > 2007 and altura > 1
	}
	
	override method parcelaIdeal(parcela){
		
		return parcela.horasDeSol() == self.horasDeSol()
		
		
	}
	
	

}

class Quinoa inherits Plantas{
	
	
	method espacioQueOcupa(){
		
		return 0.5
	}
	
	method daNuevasSemillas(){
		
		return self.esFuerte() or anioDeObtencion < 2007
	}
	
	override method parcelaIdeal(parcela){
		
	
	return parcela.plantas().all({planta => planta.altura() < 1.5})
			
	}


}

class SogaTrasgenica inherits Soja{
	
	
	override method daNuevasSemillas(){
		
		return false 
	}
	
	override method parcelaIdeal(parcela){
		
		return parcela.plantas().size() == 1
		
		
	}
	
}

class HierbaBuena inherits Menta{
	
	override method espacioQueOcupa(){
		
		return (altura * 3) * 2
	}
}


