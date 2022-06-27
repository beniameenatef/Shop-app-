import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp1/constant/endpoint.dart';
import 'package:shopapp1/models/shopapp/login%20models.dart';
import 'package:shopapp1/modules/dio%20helper.dart';

import 'states.dart';

class shoplogincubit extends Cubit<shoploginstates> {
  shoplogincubit() : super(qualityInitialState());
  shoploginmodel? loginmodel;

  static shoplogincubit get(context) => BlocProvider.of(context);
  bool ispassword = true;

  void visibal() {
    ispassword = !ispassword;
    emit(visibalSuccessState());
  }

  void userlogin({
    required String email,
    required String password,
  }) {
    emit(loginlodingstete());
    DioHelper.postData(
        url: LOGIN,
        data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginmodel = shoploginmodel.fromjson(value.data);
      print(loginmodel!.data!.email);
      print(loginmodel!.status);
      emit(loginsuccesstete(loginmodel!));
    }).catchError((error) {
      emit(loginerrorstete(error.toString()));
      print(error.toString());
    });
  }
}
