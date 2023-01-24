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
  AddRegisterToList();
}

class DeleteRegisterFromList extends CrudEvent {
  UserData userData;
  DeleteRegisterFromList({required this.userData});
}

class EditRegisterFromList extends CrudEvent {
  UserData userData;
  EditRegisterFromList({required this.userData});
}

class EditRegisterEvent extends CrudEvent {
  EditRegisterEvent();
}

class ResetControllers extends CrudEvent {
  ResetControllers();
}
