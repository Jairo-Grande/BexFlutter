part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}

class RequestRegisters extends CrudEvent {
  const RequestRegisters();
}
