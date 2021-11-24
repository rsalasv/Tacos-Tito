import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'dart:io';

part 'order_event.dart';
part 'order_state.dart';



class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<SaveOrderOnlineEvent>((event, emit) async {
      emit(LoadingState());
      bool saved = await _saveOrder(event.orderData);
      emit(saved? CreatedOrderState():ErrorOrderState(errorMsg: "No se ha podido enviar la orden, inténtalo de nuevo"));
    });
  }
}

Future<bool> _saveOrder(Map<String, dynamic> order) async{
  //subir datos a fb
  try {
    //subir los datos a fb
    await FirebaseFirestore.instance.collection("order").add(order);
    return true;
  } catch (e) {
    return false;
  }
}



