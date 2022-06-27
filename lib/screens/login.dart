
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp1/bloc/login/cubit.dart';
import 'package:shopapp1/bloc/login/states.dart';
import 'package:shopapp1/components/custom%20button.dart';
import 'package:shopapp1/components/text%20from.dart';
import 'package:shopapp1/components/toast.dart';
import 'package:shopapp1/constant/colors.dart';
import 'package:shopapp1/models/shopapp/login%20models.dart';
import 'package:shopapp1/screens/home.dart';
import 'package:shopapp1/shared/shared%20preference.dart';

import '../components/passwordtextform.dart';
import 'register.dart';

class shoploginscreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emaillogincontroller = TextEditingController();
  var passwordlogincontroller = TextEditingController();
  bool obserText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => shoplogincubit(),
        child: BlocConsumer<shoplogincubit, shoploginstates>(
            listener: (context, state)
            {
              if(state is loginsuccesstete )
              {
                if(state.loginmodel.status=true)
                {
                  cachehelper.savedata(
                      key: 'token',
                      value:state.loginmodel.data!.token).then((value)
                  {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => homelayout()));
                  });
                  showtoast(
                      text:state.loginmodel.message! ,
                      state: ToastStates.SUCCESS,
                  );
                  print(state.loginmodel.message);
                  print(state.loginmodel.data!.token);
                }else
                  {
                    showtoast(
                      text:state.loginmodel.message! ,
                      state: ToastStates.ERROR,
                    );
                    print(state.loginmodel.message);
                    print(state.loginmodel.status);


                  }
              }
            },

            builder: (context, state) {
              var shopcubit = shoplogincubit.get(context);

              return Scaffold(
                appBar: AppBar(backgroundColor: Colors.white10,
                  elevation: 0,),
                body: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Form(
                          key: formkey,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(height: 40,),

                              const Text('Welcome To ',
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,),),
                              const SizedBox(height: 40,),

                              const Text(
                                'Quality Management System ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,),),
                              const Text(
                                'For Faculty of CsIs  ',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,),),


                              const SizedBox(height: 20,),
                              DefaultTextField(
                                controller: emaillogincontroller,
                                text: 'email',
                                prefix: Icons.email,

                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return ('amail address must not be empty');
                                  }
                                  return null;
                                },

                              ),
                              const SizedBox(height: 20,),
                              PasswordTextFormField(
                                prefix: Icons.lock_outline,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return ('password must not be empty');
                                  }
                                  return null;
                                },
                                obserText: obserText,
                                controller: passwordlogincontroller,
                                suffixPressed: () {
                                  FocusScope.of(context).unfocus();
                                  obserText = !obserText;
                                  shopcubit.visibal();
                                },
                                text: 'Password',
                              ),

                              SizedBox(height: 20,),
                              ConditionalBuilder(
                                  condition: state is! loginlodingstete,
                                  builder: (context)=> Center(
                                      child:
                                      DefaultButton(
                                        text: 'Login',
                                        color: AppColors.orange,
                                        onpressed: () {
                                          if (formkey.currentState!.validate()) {
                                            shopcubit.userlogin(
                                                email: emaillogincontroller.text,
                                                password: passwordlogincontroller.text);

                                          }
                                        },)

                                  ),
                                  fallback: (context)=>const Center(child:CircularProgressIndicator())
                              ),

                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?', style: TextStyle(
                                      fontWeight: FontWeight.bold),),
                                  TextButton(onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          regestersocialapp()),
                                    );
                                  },
                                    child: const Text(
                                      'Register Now', style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),)
                                ],)
                            ],),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
