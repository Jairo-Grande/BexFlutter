import 'dart:io';

import 'package:bex_app_flutter/src/domain/repository/repository_http.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'crud_event.dart';
part 'crud_state.dart';

List<UserData> userData = [];

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudState(userData: userData)) {
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
