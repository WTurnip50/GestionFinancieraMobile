import 'dart:io';
import 'package:gestion_financiera_mov/Entities/Usuario.dart';
import 'package:gestion_financiera_mov/Managers/TransaccionesManager.dart';
import 'package:gestion_financiera_mov/Services/TransaccionesService.dart';

void main(List<String> arguments) {
  //print('Hello world: ${gestion_financiera_mov.calculate()}!');
  print('Introduce el nombre de usuario');
  String? nombre = stdin.readLineSync();
  print('Bienvenido $nombre:');
  bool salir = false;
  List<Usuario> operaciones = [];
  var service = TransaccionesService();
  var managers = TransaccionesManager(service);

  while(!salir){
    print('Seleccione una opcion:');
    print('1.Ingresar 2.Retirar 3.Edo de cuenta 4. Prespuestos 5.salir:');
    int? opcion = int.tryParse(stdin.readLineSync().toString());
    var add = Usuario();
    add.nombre = nombre!;
    add.opcion = opcion!;
    switch(opcion){
      case 1:
        Usuario user = managers.set_ingreso_usuario(add);
        operaciones.add(user);
      break;
      case 2:
      if(operaciones.isNotEmpty){
        var transaccion = managers.get_saldo(operaciones);
        if(transaccion.total > 0){
          Usuario user = managers.set_retiro_usuario(add, transaccion);
          operaciones.add(user);
        }else{
          print('No cuenta con saldo disponible, favor de ingresar saldo.');
        print('==================================');
        }
      }else{
        print('No existen operaciones registradas.');
        print('==================================');
      }
      break;
      case 5:
      salir = true;
      break;
    }
  }
}
