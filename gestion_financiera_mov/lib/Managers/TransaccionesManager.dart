import 'package:gestion_financiera_mov/Entities/Transaccion.dart';
import 'package:gestion_financiera_mov/Entities/Usuario.dart';
import 'package:gestion_financiera_mov/Services/Interfaces/ITransaccionService.dart';
class TransaccionesManager{
  late final ITransaccionesService _service;
  TransaccionesManager(ITransaccionesService service){
    _service = service;
  }
  Usuario set_ingreso_usuario(Usuario usuario){
    return _service.ingreso_usuario(usuario);
  }
  Usuario set_retiro_usuario(Usuario usuario, Transaccion transaccion){
    return _service.retiro_usuario(usuario, transaccion);
  }
  Transaccion get_saldo(List<Usuario>users){
    return _service.calcular_saldo(users);
  }
  Usuario set_categoria(Usuario usuario){
    return _service.obtener_categorias(usuario);
  }
}