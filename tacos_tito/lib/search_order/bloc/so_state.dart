part of 'so_bloc.dart';

@immutable
abstract class SoState {}

class SoInitial extends SoState {}

class ExistingDataState extends SoState {
  final List<Map<String, dynamic>> orderList;

  ExistingDataState({required this.orderList});

  @override
  List<Object> get props => [orderList];
}

class NoDataState extends SoState {}

class LoadingState extends SoState {}