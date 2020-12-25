import 'package:flutter/material.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/input.textfield.dart';
import 'package:hcslzapp/components/top.margin.dart';
import 'package:hcslzapp/controllers/motorcycle.controller.dart';
import 'package:hcslzapp/models/motorcycle.dart';

class MotorcycleAdd extends StatefulWidget {
  final Motorcycle motorcycle;

  MotorcycleAdd(this.motorcycle);

  @override
  _MotorcycleAddState createState() => _MotorcycleAddState();
}

class _MotorcycleAddState extends State<MotorcycleAdd> {
  MotorcycleController _controller = MotorcycleController();

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
              InputTextField(
                controller: _controller.modelCtrl,
                controllerText:
                    widget.motorcycle != null ? widget.motorcycle.model : null,
                label: labelModel,
                hint: hintModel,
                icon: Icons.motorcycle,
                inputType: TextInputType.text,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      controller: _controller.yearCtrl,
                      controllerText: widget.motorcycle != null
                          ? widget.motorcycle.year
                          : null,
                      icon: Icons.calendar_today,
                      label: labelYear,
                      hint: hintYear,
                      inputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: _controller.colorCtrl,
                      controllerText: widget.motorcycle != null
                          ? widget.motorcycle.color
                          : null,
                      icon: Icons.color_lens,
                      label: labelColor,
                      hint: hintColor,
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: InputTextField(
                      controller: _controller.licencePlateCtrl,
                      controllerText: widget.motorcycle != null
                          ? widget.motorcycle.licencePlate
                          : null,
                      label: labelLicencePlate,
                      hint: hintLicencePlate,
                      inputType: TextInputType.text,
                    ),
                  ),
                  Expanded(
                    child: InputTextField(
                      controller: _controller.nicknameCtrl,
                      controllerText: widget.motorcycle != null
                          ? widget.motorcycle.nickname
                          : null,
                      label: labelNickname,
                      hint: hintNickname,
                      inputType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              InputTextField(
                controller: _controller.chassisCtrl,
                controllerText: widget.motorcycle != null
                    ? widget.motorcycle.chassis
                    : null,
                label: labelChassis,
                hint: hintChassis,
                inputType: TextInputType.text,
              ),
              InputTextField(
                controller: _controller.renavamCtrl,
                controllerText: widget.motorcycle != null
                    ? widget.motorcycle.renavam
                    : null,
                label: labelRenavam,
                hint: hintRenavam,
                inputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          Button(Icons.playlist_add, onClick: () => _controller.add(context)),
    );
  }
}
