import 'package:flutter/cupertino.dart';

class EstadoMenuAtendimento extends ChangeNotifier {
  static EstadoMenuAtendimento instance = EstadoMenuAtendimento();
  bool showMenu = false;
  int qtNotificacoes = 0;
  bool exitNotificacao = false;

  openMenu() {
    showMenu = !showMenu;
    notifyListeners();
  }

  chamarNotif() {
    if (qtNotificacoes > 0) {
      exitNotificacao = true;
    }
    notifyListeners();
  }
}


