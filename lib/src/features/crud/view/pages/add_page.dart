import 'package:bex_app_flutter/src/core/global/constants.dart';
import 'package:bex_app_flutter/src/features/crud/bloc/crud_bloc.dart';
import 'package:bex_app_flutter/src/features/crud/view/widgets/custom_elevated_button.dart';
import 'package:bex_app_flutter/src/features/crud/view/widgets/custom_input.dart';
import 'package:bex_app_flutter/src/features/crud/view/widgets/custom_user_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/user_data_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

//FOCUS TEXTFIELDS
late FocusNode nameFocus;
late FocusNode emailFocus;
late FocusNode companyFocus;
late FocusNode phoneFocus;
late FocusNode webSiteFocus;

class _AddPageState extends State<AddPage> {
  bool isLoading = false;

  @override
  void initState() {
    nameFocus = FocusNode();
    emailFocus = FocusNode();
    companyFocus = FocusNode();
    phoneFocus = FocusNode();
    webSiteFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    nameFocus.dispose();
    emailFocus.dispose();
    companyFocus.dispose();
    phoneFocus.dispose();
    webSiteFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CrudBloc crudBloc = BlocProvider.of<CrudBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomUserCard(
                userData: UserData(
                    id: 0,
                    name: state.nameController.text,
                    username: "User Name",
                    email: emailController.text,
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
                        name: state.companyNameController.text)),
              ),
              const SizedBox(
                height: Const.space25,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Form(
                      child: Column(
                    children: [
                      CustomInput(
                        focus: nameFocus,
                        keyBoardType: TextInputType.name,
                        label: "Nombre :",
                        textController: state.nameController,
                        placeholder: "Ingrese el nombre",
                        nextFocus: emailFocus,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInput(
                              focus: emailFocus,
                              keyBoardType: TextInputType.name,
                              label: "Email :",
                              textController: emailController,
                              placeholder: "Ingrese el email",
                              nextFocus: phoneFocus,
                            ),
                          ),
                          Expanded(
                            child: CustomInput(
                              focus: phoneFocus,
                              keyBoardType: TextInputType.name,
                              label: "Telefono :",
                              textController: phoneController,
                              placeholder: "Ingrese el telefono",
                              nextFocus: webSiteFocus,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInput(
                              focus: webSiteFocus,
                              keyBoardType: TextInputType.name,
                              label: "WebSite :",
                              textController: websiteController,
                              placeholder: "Ingrese el Sitio Web",
                              nextFocus: companyFocus,
                            ),
                          ),
                          Expanded(
                            child: CustomInput(
                              focus: companyFocus,
                              keyBoardType: TextInputType.name,
                              label: "Nombre Compañia:",
                              textController: companyNameController,
                              placeholder: "Ingrese el nombre de la Compañia:",
                              nextFocus: nameFocus,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Const.space12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                onTap: () {
                                  crudBloc.add(const AddRegisterToList());

                                  setState(() => isLoading = true);
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() => isLoading = false);
                                  });
                                },
                                isLoading: isLoading,
                                labelLoading: "Agregando",
                                label: "Agregar registro",
                              ),
                            ),
                            const SizedBox(
                              width: Const.space15,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                onTap: () {},
                                label: "Limpiar Registro",
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
