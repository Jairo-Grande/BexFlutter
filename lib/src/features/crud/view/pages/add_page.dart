import 'package:bex_app_flutter/src/features/crud/bloc/crud_bloc.dart';
import 'package:bex_app_flutter/src/features/crud/view/widgets/custom_user_card.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomUserCard(
                userData: state.newAddUser,
              ),
              Form(
                  child: Column(
                children: [],
              ))
            ],
          );
        },
      ),
    );
  }
}
