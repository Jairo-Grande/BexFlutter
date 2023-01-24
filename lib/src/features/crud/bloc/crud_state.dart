part of 'crud_bloc.dart';

class CrudState {
  final bool loadingData;

  final bool isEditing;

  final List<UserData> userData;

  final UserData newUserData;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController websiteController;
  final TextEditingController companyNameController;

  final String buttonLabel;
  final String auxiliarButtonLabel;

  CrudState({
    required this.loadingData,
    required this.isEditing,
    required this.userData,
    required this.newUserData,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.websiteController,
    required this.companyNameController,
    required this.buttonLabel,
    required this.auxiliarButtonLabel,
  });

  CrudState copyWith(
      {bool? loadingData,
      bool? isEditing,
      List<UserData>? userData,
      UserData? newUserData,
      TextEditingController? nameController,
      TextEditingController? emailController,
      TextEditingController? phoneController,
      TextEditingController? websiteController,
      TextEditingController? companyNameController,
      String? buttonLabel,
      String? auxiliarButtonLabel}) {
    return CrudState(
        loadingData: loadingData ?? this.loadingData,
        isEditing: isEditing ?? this.isEditing,
        userData: userData ?? this.userData,
        newUserData: newUserData ?? this.newUserData,
        nameController: nameController ?? this.nameController,
        emailController: emailController ?? this.emailController,
        phoneController: phoneController ?? this.phoneController,
        websiteController: websiteController ?? this.websiteController,
        companyNameController:
            companyNameController ?? this.companyNameController,
        buttonLabel: buttonLabel ?? this.buttonLabel,
        auxiliarButtonLabel: auxiliarButtonLabel ?? this.auxiliarButtonLabel);
  }
}
