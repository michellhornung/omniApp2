import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/components/foto_usuario.dart';
import 'package:omni_chat_telas_novas/components/menu_customizado.dart';
import 'package:omni_chat_telas_novas/components/my_app_bar_custom.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';
import 'package:omni_chat_telas_novas/helper/estados.dart';
import 'package:omni_chat_telas_novas/helper/simular_banco_dados.dart';
import 'package:omni_chat_telas_novas/screens/chat_screen.dart';

class EmAtendimento extends StatefulWidget {
  const EmAtendimento({Key? key})
      : super(
          key: key,
        );

  @override
  State<EmAtendimento> createState() => _EmAtendimentoState();
}

class _EmAtendimentoState extends State<EmAtendimento> {
  List<String> listaMenu = [
    "Almoço",
    "Back Office",
    "Banheiro",
    "Café",
    "Demostração",
    "Particular"
  ];

  BancoDadosSimulado bancoDadosSimulado = BancoDadosSimulado();

  double alturaGlobal = 0.0;
  double larguraGlobal = 0.0;

  void contarMensagens() {
    int i = 0;
    while (i < bancoDadosSimulado.bancoLista.length) {
      var valorBanco = bancoDadosSimulado.bancoLista[i];
      int qtMensagens = valorBanco["QtMensagens"];
      EstadoMenuAtendimento.instance.qtNotificacoes += qtMensagens;
      i++;
    }
    EstadoMenuAtendimento.instance.chamarNotif();
  }

  @override
  Widget build(BuildContext context) {
    double alturaAppStatus = MediaQuery.of(context).padding.top;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    alturaGlobal = alturaTela;
    larguraGlobal = larguraTela;
    contarMensagens();
    print(EstadoMenuAtendimento.instance.qtNotificacoes);
    print(EstadoMenuAtendimento.instance.exitNotificacao);

    double alturaAppBar = alturaAppStatus + (0.13 * alturaTela);

    double alturaTelaDisponivel = alturaTela - alturaAppBar;

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
                        tipo: false,
                        alturaTela: alturaTela,
                        alturaAppBar: alturaAppBar,
                        alturaAppStatus: alturaAppStatus,
                        listaMenu: listaMenu),
                    Container(
                      width: larguraTela,
                      height: alturaTelaDisponivel,
                      child: LayoutBuilder(builder: (context, contrains) {
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: corBlueGrey,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15))),
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.group_add,
                                      color: corBranca,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "Em Atendimento",
                                        style: TextStyle(color: corBranca),
                                      ),
                                    )
                                  ],
                                  mainAxisSize: MainAxisSize.min,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                style: TextStyle(color: corPreto),
                                decoration: InputDecoration(
                                  fillColor: corBranca,
                                  hintText: "Buscar Atendimento",
                                  hintStyle: TextStyle(color: corCinza),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: corCinza,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        bancoDadosSimulado.bancoLista.length,
                                    itemBuilder: builItem))
                          ],
                        );
                      }),
                    )
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

  Widget builItem(context, index) {
    var valorBanco = bancoDadosSimulado.bancoLista[index];

    return ListTile(
      title: Text(
        valorBanco["titulo"],
        style: TextStyle(
            color: corPreto, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        children: [
          valorBanco["lida"] == true
              ? Icon(
                  Icons.check_circle,
                  color: corBlueAcent,
                )
              : Icon(
                  Icons.check,
                  color: corPreto,
                ),
          Text(
            valorBanco["resumo"],
            style: TextStyle(color: corPreto),
          ),
        ],
      ),
      leading: Icon(Icons.check_circle),
      trailing: valorBanco["QtMensagens"] > 0
          ? Column(
              children: [
                Text(
                  valorBanco['horario'],
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: larguraGlobal * 0.035,
                          height: alturaGlobal * 0.035,
                          color: corBlueGrey,
                          child: Center(
                            child: Text(
                              valorBanco["QtMensagens"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          : Column(
              children: [
                Text(
                  valorBanco['horario'],
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(child: SizedBox())
              ],
            ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (contetx) => ChatScreen()));
      },
    );
  }
}
