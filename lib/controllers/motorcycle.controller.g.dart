// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motorcycle.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MotorcycleController on MotorcycleControllerBase, Store {
  late final _$idCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.idCtrl', context: context);

  @override
  TextEditingController get idCtrl {
    _$idCtrlAtom.reportRead();
    return super.idCtrl;
  }

  @override
  set idCtrl(TextEditingController value) {
    _$idCtrlAtom.reportWrite(value, super.idCtrl, () {
      super.idCtrl = value;
    });
  }

  late final _$modelCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.modelCtrl', context: context);

  @override
  TextEditingController? get modelCtrl {
    _$modelCtrlAtom.reportRead();
    return super.modelCtrl;
  }

  @override
  set modelCtrl(TextEditingController? value) {
    _$modelCtrlAtom.reportWrite(value, super.modelCtrl, () {
      super.modelCtrl = value;
    });
  }

  late final _$yearCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.yearCtrl', context: context);

  @override
  TextEditingController? get yearCtrl {
    _$yearCtrlAtom.reportRead();
    return super.yearCtrl;
  }

  @override
  set yearCtrl(TextEditingController? value) {
    _$yearCtrlAtom.reportWrite(value, super.yearCtrl, () {
      super.yearCtrl = value;
    });
  }

  late final _$colorCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.colorCtrl', context: context);

  @override
  TextEditingController? get colorCtrl {
    _$colorCtrlAtom.reportRead();
    return super.colorCtrl;
  }

  @override
  set colorCtrl(TextEditingController? value) {
    _$colorCtrlAtom.reportWrite(value, super.colorCtrl, () {
      super.colorCtrl = value;
    });
  }

  late final _$licencePlateCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.licencePlateCtrl', context: context);

  @override
  TextEditingController? get licencePlateCtrl {
    _$licencePlateCtrlAtom.reportRead();
    return super.licencePlateCtrl;
  }

  @override
  set licencePlateCtrl(TextEditingController? value) {
    _$licencePlateCtrlAtom.reportWrite(value, super.licencePlateCtrl, () {
      super.licencePlateCtrl = value;
    });
  }

  late final _$nicknameCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.nicknameCtrl', context: context);

  @override
  TextEditingController? get nicknameCtrl {
    _$nicknameCtrlAtom.reportRead();
    return super.nicknameCtrl;
  }

  @override
  set nicknameCtrl(TextEditingController? value) {
    _$nicknameCtrlAtom.reportWrite(value, super.nicknameCtrl, () {
      super.nicknameCtrl = value;
    });
  }

  late final _$chassisCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.chassisCtrl', context: context);

  @override
  TextEditingController? get chassisCtrl {
    _$chassisCtrlAtom.reportRead();
    return super.chassisCtrl;
  }

  @override
  set chassisCtrl(TextEditingController? value) {
    _$chassisCtrlAtom.reportWrite(value, super.chassisCtrl, () {
      super.chassisCtrl = value;
    });
  }

  late final _$renavamCtrlAtom =
      Atom(name: 'MotorcycleControllerBase.renavamCtrl', context: context);

  @override
  TextEditingController? get renavamCtrl {
    _$renavamCtrlAtom.reportRead();
    return super.renavamCtrl;
  }

  @override
  set renavamCtrl(TextEditingController? value) {
    _$renavamCtrlAtom.reportWrite(value, super.renavamCtrl, () {
      super.renavamCtrl = value;
    });
  }

  late final _$motorcycleAtom =
      Atom(name: 'MotorcycleControllerBase.motorcycle', context: context);

  @override
  Motorcycle get motorcycle {
    _$motorcycleAtom.reportRead();
    return super.motorcycle;
  }

  @override
  set motorcycle(Motorcycle value) {
    _$motorcycleAtom.reportWrite(value, super.motorcycle, () {
      super.motorcycle = value;
    });
  }

  @override
  String toString() {
    return '''
idCtrl: ${idCtrl},
modelCtrl: ${modelCtrl},
yearCtrl: ${yearCtrl},
colorCtrl: ${colorCtrl},
licencePlateCtrl: ${licencePlateCtrl},
nicknameCtrl: ${nicknameCtrl},
chassisCtrl: ${chassisCtrl},
renavamCtrl: ${renavamCtrl},
motorcycle: ${motorcycle}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  late final _$modelAtom =
      Atom(name: 'FormControllerBase.model', context: context);

  @override
  String? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(String? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  dynamic changeModel(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeModel');
    try {
      return super.changeModel(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
