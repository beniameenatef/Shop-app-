
import 'package:flutter/material.dart';
import 'package:shopapp1/constant/colors.dart';
class DefaultTextField extends StatelessWidget {
 final TextEditingController?controller;
  final String? Function (String?)? validate;
  final String? text;
  final IconData? prefix;


  DefaultTextField({
    Key? key,
    this.controller,
    this.validate,
    this.text,
    this.prefix,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(


    controller: controller,
      validator: validate,
      decoration: InputDecoration(
        hintText: text,

        prefixIcon: Icon(
          prefix,color: AppColors.black,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue, width: 2,),
            borderRadius:BorderRadius.circular(10),

          ),

          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey, width: 1.5),
          // borderRadius:BorderRadius.circular(10),
          // ),
      ),

    );


  }
}
