import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/services/http_exception.dart';
import '../models/usuario.dart';

class Auth with ChangeNotifier {
  List<Usuario> _list = [];

  int? _esAutenticado;
  int? _codigoUsuario;
  int? _esAdmin;

  bool get isAuth {
    return _esAutenticado != 0;
  }

  int? get codigoUsuario {
    return _codigoUsuario;
  }

  int? get esAutenticado {
    return _esAutenticado;
  }

  int? get esAdmin {
    return _esAdmin;
  }

  List<Usuario> get list {
    return _list;
  }

  Future<void> _authenticate(String nombreUsuario, String correo,
      String contrasena, String urlSegment) async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/user/$urlSegment');

    try {
      final response = await http.post(
        url,
        body: {
          'nombreUsuario': nombreUsuario,
          'correo': correo,
          'contrasena': contrasena,
        },
      );
      final data = jsonDecode(response.body);
      if (data['error'] != null) {
        throw HttpException(data['error']['message']);
      }
      _esAutenticado = data['esAutenticado'];
      _codigoUsuario = data['codigoUsuario'];
      _esAdmin = data['esAdmin'];
      notifyListeners();

      final prefs = await SharedPreferences
          .getInstance(); // token va qurilma xotirasiga tunel
      final userData = jsonEncode(
        {
          'esAutenticado': _esAutenticado,
          'codigoUsuario': _codigoUsuario,
          'esAdmin': _esAdmin
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(
      String nombreUsuario, String correo, String contrasena) async {
    return _authenticate(nombreUsuario, correo, contrasena, 'signUp.php');
  }

  Future<void> login(
      {String nombreUsuario = "",
      String correo = "",
      String contrasena = ""}) async {
    return _authenticate(nombreUsuario, correo, contrasena, 'signIn.php');
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final userData =
        jsonDecode(prefs.getString('userData')!) as Map<String, dynamic>;

    _esAutenticado = userData['esAutenticado'];
    _codigoUsuario = userData['codigoUsuario'];
    _esAdmin = userData['esAdmin'];
    notifyListeners();
    return true;
  }

  void logout() async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/user/logout.php');
    try {
      await http.post(
        url,
        body: {
          'codigoUsuario': _codigoUsuario.toString(),
        },
      );
    } catch (error) {
      rethrow;
    }

    _esAutenticado = null;
    _codigoUsuario = null;
    _esAdmin = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  Future<void> getUsuarios() async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/user/users.php');

    try {
      final response = await http.get(url);

      if (jsonDecode(response.body) != null) {
        final data = jsonDecode(response.body);
        final List<Usuario> loadedUsers = [];
        data.forEach((data) {
          loadedUsers.add(Usuario.fromJson(data));
        });

        _list = loadedUsers;
        notifyListeners();
      }
    } catch (e) {
      // No imprimir mensajes de error en el modo de depuración
      assert(() {
        print('Error de conexión: $e');
        return true;
      }());
    }
  }

  Future<void> updateUsuario(Usuario updateUsuario) async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/user/updateUser.php');
    final usuarioIndex = _list.indexWhere(
      (usuario) => usuario.codigoUsuario == updateUsuario.codigoUsuario,
    );
    if (usuarioIndex >= 0) {
      try {
        final response = await http.post(
          url,
          body: {
            updateUsuario.toJson(),
          },
        );
        updateUsuario = Usuario.fromJson(jsonDecode(response.body));
        _list[usuarioIndex] = updateUsuario;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
  }

  Future<void> bloquearUsuario(int codigoUsuario) async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/user/blockUser.php');
    final usuarioIndex = _list.indexWhere(
      (usuario) => usuario.codigoUsuario == codigoUsuario,
    );
    if (usuarioIndex >= 0) {
      try {
        final response = await http.post(
          url,
          body: {'codigoUsuario': codigoUsuario.toString(), 'esAdmin': 1.toString()},
        );
        Usuario updateUsuario = Usuario.fromJson(jsonDecode(response.body));
        _list[usuarioIndex] = updateUsuario;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
  }

  Future<void> actualizarDireccion(Usuario updateUsuario) async {
    final url = Uri.parse(
        'http://ivelitaunsa201920210.c1.is/api_medicapp/user/updateDirection.php');
    final usuarioIndex = _list.indexWhere(
      (usuario) => usuario.codigoUsuario == updateUsuario.codigoUsuario,
    );
    if (usuarioIndex >= 0) {
      try {
        final response = await http.post(
          url,
          body: {
            updateUsuario.toJson(),
          },
        );
        updateUsuario = Usuario.fromJson(jsonDecode(response.body));
        _list[usuarioIndex] = updateUsuario;
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
  }
}
