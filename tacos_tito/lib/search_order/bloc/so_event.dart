part of 'so_bloc.dart';

abstract class SoEvent extends Equatable {
  const SoEvent();

  @override
  List<Object> get props => [];
}

class RequestDataEvent extends SoEvent {}

class RequestUserDataEvent extends SoEvent {}