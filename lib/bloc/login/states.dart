import 'package:shopapp1/models/shopapp/login%20models.dart';

abstract class shoploginstates {}

class qualityInitialState extends shoploginstates {}

class loginlodingstete extends shoploginstates {}
class loginsuccesstete extends shoploginstates {
 final shoploginmodel loginmodel;

  loginsuccesstete(this.loginmodel);
}
class loginerrorstete extends shoploginstates
{
 final String error;
  loginerrorstete(this.error);

}


class visibalSuccessState extends shoploginstates {}
