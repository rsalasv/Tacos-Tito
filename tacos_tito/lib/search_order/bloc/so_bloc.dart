import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'so_event.dart';
part 'so_state.dart';

class SoBloc extends Bloc<SoEvent, SoState> {
  final _cFirestore = FirebaseFirestore.instance;

  SoBloc() : super(SoInitial()) {
    on<RequestDataEvent>(_onRequestData);
  }

  void _onRequestData(SoEvent event, Emitter emitState) async {
    emitState(LoadingState());
    var orderList = await _getorders();
    if (orderList == null)
      emitState(NoDataState());
    else
      emitState(ExistingDataState(orderList: orderList));
  }

  Future<List<Map<String, dynamic>>?> _getorders() async {
    try {
      var orders = await _cFirestore.collection("order").get();
      return orders.docs
          .map(
            (orderDocument) => {
              "date": orderDocument["date"],
              "direction": orderDocument["direction"],
              "pay_amount": orderDocument["pay_amount"],
              "phone": orderDocument["phone"],
              "plates": orderDocument["plates"],
            },
          )
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
