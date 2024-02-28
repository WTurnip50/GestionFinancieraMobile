import 'package:gestion_financiera_mov/Entities/Transaccion.dart';
import 'package:gestion_financiera_mov/Entities/Usuario.dart';

abstract class ITransaccionesManager{
  Usuario set_ingreso_usuario(Usuario usuario);
  Usuario set_retiro_usuario(Usuario usuario, Transaccion transaccion);
  Usuario set_categoria(Usuario usuario);
  Transaccion get_saldo(List<Usuario>users);
}