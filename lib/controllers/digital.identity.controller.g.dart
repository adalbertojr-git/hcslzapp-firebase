// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital.identity.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DigitalIdentityController on DigitalIdentityControllerBase, Store {
  late final _$nameCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.nameCtrl', context: context);

  @override
  TextEditingController get nameCtrl {
    _$nameCtrlAtom.reportRead();
    return super.nameCtrl;
  }

  @override
  set nameCtrl(TextEditingController value) {
    _$nameCtrlAtom.reportWrite(value, super.nameCtrl, () {
      super.nameCtrl = value;
    });
  }

  late final _$associatedTypeCtrlAtom = Atom(
      name: 'DigitalIdentityControllerBase.associatedTypeCtrl',
      context: context);

  @override
  TextEditingController get associatedTypeCtrl {
    _$associatedTypeCtrlAtom.reportRead();
    return super.associatedTypeCtrl;
  }

  @override
  set associatedTypeCtrl(TextEditingController value) {
    _$associatedTypeCtrlAtom.reportWrite(value, super.associatedTypeCtrl, () {
      super.associatedTypeCtrl = value;
    });
  }

  late final _$cnhCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.cnhCtrl', context: context);

  @override
  TextEditingController get cnhCtrl {
    _$cnhCtrlAtom.reportRead();
    return super.cnhCtrl;
  }

  @override
  set cnhCtrl(TextEditingController value) {
    _$cnhCtrlAtom.reportWrite(value, super.cnhCtrl, () {
      super.cnhCtrl = value;
    });
  }

  late final _$cpfCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.cpfCtrl', context: context);

  @override
  TextEditingController get cpfCtrl {
    _$cpfCtrlAtom.reportRead();
    return super.cpfCtrl;
  }

  @override
  set cpfCtrl(TextEditingController value) {
    _$cpfCtrlAtom.reportWrite(value, super.cpfCtrl, () {
      super.cpfCtrl = value;
    });
  }

  late final _$dateBirthCtrlAtom = Atom(
      name: 'DigitalIdentityControllerBase.dateBirthCtrl', context: context);

  @override
  TextEditingController get dateBirthCtrl {
    _$dateBirthCtrlAtom.reportRead();
    return super.dateBirthCtrl;
  }

  @override
  set dateBirthCtrl(TextEditingController value) {
    _$dateBirthCtrlAtom.reportWrite(value, super.dateBirthCtrl, () {
      super.dateBirthCtrl = value;
    });
  }

  late final _$dateShieldCtrlAtom = Atom(
      name: 'DigitalIdentityControllerBase.dateShieldCtrl', context: context);

  @override
  TextEditingController get dateShieldCtrl {
    _$dateShieldCtrlAtom.reportRead();
    return super.dateShieldCtrl;
  }

  @override
  set dateShieldCtrl(TextEditingController value) {
    _$dateShieldCtrlAtom.reportWrite(value, super.dateShieldCtrl, () {
      super.dateShieldCtrl = value;
    });
  }

  late final _$bloodTypeCtrlAtom = Atom(
      name: 'DigitalIdentityControllerBase.bloodTypeCtrl', context: context);

  @override
  TextEditingController get bloodTypeCtrl {
    _$bloodTypeCtrlAtom.reportRead();
    return super.bloodTypeCtrl;
  }

  @override
  set bloodTypeCtrl(TextEditingController value) {
    _$bloodTypeCtrlAtom.reportWrite(value, super.bloodTypeCtrl, () {
      super.bloodTypeCtrl = value;
    });
  }

  late final _$dueDateCtrlAtom =
      Atom(name: 'DigitalIdentityControllerBase.dueDateCtrl', context: context);

  @override
  TextEditingController get dueDateCtrl {
    _$dueDateCtrlAtom.reportRead();
    return super.dueDateCtrl;
  }

  @override
  set dueDateCtrl(TextEditingController value) {
    _$dueDateCtrlAtom.reportWrite(value, super.dueDateCtrl, () {
      super.dueDateCtrl = value;
    });
  }

  late final _$digitalIdentityAtom = Atom(
      name: 'DigitalIdentityControllerBase.digitalIdentity', context: context);

  @override
  DigitalIdentity get digitalIdentity {
    _$digitalIdentityAtom.reportRead();
    return super.digitalIdentity;
  }

  @override
  set digitalIdentity(DigitalIdentity value) {
    _$digitalIdentityAtom.reportWrite(value, super.digitalIdentity, () {
      super.digitalIdentity = value;
    });
  }

  late final _$_digitalIdentityRepoAtom = Atom(
      name: 'DigitalIdentityControllerBase._digitalIdentityRepo',
      context: context);

  @override
  DigitalIdentityRepo get _digitalIdentityRepo {
    _$_digitalIdentityRepoAtom.reportRead();
    return super._digitalIdentityRepo;
  }

  @override
  set _digitalIdentityRepo(DigitalIdentityRepo value) {
    _$_digitalIdentityRepoAtom.reportWrite(value, super._digitalIdentityRepo,
        () {
      super._digitalIdentityRepo = value;
    });
  }

  late final _$futureAtom =
      Atom(name: 'DigitalIdentityControllerBase.future', context: context);

  @override
  Future<List<DigitalIdentity>> get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<DigitalIdentity>> value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: 'DigitalIdentityControllerBase.errorMsg', context: context);

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$DigitalIdentityControllerBaseActionController =
      ActionController(name: 'DigitalIdentityControllerBase', context: context);

  @override
  Future<List<DigitalIdentity>> findAssociatedByIdToList(int id) {
    final _$actionInfo =
        _$DigitalIdentityControllerBaseActionController.startAction(
            name: 'DigitalIdentityControllerBase.findAssociatedByIdToList');
    try {
      return super.findAssociatedByIdToList(id);
    } finally {
      _$DigitalIdentityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameCtrl: ${nameCtrl},
associatedTypeCtrl: ${associatedTypeCtrl},
cnhCtrl: ${cnhCtrl},
cpfCtrl: ${cpfCtrl},
dateBirthCtrl: ${dateBirthCtrl},
dateShieldCtrl: ${dateShieldCtrl},
bloodTypeCtrl: ${bloodTypeCtrl},
dueDateCtrl: ${dueDateCtrl},
digitalIdentity: ${digitalIdentity},
future: ${future},
errorMsg: ${errorMsg}
    ''';
  }
}