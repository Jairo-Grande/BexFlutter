import 'dart:io';

import 'package:bex_app_flutter/src/domain/repository/repository_http.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

part 'crud_event.dart';
part 'crud_state.dart';

bool isEditing = false;

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

UserData? userDataAux;

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc()
      : super(CrudState(
            isEditing: isEditing,
            newUserData: newUserData,
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
    on<EditRegisterFromList>(_editRegister);
    on<EditRegisterEvent>(_editRegisterEvent);
    on<ResetControllers>(_resetControllers);
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
    UserData newUserDataAdd = UserData(
        id: 0,
        name: state.nameController.text,
        username: "User Name",
        email: state.emailController.text,
        address: Address(
            street: "street",
            suite: "suite",
            city: "city",
            zipcode: "zipcode",
            geo: Geo(lat: "lat", lng: "long")),
        phone: state.phoneController.text,
        website: state.websiteController.text,
        company: Company(
            bs: "bs",
            catchPhrase: "catchPhrase",
            name: state.companyNameController.text));

    userDataList.add(newUserDataAdd);
    emit(state.copyWith(userData: userDataList));
  }

  void _editRegister(EditRegisterFromList event, Emitter<CrudState> emit) {
    userDataAux = event.userData;
    nameController.text = event.userData.name;
    emailController.text = event.userData.email;
    phoneController.text = event.userData.phone;
    websiteController.text = event.userData.website;
    companyNameController.text = event.userData.company.name;
    emit(state.copyWith(
        nameController: nameController,
        emailController: emailController,
        phoneController: phoneController,
        websiteController: websiteController,
        companyNameController: companyNameController,
        isEditing: true));
  }

  void _deleteRegisterFromList(
      DeleteRegisterFromList event, Emitter<CrudState> emit) {
    userDataList.remove(event.userData);
    emit(state.copyWith(userData: userDataList));
  }

  void _editRegisterEvent(EditRegisterEvent event, Emitter<CrudState> emit) {
    userDataList.remove(userDataAux);

    UserData newUserDataEdit = UserData(
        id: 0,
        name: state.nameController.text,
        username: "User Name",
        email: state.emailController.text,
        address: Address(
            street: "street",
            suite: "suite",
            city: "city",
            zipcode: "zipcode",
            geo: Geo(lat: "lat", lng: "long")),
        phone: state.phoneController.text,
        website: state.websiteController.text,
        company: Company(
            bs: "bs",
            catchPhrase: "catchPhrase",
            name: state.companyNameController.text));

    userDataList.add(newUserDataEdit);
    emit(state.copyWith(userData: userDataList));
  }

  void _resetControllers(ResetControllers event, Emitter<CrudState> emit) {
    nameController.text = "";
    emailController.text = "";
    phoneController.text = "";
    websiteController.text = "";
    state.copyWith(
        nameController: nameController,
        emailController: emailController,
        phoneController: phoneController,
        websiteController: websiteController,
        companyNameController: companyNameController);
  }
}
