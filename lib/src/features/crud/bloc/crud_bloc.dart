import 'dart:io';

import 'package:bex_app_flutter/src/domain/repository/repository_http.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

part 'crud_event.dart';
part 'crud_state.dart';

List<UserData> userDataList = [];

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController websiteController = TextEditingController();
final TextEditingController companyNameController = TextEditingController();

UserData newUserData = UserData(
    id: 0,
    name: nameController.text,
    username: "User Name",
    email: emailController.text,
    address: Address(
        street: "street",
        suite: "suite",
        city: "city",
        zipcode: "zipcode",
        geo: Geo(lat: "lat", lng: "long")),
    phone: phoneController.text,
    website: websiteController.text,
    company: Company(
        bs: "bs",
        catchPhrase: "catchPhrase",
        name: companyNameController.text));

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc()
      : super(CrudState(
            userData: userDataList,
            nameController: nameController,
            emailController: emailController,
            companyNameController: companyNameController,
            phoneController: phoneController,
            websiteController: websiteController)) {
    on<RequestRegisters>(_requestRegisters);
    on<UpdateControllers>(_updateControllers);
    on<AddRegisterToList>(_addRegisterToList);
    on<DeleteRegisterFromList>(_deleteRegisterFromList);
  }

  void _requestRegisters(
      RequestRegisters event, Emitter<CrudState> emit) async {
    http.Response response;
    response = await Request().getDataUser();
    if (response.statusCode == HttpStatus.ok) {
      final List<UserData> userData = userDataFromJson(response.body);
      userDataList = userData;
      emit(state.copyWith(userData: userData));
    } else {}
  }

  void _updateControllers(UpdateControllers event, Emitter<CrudState> emit) {
    emit(state.copyWith());
  }

  void _addRegisterToList(AddRegisterToList event, Emitter<CrudState> emit) {
    userDataList.add(newUserData);
    emit(state.copyWith(userData: userDataList));
  }

  void _deleteRegisterFromList(
      DeleteRegisterFromList event, Emitter<CrudState> emit) {
    userDataList.remove(event.userData);
    emit(state.copyWith(userData: userDataList));
  }
}
