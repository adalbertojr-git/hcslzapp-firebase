import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hcslzapp/repositories/event.repo.dart';
import 'package:mobx/mobx.dart';
import 'package:hcslzapp/models/event.dart';

part 'event.list.controller.g.dart';

class EventListController = EventListControllerBase
    with _$EventListController;

abstract class EventListControllerBase with Store {
  @observable
  var titleCtrl = TextEditingController();

  @observable
  List selectedEvents = List();

  @observable
  Map<DateTime, List> events = {};

  @observable
  EventRepo _eventRepo = EventRepo();

  @observable
  String errorMsg;

  init() {
    selectedEvents.clear();
  }

  @action
  Future save(String title, String date) => ObservableFuture(_eventRepo
      .save(_setValues(0, title, date))
      .then((value) => value)).catchError((e) {
    errorMsg = "${e.message}";
  }, test: (e) => e is Exception);

  Event _setValues(int id, String title, String date) {
    return Event(id: id, date: date, title: title);
  }

  setEventTitle(String value) => titleCtrl.text = value;

  addEvent(Event event, DateTime selectedDay) {
    if (titleCtrl.text.isEmpty) return;
    if (selectedEvents.isNotEmpty) {
      selectedEvents.add(event);
      events[selectedDay] = selectedEvents;
    } else {
      events[selectedDay] = [titleCtrl.text].toList();
    }
    titleCtrl.clear();
  }

}