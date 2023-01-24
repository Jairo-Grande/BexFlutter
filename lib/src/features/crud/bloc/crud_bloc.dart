import 'dart:io';

import 'package:bex_app_flutter/src/domain/repository/repository_http.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

part 'crud_event.dart';
part 'crud_state.dart';

List<UserData> userData = [];

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController websiteController = TextEditingController();
final TextEditingController companyNameController = TextEditingController();

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc()
      : super(CrudState(
            userData: userData,
            nameController: nameController,
            emailController: emailController,
            companyNameController: companyNameController,
            phoneController: phoneController,
            websiteController: websiteController)) {
    on<RequestRegisters>(_requestRegisters);
    on<UpdateControllers>(_updateControllers);
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

  void _updateControllers(UpdateControllers event, Emitter<CrudState> emit) {
    emit(state.copyWith());
  }
}
