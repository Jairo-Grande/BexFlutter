import 'package:bex_app_flutter/src/core/colors/app_colors.dart';
import 'package:bex_app_flutter/src/core/global/constants.dart';
import 'package:bex_app_flutter/src/models/user_data_model.dart';

import 'package:bex_app_flutter/src/shared/helpers/screens.dart';
import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  final UserData userData;
  const CustomUserCard({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
        elevation: 5,
        child: SizedBox(
          height: Screens.heigth(context) * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(Const.space12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(userData.name,
                            style: theme.textTheme.bodyText1)),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (() {}),
                          icon: const Icon(Icons.edit),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: (() {}),
                            icon: const Icon(
                              Icons.delete_outline,
                              color: ColorLight.error,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: Const.space5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Email: ${userData.email}",
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Company: ${userData.company.name}",
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Phone: ${userData.phone}",
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Website: ${userData.website}",
                        style: theme.textTheme.bodyText2,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
