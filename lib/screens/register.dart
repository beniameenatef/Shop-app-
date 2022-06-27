
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp1/bloc/login/cubit.dart';
import 'package:shopapp1/components/custom%20button.dart';
import 'package:shopapp1/components/passwordtextform.dart';
import 'package:shopapp1/components/text%20from.dart';
import 'package:shopapp1/constant/colors.dart';
import 'package:shopapp1/screens/login.dart';

import '../bloc/login/states.dart';

class regestersocialapp extends StatelessWidget {

  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var conformpasswordcontroller=TextEditingController();

  var formkey=GlobalKey<FormState>();
  bool obserText=true;
  bool obserText2=true;

  @override
  Widget build(BuildContext context) {

            return BlocProvider(
                create: (BuildContext context) => shoplogincubit(),
                child: BlocConsumer<shoplogincubit, shoploginstates>(
                listener: (context, state) {},
    builder: (context, state) {
    var visibalcubit = shoplogincubit.get(context);

    return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.blue,

              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Create New Account ',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: AppColors.blue),),
                          const SizedBox(height: 10,),
                          const Text('Complete this form',style: TextStyle(fontSize: 20,color: Colors.grey),),
                          const SizedBox(height: 20,),
                          DefaultTextField(
                            controller:namecontroller ,
                            text: 'User Name',
                            prefix: Icons.drive_file_rename_outline,

                            validate:(value){
                              if (value!.isEmpty) {
                                return ('name must not be empty');
                              }
                              return null;
                            },

                          ),
                          const SizedBox(height: 20,),
                          DefaultTextField(
                            controller:emailcontroller ,
                            text: 'Email',
                            prefix: Icons.email,

                            validate:(value){
                              if (value!.isEmpty) {
                                return ('amail address must not be empty');
                              }
                              return null;
                            },

                          ),
                          SizedBox(height: 20,),
                          PasswordTextFormField(
                            prefix: Icons.lock_outline,
                            validate:(value){
                              if (value!.isEmpty) {
                                return ('password must not be empty');
                              }
                              return null;
                            },
                            obserText:obserText ,
                            controller:passwordcontroller ,
                            suffixPressed:(){
                              FocusScope.of(context).unfocus();
                                obserText = !obserText;
                              visibalcubit.visibal();
                            } ,
                            text:'Password' ,
                          ),
                          const SizedBox(height: 20,),
                          PasswordTextFormField(
                            prefix: Icons.lock_outline,
                            validate:(value){
                              if (value!.isEmpty) {
                                return ('Conform password must not be empty');
                              }
                              return null;
                            },
                            obserText:obserText2 ,
                            controller:conformpasswordcontroller ,
                            suffixPressed:(){
                              FocusScope.of(context).unfocus();
                                obserText2 = !obserText2;
                              visibalcubit.visibal();

                            } ,
                            text:'Conform Password' ,
                          ),


                          const SizedBox(height: 30,),
                            Center( child: DefaultButton(
                                color:AppColors.orange ,
                                text:'REGISTER',
                                onpressed:()
                                {
                                  if(formkey.currentState!.validate())
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => shoploginscreen()),
                                    );

                                  }

                                } ,
                              ),)

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );

  }));}

}
