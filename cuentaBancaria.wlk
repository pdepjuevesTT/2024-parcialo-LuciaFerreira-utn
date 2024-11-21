class CuentaBancaria{
    const property titulares = []
    var property montoActual

    var property tarjetaCredito // objeto
    var property porcentaje

    method interes(monto) = monto * porcentaje

    method leAlcanza(unMonto) = unMonto <= montoActual

    method esPropietario(persona) = titulares.contains(persona.nombre())

    method gastarCC(montoCompra){
        montoActual -= montoCompra
    }

    method depositar(cantidad){
        montoActual+=cantidad
    }

    method deudasVencidas() = tarjetaCredito.deudasVencidas() 

}

class TarjetaCredito inherits CuentaBancaria{
    var property cantidadCuotas 
    var property aPagar = []  
    var property cuotasVencidas = [] 

    method montoAPagar(monto) = monto + self.interes(monto) / cantidadCuotas

    method pagarConTarjeta(objeto){
        aPagar.forEach({cuota => cuota + self.montoAPagar(objeto.monto())}) // revisar
    }

    method pagarUnaDeuda(mes){
        var nuevoMonto = montoActual - aPagar.get(mes)
        (nuevoMonto + aPagar.drop(mes)).asList()
    }

    method cuotaAnterior(mes) = aPagar.get(mes-1)

    method deudasVencidas(mes){
        var cuotaAnterior = self.cuotaAnterior(mes)
        if(!cuotaAnterior == 0)
            cuotasVencidas.add(self.cuotaAnterior(mes))
    }
}
