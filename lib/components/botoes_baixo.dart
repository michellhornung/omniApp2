import 'package:flutter/material.dart';

class ItemBotaoBaixo extends StatelessWidget {
  double alturaTela;
  Color cor;
  IconData icone;

  ItemBotaoBaixo(this.alturaTela, this.cor, this.icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: IconButton(
        icon: Icon(
          icone,
          color: cor,
          size: alturaTela * 0.04,
        ),
        onPressed: () {},
      ),
    );
  }
}
