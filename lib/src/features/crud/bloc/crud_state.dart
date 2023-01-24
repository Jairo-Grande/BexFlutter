part of 'crud_bloc.dart';

class CrudState {
  final List<UserData> userData;

  const CrudState({required this.userData});

  CrudState copyWith({List<UserData>? userData}) {
    return CrudState(
      userData: userData ?? this.userData,
    );
  }
}
