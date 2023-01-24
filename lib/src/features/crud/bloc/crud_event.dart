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
