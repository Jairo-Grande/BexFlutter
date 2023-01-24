part of 'crud_bloc.dart';

class CrudState {
  final List<UserData> userData;
  final UserData newAddUser;

  const CrudState({required this.userData, required this.newAddUser});

  CrudState copyWith({List<UserData>? userData, UserData? newAddUser}) {
    return CrudState(
        userData: userData ?? this.userData,
        newAddUser: newAddUser ?? this.newAddUser);
  }
}
