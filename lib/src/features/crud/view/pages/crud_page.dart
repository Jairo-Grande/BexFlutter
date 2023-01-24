import 'package:bex_app_flutter/src/core/colors/app_colors.dart';
import 'package:bex_app_flutter/src/features/crud/view/widgets/custom_user_card.dart';
import 'package:bex_app_flutter/src/shared/helpers/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bex_app_flutter/src/features/crud/bloc/crud_bloc.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late CrudBloc crudBloc;

  @override
  void initState() {
    crudBloc = BlocProvider.of<CrudBloc>(context);
    crudBloc.add(RequestRegisters(context: context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          if (state.loadingData) {
            return const Center(
              child: SizedBox(
                height: 80,
                width: 80,
                child: Expanded(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    color: ColorLight.primary,
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: state.userData.length,
              itemBuilder: (_, index) {
                return Hero(
                  tag: state.userData[index].name,
                  child: CustomUserCard(
                    onAddPage: null,
                    userData: state.userData[index],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          crudBloc.add(ResetControllers());
          Navigator.pushNamed(context, "add");
        },
        backgroundColor: ColorLight.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
