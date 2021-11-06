part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class SaveOrderOnlineEvent extends OrderEvent{
  final Map<String, dynamic> orderData;

  SaveOrderOnlineEvent({ 
    required this.orderData
  });

  @override
  List<Object> get props => [orderData];
}
