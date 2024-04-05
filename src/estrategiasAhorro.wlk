import casa.*
import cuentas.*

object minimoEIndispensable{
	var property calidad = 1
	
	method hacerMantenimiento(){
		if(not casa.viveresSuficientes()){
			casa.gasto((casa.viveresNecesarios() - casa.cantidadViveres()) * calidad)
			casa.cantidadViveres(casa.viveresNecesarios())
		}
	}
}

object full{
	var property calidad = 5
	
	method hacerMantenimiento(){
		if(casa.enOrden()){
			casa.gasto(casa.maximoViveres()- casa.cantidadViveres())
			casa.cantidadViveres(casa.maximoViveres())
		}else{
			casa.gasto(casa.viveresNecesarios() * self.calidad())
			casa.cantidadViveres(casa.cantidadViveres() + casa.viveresNecesarios())
		}
		self.hacerReparacionesSiSePuede()
	}
	
	method hacerReparacionesSiSePuede(){
		if(self.puedeReparar()){
			casa.gasto(casa.reparaciones())
			casa.reparaciones(0)
		}
	}
	
	method puedeReparar(){
		return casa.cuentaElegida().saldo() > (casa.reparaciones() + 1000)
	}
}