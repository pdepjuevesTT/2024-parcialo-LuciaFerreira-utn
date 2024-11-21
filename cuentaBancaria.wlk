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
    var property cuotasPermitidas
    var property aPagar = []  // lista de objetos
    var property mes




}
