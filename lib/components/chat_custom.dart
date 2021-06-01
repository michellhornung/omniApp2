

import 'package:flutter/material.dart';

import 'conversasChat.dart';

class ChatCustom extends StatefulWidget {
  @override
  _ChatCustomState createState() => _ChatCustomState();
}

class _ChatCustomState extends State<ChatCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: mensagens.length,
            itemBuilder: _chatPersonalisado(context, mensagens.length)));
  }

   List<Chatmessage> mensagens = [
     Chatmessage("Ola como esta", "enviado"),
     Chatmessage("Ola como esta", "recebido"),
     Chatmessage("Ola como esta", "enviado"),
     Chatmessage("Ola como esta", "recebido"),
   ];

   _chatPersonalisado(BuildContext context, int index) {
     return Container(
         padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
         child: Text(mensagens[index].messageContent),
     );
   }
}
