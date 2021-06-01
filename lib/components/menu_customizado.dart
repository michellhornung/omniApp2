import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';

class MenuCustom extends StatefulWidget {
  List<String> listaMenu;

  MenuCustom({Key? key, required this.listaMenu}) : super(key: key);

  @override
  State<MenuCustom> createState() => _MenuCustomState();
}

class _MenuCustomState extends State<MenuCustom>
    with SingleTickerProviderStateMixin {
  late List<String> listaMenuCon;

  @override
  void initState() {
    super.initState();
    listaMenuCon = widget.listaMenu;
    /* controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50));
    animation = Tween<double>(begin: 0, end: 150).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();*/
  }

  @override
  void dispose() {
    /*controller.dispose();*/
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: 150,
      decoration: BoxDecoration(
          color: corBranca,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          boxShadow: <BoxShadow>[BoxShadow(color: corPreto, spreadRadius: 1)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: corBlueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                )),
            height: 30,
            width: 150,
            child: Center(
              child: Text(
                "Solicitar pausa para:",
                style: TextStyle(color: corBranca),
              ),
            ),
          ),
          buildItem(0),
          buildItem(1),
          buildItem(2),
          buildItem(3),
          buildItem(4),
          buildItem(5),
        ],
      ),
    ));
  }

  Widget buildItem(int index) {
    return TextButton(
      onPressed: () {},
      child: Text(
        listaMenuCon[index],
        style: TextStyle(color: corPreto),
      ),
    );
  }
}

/*ElevatedButton(
      onPressed: () {  },
      child: Container(
        alignment: Alignment.centerLeft,
          height: 20,
          width: 150,
          padding: const EdgeInsets.only(left: 15),
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(color: corCinza))),
          child: Text(listaMenuCon[index])),
    );*/
