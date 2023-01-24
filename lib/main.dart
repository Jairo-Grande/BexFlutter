import 'package:bex_app_flutter/src/app.dart';
import 'package:bex_app_flutter/src/features/crud/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (_) => CrudBloc()),
    ], child: const App()));
