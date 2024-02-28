import 'package:gestion_financiera_mov/Entities/Transaccion.dart';
import 'package:gestion_financiera_mov/Entities/Usuario.dart';

abstract class ITransaccionesService{
  Usuario ingreso_usuario(Usuario usuario);
  Usuario retiro_usuario(Usuario usuario, Transaccion transaccion);
  Transaccion calcular_saldo(List<Usuario> users);
  Usuario obtener_categorias(Usuario usuario);
}