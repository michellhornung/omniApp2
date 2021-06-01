import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';

class FotoUsuario extends StatefulWidget {
  IconData icone;
  double alturaAppBar;

  FotoUsuario({required this.icone, required this.alturaAppBar});

  @override
  State<FotoUsuario> createState() => _FotoUsuarioState();
}

class _FotoUsuarioState extends State<FotoUsuario> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: corBranca,
            borderRadius: BorderRadius.circular(40),
            boxShadow: <BoxShadow>[
              const BoxShadow(color: corVerde, spreadRadius: 3)
            ]),
        child: Icon(
          widget.icone,
          size: widget.alturaAppBar,
          color: corCinza,
        ));
  }
}
