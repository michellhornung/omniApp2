import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/constants_textos.dart';
import 'package:omni_chat_telas_novas/screens/em_atendimento.dart';

import '../constants_cores.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _campoTexto(String labelHint, IconData icone, TextInputType tipoTexto,
      bool esconderTexto) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 2, color: corCinza))),
          child: TextField(
            obscureText: esconderTexto,
            style: const TextStyle(color: corPreto),
            keyboardType: tipoTexto,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icone,
                color: corCinza,
              ),
              hintText: labelHint,
              hintStyle: const TextStyle(fontSize: 20.0, color: corCinza),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: corBranca,
      body: Stack(
        children: [
          Container(
            height: altura,
            decoration: BoxDecoration(
                color: corBranca,
                image: DecorationImage(
                    image: const AssetImage(
                      'assets/images/logo_fundo.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        corBranca.withOpacity(0.3), BlendMode.dstATop))),
          ),
          SingleChildScrollView(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: altura,
              width: largura,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: constraints.maxHeight * 0.1,
                      child: Image.asset('assets/images/logo-lhtec.png'),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.1,
                    ),
                    _campoTexto(StringsDoApp.textosEN["LoginEmail"],
                        Icons.person, TextInputType.emailAddress, false),
                    Container(
                      height: constraints.maxHeight * 0.03,
                    ),
                    _campoTexto(StringsDoApp.textosEN["LoginSenha"], Icons.lock,
                        TextInputType.text, true),
                    Container(
                      height: constraints.maxHeight * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EmAtendimento()));
                        },
                        child: Text(
                          StringsDoApp.textosEN["LoginButton"],
                          style: const TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: corCinza700,
                            minimumSize: Size(constraints.maxWidth * 0.6,
                                constraints.maxHeight * 0.07)),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
