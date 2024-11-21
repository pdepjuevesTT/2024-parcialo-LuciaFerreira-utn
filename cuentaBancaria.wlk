class CuentaBancaria{
    const property titulares = []
    var property montoActual

    var property tarjetaCredito // objeto
    var property porcentaje

    method leAlcanza(unMonto) = unMonto <= montoActual

    method gastarCC(montoCompra){
        montoActual -= montoCompra
    }

}

class TarjetaCredito inherits CuentaBancaria{
    var property cantidadCuotas 
    var property aPagar = []  

    method montoAPagar(monto) = monto * porcentaje / cantidadCuotas

    method pagarConTarjeta(objeto){
        aPagar.forEach({cuota => cuota + self.montoAPagar(objeto.monto())}) // revisar
    }

    method pagarUnaDeuda(mes){
        var nuevoMonto = montoActual - aPagar.get(mes)
        (nuevoMonto + aPagar.drop(mes)).asList()

    }


}
