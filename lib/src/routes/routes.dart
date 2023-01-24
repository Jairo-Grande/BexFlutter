import 'package:bex_app_flutter/src/features/crud/view/pages/crud_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const CrudPage(),
};
