import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/dependent.controller.dart';
import 'package:hcslzapp/enums/blood.types.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/models/dependent.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DependentAdd extends StatefulWidget {
  final Dependent dependent;

  DependentAdd(this.dependent);

  @override
  _DependentAddState createState() => _DependentAddState();
}

class _DependentAddState extends State<DependentAdd> {
  DependentController _controller = DependentController();

  @override
  void initState() {
    _controller.dependent = widget.dependent != null ? widget.dependent : null;
    _controller.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
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
                Observer(
                  builder: (_) {
                    return InputTextField(
                      textEditingController: _controller.nameCtrl,
                      label: labelNameDependent,
                      hint: hintNameDependent,
                      icon: Icons.person,
                      inputType: TextInputType.text,
                      onChanged: _controller.formController.changeName,
                      errorText: _controller.validateName(),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return InputTextField(
                      textEditingController: _controller.emailCtrl,
                      label: labelEmail,
                      hint: hintEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      onChanged: _controller.formController.changeEmail,
                      errorText: _controller.validateEmail(),
                    );
                  },
                ),
                InputTextField(
                  textEditingController: _controller.phoneCtrl,
                  label: labelPhone,
                  hint: hintPhone,
                  icon: Icons.phone,
                  inputType: TextInputType.phone,
                  maskTextInputFormatter:
                      MaskTextInputFormatter(mask: "(##) #####-####"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 3.0, 2.0, 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Tipo Sanguineo:',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 58.0,
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            value: _controller.currentBloodType,
                            items: getBloodTypes(),
                            onChanged: _controller.changedDropDownItem,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Expanded(
                      child: InputTextField(
                        textEditingController: _controller.cpfCtrl,
                        label: labelCPF,
                        hint: hintCPF,
                        inputType: TextInputType.number,
                        maskTextInputFormatter:
                            MaskTextInputFormatter(mask: "###.###.###-##"),
                      ),
                    ),
                    Expanded(
                      child: InputTextField(
                        textEditingController: _controller.dateBirthCtrl,
                        label: labelDateBirth,
                        hint: hintDate,
                        icon: Icons.calendar_today,
                        inputType: TextInputType.datetime,
                        maskTextInputFormatter:
                            MaskTextInputFormatter(mask: "##/##/####"),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    'Membro Harley Club?',
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Container(
                  height: 58.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Switch(
                    activeColor: Colors.orangeAccent,
                    value: _controller.isAssociated,
                    onChanged: (value) {
                      _controller.setAssociated();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Button(
            icon: Icons.playlist_add, onClick: () => _controller.add(context)),
      ),
    );
  }
}