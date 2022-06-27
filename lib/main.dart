import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp1/bloc/bottomnavbar/cubithome.dart';
import 'package:shopapp1/constant/endpoint.dart';
import 'package:shopapp1/modules/dio%20helper.dart';
import 'package:shopapp1/on%20boarding.dart';
import 'package:shopapp1/screens/home.dart';
import 'package:shopapp1/screens/login.dart';
import 'package:shopapp1/shared/shared%20preference.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cachehelper.init();
  bool ?onboarding;
  onboarding= cachehelper.getdata(key: 'onboarding');
  String ?token;
  token= cachehelper.getdata(key: 'token');
  Widget widget;

  if(onboarding != null)
  {
    if(token != null) widget = homelayout();
    else widget = shoploginscreen();
  } else
  {
    widget = onBoardingScrean();
  }

  runApp(MyApp(
    startWidget: widget,
  ));}

class MyApp extends StatelessWidget {
  final bool ?onboarding;
  final Widget ?startWidget;

   MyApp({ this.onboarding, this.startWidget}) ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => shophomecubit()..gethomedata(),
          ),
          // BlocProvider<BlocB>(
          //   create: (BuildContext context) => BlocB(),
          // ),
          // BlocProvider<BlocC>(
          //   create: (BuildContext context) => BlocC(),
          // ),
        ],
        child:    MaterialApp(

            home:startWidget
        )

    );

  }
}
