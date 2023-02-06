import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:hcslzapp/models/template.dart';
import 'package:hcslzapp/repositories/head.notification.repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'head.notification.add.controller.g.dart';

class HeadNotificationAddController = HeadNotificationAddControllerBase
    with _$HeadNotificationAddController;

abstract class HeadNotificationAddControllerBase with Store {
  var formController;

  @observable
  late TextEditingController idCtrl = TextEditingController();

  @observable
  late TextEditingController titleCtrl = TextEditingController();

  @observable
  late TextEditingController notificationCtrl = TextEditingController();

  @observable
  HeadNotification headNotification = Template().loadHeadNotification();

  @observable
  HeadNotificationRepo _headNotificationRepo = HeadNotificationRepo();

  @observable
  String photoUrl = '';

  @observable
  String photoPath = '';

  @observable
  File photo = File('');

  @observable
  bool changedPhoto = false;

  init() {
    _initTextFields();
    formController = FormController(
        title: headNotification.title,
        notification: headNotification.notification);
  }

  _initTextFields() {
    titleCtrl.text = headNotification.title;
    notificationCtrl.text = headNotification.notification;
    photoUrl = headNotification.photoUrl;
  }

  @action
  Future<HeadNotification> save() async => await _headNotificationRepo.save(
        await _setValues(),
      );

  @action
  Future<HeadNotification> update() async => await _headNotificationRepo.update(
        await _setValues(),
      );

  Future<HeadNotification> _setValues() async {
    String _lPhotoUrl = '';
    if (photo.path != '') {
      //se houve alteração de foto
      await _uploadPhoto().then((value) => _lPhotoUrl = value);
    } else
      _lPhotoUrl = photoUrl;
    return HeadNotification(
      id: headNotification.id,
      title: titleCtrl.text,
      notification: notificationCtrl.text,
      datePublication: '',
      photoUrl: _lPhotoUrl,
    );
  }

  bool get hasErrors => hasErrorTitle || hasErrorNotification;

  bool get hasErrorTitle => validateTitle() != null;

  bool get hasErrorNotification => validateNotification() != null;

  String? validateTitle() {
    const String _labelTitleRequired = 'Título é obrigatório!!!';

    if (formController.title.isEmpty) {
      return _labelTitleRequired;
    }
    return null;
  }

  String? validateNotification() {
    const String _labelNotificationRequired =
        'Descrição do aviso é obrigatória!!!';

    if (formController.notification.isEmpty) {
      return _labelNotificationRequired;
    }
    return null;
  }

  @action
  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      changedPhoto = true;
      photoPath = photo.path.toString();
    }
  }

  @action
  Future getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      photo = File(pickedFile.path);
      changedPhoto = true;
      photoPath = photo.path.toString();
    }
  }

  Future<String> _uploadPhoto() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    late Reference reference;
    if (headNotification.photoUrl.isNotEmpty) {
      reference = storage.refFromURL(headNotification.photoUrl);
      await reference.delete();
    }
    reference = storage.ref().child(
      'photos/notifications/${DateTime.now().millisecondsSinceEpoch}',
    );
    await reference.putFile(photo);
    return await reference.getDownloadURL();
  }
}

class FormController extends FormControllerBase with _$FormController {
  FormController({
    String? title,
    String? notification,
  }) {
    super.title = title;
    super.notification = notification;
  }
}

abstract class FormControllerBase with Store {
  @observable
  String? title;

  @observable
  String? notification;

  @action
  changeTitle(String value) => title = value;

  @action
  changeNotification(String value) => notification = value;
}
