import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tacos_tito/auth/user_auth_repository.dart';

part 'so_event.dart';
part 'so_state.dart';

class SoBloc extends Bloc<SoEvent, SoState> {
  final _cFirestore = FirebaseFirestore.instance;

  SoBloc() : super(SoInitial()) {
    //on<RequestDataEvent>(_onRequestData);
    on<RequestAllEvent>((event, emitState) async{
      emitState(LoadingState());
      var orderList = await _getorders(event.email);
      if (orderList == null)
        emitState(NoDataState());
      else
        emitState(ExistingDataState(orderList: orderList));
    });
    on<RequestUserDataEvent>(_onRequestUserData);
  }

  /*void _onRequestData(SoEvent event, Emitter emitState) async {
    emitState(LoadingState());
    var orderList = await _getorders(event.email);
    if (orderList == null)
      emitState(NoDataState());
    else
      emitState(ExistingDataState(orderList: orderList));
  }*/

  Future<List<Map<String, dynamic>>?> _getorders(String query) async {
    try {
      //Es número de ficha
      if(double.tryParse(query) != null){
        var orders = await _cFirestore.collection("order").where("ficha", isEqualTo: query).get();
        return orders.docs
            .map(
              (orderDocument) => {
                "date": orderDocument["date"],
                "direction": orderDocument["direction"],
                "pay_amount": orderDocument["pay_amount"],
                "phone": orderDocument["phone"],
                "plates": orderDocument["plates"],
                "user":orderDocument["user"],
                "ficha":orderDocument["ficha"],
                "order_total":orderDocument["order_total"],
              },
            )
            .toList();
      //Devolver todo
      }else if(query.isEmpty){
        var orders = await _cFirestore.collection("order").orderBy("ficha").get();
        return orders.docs
            .map(
              (orderDocument) => {
                "date": orderDocument["date"],
                "direction": orderDocument["direction"],
                "pay_amount": orderDocument["pay_amount"],
                "phone": orderDocument["phone"],
                "plates": orderDocument["plates"],
                "user":orderDocument["user"],
                "ficha":orderDocument["ficha"],
                "order_total":orderDocument["order_total"],
              },
            )
            .toList();
      //Es correo
      }else{
        var orders = await _cFirestore.collection("order").where("user", isEqualTo: query).get();
        return orders.docs
            .map(
              (orderDocument) => {
                "date": orderDocument["date"],
                "direction": orderDocument["direction"],
                "pay_amount": orderDocument["pay_amount"],
                "phone": orderDocument["phone"],
                "plates": orderDocument["plates"],
                "user":orderDocument["user"],
                "ficha":orderDocument["ficha"],
                "order_total":orderDocument["order_total"],
              },
            )
            .toList();
      }    
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void _onRequestUserData(SoEvent event, Emitter emitState) async {
    emitState(LoadingState());
    var orderList = await _getUserOrders();
    if (orderList == null)
      emitState(NoDataState());
    else
      emitState(ExistingDataState(orderList: orderList));
  }

  Future<List<Map<String, dynamic>>?> _getUserOrders() async {
    try {
      var orders = await _cFirestore.collection("order").where("user", isEqualTo: UserAuthRepository().user!.email.toString()).get();
      return orders.docs
          .map(
            (orderDocument) => {
              "date": orderDocument["date"],
              "direction": orderDocument["direction"],
              "pay_amount": orderDocument["pay_amount"],
              "phone": orderDocument["phone"],
              "plates": orderDocument["plates"],
              "user":orderDocument["user"],
              "ficha":orderDocument["ficha"],
              "order_total":orderDocument["order_total"],
            },
          )
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
