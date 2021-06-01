import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/components/menu_customizado.dart';
import 'package:omni_chat_telas_novas/helper/estados.dart';
import 'package:omni_chat_telas_novas/screens/em_atendimento.dart';

import '../constants_cores.dart';
import 'foto_usuario.dart';

class MyAppBarCuston extends StatefulWidget {
  MyAppBarCuston(
      {Key? key,
      required this.tipo,
      required this.alturaTela,
      required this.alturaAppBar,
      required this.alturaAppStatus,
      required this.listaMenu})
      : super(key: key);

  final bool tipo;
  final double alturaTela;
  final double alturaAppBar;
  final double alturaAppStatus;
  final List<String> listaMenu;

  Icon iconeRetornado() {
    if (tipo) {
      return Icon(Icons.group_add);
    } else {
      return Icon(Icons.notifications);
    }
  }

  @override
  State<MyAppBarCuston> createState() => _MyAppBarCustonState();
}

class _MyAppBarCustonState extends State<MyAppBarCuston> {
  var imagem = const AssetImage('assets/images/logo-lhtec.png');

  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaImagem = widget.alturaAppBar * 0.3;
    double alturaRow = widget.alturaAppBar * 0.43;

    return Container(
      height: widget.alturaAppBar,
      width: larguraTela,
      color: corCinza200,
      child: Column(
        children: [
          SizedBox(
            height: widget.alturaAppStatus,
          ),
          Image(
            image: imagem,
            height: alturaImagem,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: alturaRow,
            child: Row(
              children: [
                FotoUsuario(
                  icone: Icons.person,
                  alturaAppBar: widget.alturaAppBar * 0.40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        "Nome do usuario",
                        style: const TextStyle(color: corPreto),
                      ),
                      Text(
                        "00:00:00",
                        style: const TextStyle(color: corPreto),
                      )
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                EstadoMenuAtendimento.instance.exitNotificacao || widget.tipo
                    ? widget.iconeRetornado()
                    : Container(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        EstadoMenuAtendimento.instance.openMenu();
                      });
                    },
                    icon: Icon(
                      Icons.pause_circle_filled,
                      color: EstadoMenuAtendimento.instance.showMenu
                          ? corBlueGrey
                          : corPreto,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
