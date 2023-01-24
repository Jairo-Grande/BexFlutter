part of 'crud_bloc.dart';

class CrudState {
  final List<UserData> userData;

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController websiteController;
  final TextEditingController companyNameController;

  CrudState(
      {required this.userData,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.websiteController,
      required this.companyNameController});

  CrudState copyWith({
    List<UserData>? userData,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    TextEditingController? websiteController,
    TextEditingController? companyNameController,
  }) {
    return CrudState(
      userData: userData ?? this.userData,
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      phoneController: phoneController ?? this.phoneController,
      websiteController: websiteController ?? this.websiteController,
      companyNameController:
          companyNameController ?? this.companyNameController,
    );
  }
}
