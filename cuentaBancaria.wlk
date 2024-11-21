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

}

class TarjetaCredito inherits CuentaBancaria{
    var property cantidadCuotas 
    var property aPagar = []  

    method montoAPagar(monto) = monto + self.interes(monto) / cantidadCuotas

    method pagarConTarjeta(objeto){
        aPagar.forEach({cuota => cuota + self.montoAPagar(objeto.monto())}) // revisar
    }

    method pagarUnaDeuda(mes){
        var nuevoMonto = montoActual - aPagar.get(mes)
        (nuevoMonto + aPagar.drop(mes)).asList()

    }

}
