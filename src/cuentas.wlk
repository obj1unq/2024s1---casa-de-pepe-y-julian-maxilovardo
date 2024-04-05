object cuentaCorriente {
	var property saldo = 0
	
	method deposito(_saldo){
		self.saldo(saldo + _saldo)
	}
	
	method extracto(_saldo){
		if(self.saldo() > _saldo){
			self.saldo(saldo - _saldo)
		}
	}
}

object cuentaConGastos {
	var property saldo = 0
	var property costoOperacion = 0
	
	method deposito(_saldo){
		self.saldo(saldo + _saldo - self.costoOperacion())
	}
	
	method extracto(_saldo){
		if(self.saldo() > _saldo){
			self.saldo(saldo - _saldo)
		}
	}
}

object cuentaCombinada {
	var property primaria
	var property secundaria
	
	method saldo(){
		return self.primaria().saldo() + self.secundaria().saldo()
	}
	
	method deposito(_saldo){
		self.primaria().deposito(_saldo)
	}
	
	method extracto(_saldo){
		if(self.primaria().saldo() > _saldo){
			self.primaria().extracto(_saldo)
		}else{
			self.secundaria().extracto(_saldo)
		}
	}
}