import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/components/botoes_baixo.dart';
import 'package:omni_chat_telas_novas/components/foto_usuario.dart';
import 'package:omni_chat_telas_novas/components/menu_customizado.dart';
import 'package:omni_chat_telas_novas/components/my_app_bar_custom.dart';
import 'package:omni_chat_telas_novas/components/balaozinhos.dart';
import 'package:omni_chat_telas_novas/components/conversasChat.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';
import 'package:omni_chat_telas_novas/helper/estados.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

double larguraTelaGlobal = 0.0;
double alturaTelaGlobal = 0.0;

class _ChatScreenState extends State<ChatScreen> {
  List<String> listaMenu = [
    "Almoço",
    "Back Office",
    "Banheiro",
    "Café",
    "Demostração",
    "Particular"
  ];

  @override
  Widget build(BuildContext context) {
    double alturaAppStatus = MediaQuery.of(context).padding.top;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaAppBar = alturaAppStatus + (0.13 * alturaTela);

    var appBar = MyAppBarCuston(
      tipo: false,
      alturaTela: alturaTela,
      alturaAppBar: alturaAppBar,
      alturaAppStatus: alturaAppStatus,
      listaMenu: listaMenu,
    );

    double alturaTelaDisponivel = alturaTela - appBar.alturaAppBar;

    return AnimatedBuilder(
        animation: EstadoMenuAtendimento.instance,
        builder: (context, child) {
          return Material(
            color: corBranca,
            child: Stack(
              children: [
                Column(
                  children: [
                    MyAppBarCuston(
                        tipo: true,
                        alturaTela: alturaTela,
                        alturaAppBar: alturaAppBar,
                        alturaAppStatus: alturaAppStatus,
                        listaMenu: listaMenu),
                  ],
                ),
                EstadoMenuAtendimento.instance.showMenu
                    ? Positioned(
                        right: larguraTela * 0.07,
                        top: alturaAppBar * 0.9,
                        child: MenuCustom(listaMenu: listaMenu))
                    : Container()
              ],
            ),
          );
        });
  }

  List<Chatmessage> mensagens = [
    Chatmessage("Ola como esta", "enviado"),
    Chatmessage("Ola como esta", "recebido"),
    Chatmessage("Ola como esta", "enviado"),
    Chatmessage("Ola como esta", "recebido"),
  ];

  Widget _chatPersonalisado(BuildContext context, int index) {
    const double r = 3.5;
    if (mensagens[index].messageType == "enviado") {
      return ListTile(
        title: ClipPath(
          clipper: ClipRThread(r),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(r)),
            child: Container(
              //constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
              padding: const EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
              color: Colors.white,
              //padding: EdgeInsets.all(10),
              child: Text(
                mensagens[index].messageContent,
                softWrap: true,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      );
    } else {
      return ListTile(
        title: ClipPath(
          clipper: ClipRThread(r),
          child: ClipRRect(
            borderRadius: BorderRadius.all(const Radius.circular(r)),
            child: Container(
              //constraints: BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
              padding: const EdgeInsets.fromLTRB(8.0 + 2 * r, 8.0, 8.0, 8.0),
              color: Colors.greenAccent,
              //padding: EdgeInsets.all(10),
              child: Text(
                mensagens[index].messageContent,
                softWrap: true,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _caixaUsuario() {
    return ClipRRect(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius:
                BorderRadius.only(topRight: const Radius.circular(40))),
        child: Expanded(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Atendimento na Fila: nome da Fila"),
                    Row(
                      children: [
                        Text(
                          "Nome do Contato ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          " está digitando...",
                        ),
                      ],
                    ),
                    Text('Ticket: #09080787')
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  onSelected: (int item) {},
                  color: Colors.white,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.update,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Atualizar",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.history,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Histórico Cliente",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 3,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Transferir Atendimento",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 4,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.flag,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Lembrete de Retorno",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 5,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.assistant_rounded,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Classificar Atendimento",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 6,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(2, 2, 8, 2),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Fechar Conversa",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        )
                      ])
            ],
          ),
        ),
      ),
    );
  }
}
