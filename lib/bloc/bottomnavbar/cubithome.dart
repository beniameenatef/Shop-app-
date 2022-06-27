import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp1/bloc/bottomnavbar/statehome.dart';
import 'package:shopapp1/constant/endpoint.dart';
import 'package:shopapp1/models/shopapp/home%20model.dart';
import 'package:shopapp1/modules/dio%20helper.dart';
import 'package:shopapp1/screens/categores.dart';
import 'package:shopapp1/screens/favirots.dart';
import 'package:shopapp1/screens/product.dart';
import 'package:shopapp1/screens/search.dart';

class shophomecubit extends Cubit<shophomestates> {
  shophomecubit() : super(homeInitialstate());

  static shophomecubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<Widget> screen = [
    product(),
    categores(),
    favorite(),
    search(),
  ];

  void changebottomnavifationbar(int index) {
    currentindex = index;
    emit(shopnavbarstate());
  }

  homemodel? model;
  void gethomedata() {
    emit(shophomedataloadingstate());
    DioHelper.getData(
        url: HOME,
        token: token
    ).then((value) {
       model = homemodel.fromjson(value.data);

      print(model!.data!.banners);
      print(model!.data!.products.first);
      print(model!.status);

      emit(shophomedatasuccesstate());
    }).catchError((error) {
      emit(shophomedataerrorstate(error.toString()));
      print(error.toString());
    });
  }
}
