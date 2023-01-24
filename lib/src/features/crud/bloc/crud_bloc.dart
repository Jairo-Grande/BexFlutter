import 'dart:io';

import 'package:bex_app_flutter/src/domain/repository/repository_http.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'crud_event.dart';
part 'crud_state.dart';

final TextEditingController id = TextEditingController(text: "0");
final TextEditingController name = TextEditingController();
final TextEditingController userName = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController phone = TextEditingController();
final TextEditingController website = TextEditingController();

//Address

final TextEditingController street = TextEditingController();
final TextEditingController suite = TextEditingController();
final TextEditingController city = TextEditingController();
final TextEditingController zipcode = TextEditingController();

//Geo

final TextEditingController lat = TextEditingController();
final TextEditingController long = TextEditingController();

//Company

final TextEditingController bs = TextEditingController();
final TextEditingController catchPhrase = TextEditingController();
final TextEditingController companyName = TextEditingController();

List<UserData> userData = [];

UserData newAddUser = UserData(
    id: int.parse(id.text),
    name: name.text,
    username: userName.text,
    email: email.text,
    address: Address(
        street: street.text,
        suite: suite.text,
        city: city.text,
        zipcode: zipcode.text,
        geo: Geo(lat: lat.text, lng: long.text)),
    phone: phone.text,
    website: website.text,
    company: Company(
        bs: bs.text, catchPhrase: catchPhrase.text, name: companyName.text));

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudState(userData: userData, newAddUser: newAddUser)) {
    on<RequestRegisters>(_requestRegisters);
  }

  void _requestRegisters(
      RequestRegisters event, Emitter<CrudState> emit) async {
    http.Response response;
    response = await Request().getDataUser();
    if (response.statusCode == HttpStatus.ok) {
      final List<UserData> userData = userDataFromJson(response.body);
      emit(state.copyWith(userData: userData));
    } else {}
  }
}
