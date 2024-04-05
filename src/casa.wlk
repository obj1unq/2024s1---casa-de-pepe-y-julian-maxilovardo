import cuentas.*
import estrategiasAhorro.*

object casa {
	var property cantidadViveres = 0
	var property reparaciones = 0
	var property cuentaElegida = cuentaCorriente
	var property estrategiaAhorro = full
	
	method gasto(cantidad){
		self.cuentaElegida().extracto(cantidad)
	}
	
	method enOrden(){
		return (not self.necesitaReparaciones()) && self.viveresSuficientes() 
	}
	
	method viveresSuficientes(){
		return self.cantidadViveres() >= self.viveresNecesarios()
	}
	
	method viveresNecesarios(){
		return 40
	}
	
	method necesitaReparaciones(){
		return reparaciones > 0
	}
	
	method maximoViveres(){
		return 100
	}
}
