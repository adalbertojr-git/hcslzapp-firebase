// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send.email.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendEmailController on SendEmailControllerBase, Store {
  late final _$emailForgotPswCtrlAtom = Atom(
      name: 'SendEmailControllerBase.emailForgotPswCtrl', context: context);

  @override
  TextEditingController get emailForgotPswCtrl {
    _$emailForgotPswCtrlAtom.reportRead();
    return super.emailForgotPswCtrl;
  }

  @override
  set emailForgotPswCtrl(TextEditingController value) {
    _$emailForgotPswCtrlAtom.reportWrite(value, super.emailForgotPswCtrl, () {
      super.emailForgotPswCtrl = value;
    });
  }

  late final _$codeCtrlAtom =
      Atom(name: 'SendEmailControllerBase.codeCtrl', context: context);

  @override
  TextEditingController get codeCtrl {
    _$codeCtrlAtom.reportRead();
    return super.codeCtrl;
  }

  @override
  set codeCtrl(TextEditingController value) {
    _$codeCtrlAtom.reportWrite(value, super.codeCtrl, () {
      super.codeCtrl = value;
    });
  }

  late final _$_forgotPasswordRepoAtom = Atom(
      name: 'SendEmailControllerBase._forgotPasswordRepo', context: context);

  @override
  ForgotPasswordRepo get _forgotPasswordRepo {
    _$_forgotPasswordRepoAtom.reportRead();
    return super._forgotPasswordRepo;
  }

  @override
  set _forgotPasswordRepo(ForgotPasswordRepo value) {
    _$_forgotPasswordRepoAtom.reportWrite(value, super._forgotPasswordRepo, () {
      super._forgotPasswordRepo = value;
    });
  }

  late final _$SendEmailControllerBaseActionController =
      ActionController(name: 'SendEmailControllerBase', context: context);

  @override
  Future<PasswordDTO> sendEmail(String email) {
    final _$actionInfo = _$SendEmailControllerBaseActionController.startAction(
        name: 'SendEmailControllerBase.sendEmail');
    try {
      return super.sendEmail(email);
    } finally {
      _$SendEmailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<String> validateCode(PasswordDTO passwordDTO) {
    final _$actionInfo = _$SendEmailControllerBaseActionController.startAction(
        name: 'SendEmailControllerBase.validateCode');
    try {
      return super.validateCode(passwordDTO);
    } finally {
      _$SendEmailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailForgotPswCtrl: ${emailForgotPswCtrl},
codeCtrl: ${codeCtrl}
    ''';
  }
}

mixin _$FormController on FormControllerBase, Store {
  late final _$emailAtom =
      Atom(name: 'FormControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$FormControllerBaseActionController =
      ActionController(name: 'FormControllerBase', context: context);

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$FormControllerBaseActionController.startAction(
        name: 'FormControllerBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$FormControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email}
    ''';
  }
}