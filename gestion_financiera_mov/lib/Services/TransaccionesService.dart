import 'dart:io';
import 'package:gestion_financiera_mov/Entities/Transaccion.dart';
import 'package:gestion_financiera_mov/Entities/Usuario.dart';
import 'package:gestion_financiera_mov/Services/Interfaces/ITransaccionService.dart';

class TransaccionesService implements ITransaccionesService{
  @override
  Usuario ingreso_usuario(Usuario usuario) {
    // TODO: implement ingreso_usuario
    var user = usuario;
    print('Introduce la cantidad a ingresar:'); 
    double? ingreso = double.tryParse(stdin.readLineSync().toString());
    print('Introduzca el concepto de la operación: ');
    String? concepto = stdin.readLineSync();
    user.ingresos = ingreso!;
    user.concepto = concepto!;
    user.nombre = usuario.nombre;
    return user;
  }
  
  @override
  Usuario retiro_usuario(Usuario usuario, Transaccion transaccion) {
    // TODO: implement retiro_usuario
    var user = usuario;
    var saldo = transaccion;
    var total = saldo.total;
    var flag = false;
    while(!flag){
      print('Saldo: $total');
      print('Introduce la cantidad a ingresar:'); 
      double? ingreso = double.tryParse(stdin.readLineSync().toString());
      if(ingreso! > saldo.total){
        print('Saldo insuficiente');
      }else{
        print('Introduzca el concepto de la operación: ');
        String? concepto = stdin.readLineSync();
        user.retiros = ingreso;
        user.concepto = concepto!;
        user.nombre = usuario.nombre;
        return user;
      }
    }
  }

  @override
  Transaccion calcular_saldo(List<Usuario> users) {
    var saldo = Transaccion();
    double ingresos = 0.0;
    double retiros = 0.0;
    for (var item in users) {
      switch(item.opcion){
        case 1:
        ingresos += item.ingresos;
        break;
        case 2:
        retiros += item.retiros;
        break;
      }
    }
    saldo.ingresos = ingresos;
    saldo.retiros = retiros;
    saldo.total = ingresos - retiros; // Cálculo del saldo total
  return saldo;
  }

}