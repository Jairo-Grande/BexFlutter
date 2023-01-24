import 'package:bex_app_flutter/src/features/crud/view/widgets/custom_user_card.dart';
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
    crudBloc.add(const RequestRegisters());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CrudBloc, CrudState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.userData.length,
          itemBuilder: (_, index) {
            return const CustomUserCard();
          },
        );
      },
    ));
  }
}
