import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/payment.add.controller.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/payment.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentAdd extends StatefulWidget {
  final Payment _payment;
  final Associated _associated;

  PaymentAdd(this._payment, this._associated);

  @override
  _PaymentAddAddState createState() => _PaymentAddAddState();
}

class _PaymentAddAddState extends State<PaymentAdd> {
  PaymentAddController _controller = PaymentAddController();

  @override
  void initState() {
    _controller.payment = widget._payment != null ? widget._payment : null;
    _controller.associated =
        widget._associated != null ? widget._associated : null;
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white30, Colors.deepOrange],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopMargin(),
              MyTextFormField(
                textEditingController: _controller.nameCtrl,
                label: labelNamePayment,
                disabled: true,
              ),
              Container(
                width: 190.0,
                child: Observer(
                  builder: (_) => MyTextFormField(
                    textEditingController: _controller.yearCtrl,
                    label: labelYear,
                    inputType: TextInputType.number,
                    disabled: widget._payment == null ? null : true,
                    onChanged: _controller.formController.changeName,
                    errorText: _controller.validateName(),
                    maxLengh: 4,
                    textAlign: TextAlign.center,
                    size: 20.0
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(5.0),
                child: Text('1º Semestre:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.janCtrl,
                      label: labelJan,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.febCtrl,
                      label: labelFeb,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.marCtrl,
                      label: labelMar,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.aprCtrl,
                      label: labelApr,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.mayCtrl,
                      label: labelMay,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.junCtrl,
                      label: labelJun,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(5.0),
                child: Text('2º Semestre:'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.julCtrl,
                      label: labelJul,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.augCtrl,
                      label: labelAug,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.sepCtrl,
                      label: labelSep,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.octCtrl,
                      label: labelOct,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.novCtrl,
                      label: labelNov,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                  Expanded(
                    child: MyTextFormField(
                      textEditingController: _controller.decCtrl,
                      label: labelDec,
                      inputType: TextInputType.number,
                      maskTextInputFormatter:
                          MaskTextInputFormatter(mask: "###.##"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Button(
        icon: Icons.save,
      ),
    );
  }
}
