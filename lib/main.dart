import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/screens/em_atendimento.dart';
import 'package:omni_chat_telas_novas/screens/login_screen.dart';

void main() {
  runApp(const OmniChat());
}

class OmniChat extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const OmniChat({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmAtendimento()
    );
  }
}
