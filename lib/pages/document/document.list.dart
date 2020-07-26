import 'package:flutter/material.dart';
import 'package:hcslzapp/components/my.appbar.dart';
import 'package:hcslzapp/models/dependent.dart';

const _tituloAppBar = 'Lista de Documentos';

class DocumentList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DocumentListState();
  }
}

class DocumentListState extends State<DocumentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_tituloAppBar),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: null,//widget.listDependentes.length,
          itemBuilder: (context, indice) {
            //final dependente = widget.listDependentes[indice];
            return ItemList(
              null, //dependente,
            );
          },
        ),
      ),
    );
  }

  void _atualiza(Dependente dependenteRecebido) {
    if (dependenteRecebido != null) {
      setState(
        () {
          //widget.listDependentes.add(dependenteRecebido);
        },
      );
    }
  }
}

class ItemList extends StatelessWidget {
  final Dependente _dependente;
  final Function onClick;

  ItemList(
    this._dependente, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.black,
        child: ListTile(
          onTap: () => onClick(),
          leading: Icon(
            Icons.insert_drive_file,
            color: Colors.deepOrange,
            size: 50,
          ),
          title: Text(
            'Teste',//_dependente.nome.toString(),
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.deepOrange,
            ),
          ),
          subtitle: Text(
            'Teste',//_dependente.email.toString(),
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}