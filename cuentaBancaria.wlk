class CuentaBancaria{
    const property titulares = []
    const property montoMax 
    var property tarjetaCredito // objeto
    var property porcentaje

    method leAlcanza(unMonto) = unMonto <= montoMax

    method pagarConTarjeta(unMonto){
        self.leAlcanza(unMonto) // ver
    }

}

class TarjetaCredito inherits CuentaBancaria{
    var property cuotas 
}
