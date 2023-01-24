part of 'crud_bloc.dart';

abstract class CrudEvent {
  const CrudEvent();

  List<Object> get props => [];
}

class RequestRegisters extends CrudEvent {
  const RequestRegisters();
}

class UpdateControllers extends CrudEvent {
  const UpdateControllers();
}

class AddRegisterToList extends CrudEvent {
  const AddRegisterToList();
}

class DeleteRegisterFromList extends CrudEvent {
  UserData userData;
  DeleteRegisterFromList({required this.userData});
}
