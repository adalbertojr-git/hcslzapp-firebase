import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/associated.profiles.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/centered.message.dart';
import 'package:hcslzapp/components/progress.dart';
import 'package:hcslzapp/components/top.bar.dart';
import 'package:hcslzapp/components/transaction.auth.dialog.dart';
import 'package:hcslzapp/controllers/payment.associated.controller.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:hcslzapp/pages/payment/payment.add.page.dart';
import 'package:asuka/asuka.dart' as asuka;
import '../../common/injection.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../models/associated.dart';

const String _labelNotExists = 'Não existem mensalidades registradas.';
const String _labelUnknown =
    'Houve um erro desconhecido ao executar a transação.';
const String _title = 'Mensalidades';

class PaymentAssociatedPage extends StatefulWidget {
  final String _selectedProfile;

  PaymentAssociatedPage(
    this._selectedProfile,
  );

  @override
  _PaymentAssociatedPageState createState() => _PaymentAssociatedPageState();
}

class _PaymentAssociatedPageState extends State<PaymentAssociatedPage> {
  final PaymentAssociatedController _controller = PaymentAssociatedController();
  final Associated _associated = locator.get<Associated>();

  @override
  void initState() {
    _controller.getFuture(_associated.id).then((value) {
      _controller.setButtonVisibilty();
    });
    super.initState();
  }

/*  @override
  Widget build(BuildContext context) {
    _controller.associated = _associated;
    _controller.init();
    return Scaffold(
      appBar: MyAppBar(_title),
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Button(
        icon: Icons.save,
        onClick: () => _update(context),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(_title),
        bottomNavigationBar: MyBottomAppBar(),
        body: FutureBuilder<List<Payment>>(
          future: _controller.getFuture(_associated.id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.active:
                break;
              default:
                if (snapshot.hasError) {
                  return CenteredMessage(
                      title: _title, message: snapshot.error.toString());
                } else {
                  if (snapshot.data == null)
                    return CenteredMessage(
                      title: _title,
                      message: _controller.errorMsg,
                    );
                  if ((snapshot.data?.length)! > 0) {
                    _controller.init();
                    _controller.payments.addAll(snapshot.data!);
                    _controller.payments.sort(
                      (a, b) => b.year.compareTo(a.year),
                    );
                    return _widgets();
                  } else
                    return widget._selectedProfile == ADMIN
                        ? _widgets()
                        : CenteredMessage(
                            title: _title,
                            message: _labelNotExists,
                          );
                }
            } //switch (snapshot.connectionState)
            return CenteredMessage(
              title: _title,
              message: _labelUnknown,
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget._selectedProfile == ADMIN
            ? Observer(
                builder: (_) => _controller.isHidedButton
                    ? SizedBox()
                    : Button(
                        icon: Icons.add,
                        onClick: () {
                          _add(context);
                        },
                      ),
              )
            : SizedBox(),
      );

  _add(BuildContext context) {
/*    final Future future = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentAddPage(
          widget._selectedProfile,
          null,
          _controller.loadYears(),
          _associated,
        ),
      ),
    );
    future.then((value) {
      if (value != null) {
        _controller.payments.add(value);
      }
    });*/
  }

  _widgets() => Center(
        child: ListView(
          children: [
            SizedBox(height: 10),
            Observer(
              builder: (_) => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: _controller.payments.length,
                itemBuilder: (_, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[300],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      title: Text(
                        'Ano: ' + _controller.payments[i].year,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Total pago: R\$ ' +
                          _controller
                              .getTotal(_controller.payments[i].year)
                              .toString()),
                      leading: CircleAvatar(
                        child: Icon(Icons.calendar_today),
                        backgroundColor: Colors.white,
                      ),
                      trailing: widget._selectedProfile == ADMIN
                          ? Wrap(
                              spacing: 10, // space between two icons
                              children: <Widget>[
                                GestureDetector(
                                  child: Icon(
                                    Icons.delete,
                                  ),
                                  onTap: () {
                                    _delete(i);
                                  },
                                ),
                                GestureDetector(
                                  child: Icon(
                                    Icons.arrow_forward,
                                  ),
                                  onTap: () {
/*                                      final Future future = Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentAddPage(
                                      widget._selectedProfile,
                                      _controller.payments[i],
                                      _controller.loadYears(),
                                      _associated,
                                    ),
                                  ),
                                );
                                future.then(
                                  (payment) {
                                    if (payment != null) {
                                      _controller.payments.removeAt(i);
                                      _controller.payments
                                          .insert(i, payment);
                                    }
                                  },
                                );*/
                                  },
                                ),
                              ],
                            )
                          : GestureDetector(
                              child: Icon(
                                Icons.arrow_forward,
                              ),
                              onTap: () {
/*                                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentAddPage(
                                    widget._selectedProfile,
                                    _controller.payments[i],
                                    _controller.loadYears(),
                                    _associated),
                              ),
                            );*/
                              },
                            ),
                    ),
                  );
                },
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
          ],
        ),
      );

  _delete(int i) async {
    var response = await showDialog(
        context: context,
        builder: (context) {
          return TransactionAuthDialog(msg: 'Confirma a exclusão?');
        });
    if (response == true) {
      _controller.deleteById(_controller.payments[i]).then((value) {
        if (value != null) {
          asuka.showSnackBar(
            SnackBar(
              content: const Text('Mensalidade excluída com sucesso.'),
            ),
          );
          _controller.payments.removeAt(i);
        } else {
          asuka.showSnackBar(
            SnackBar(
              content: Text(_controller.errorMsg),
            ),
          );
        }
      });
    }
  }
}
