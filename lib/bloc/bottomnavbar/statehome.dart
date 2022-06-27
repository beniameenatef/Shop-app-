abstract class shophomestates {}
class homeInitialstate extends shophomestates {}

class shopnavbarstate extends shophomestates {}


class shophomedataloadingstate extends shophomestates {}
class shophomedatasuccesstate extends shophomestates {}
class shophomedataerrorstate extends shophomestates
{
  final String ?error;

  shophomedataerrorstate(this.error);
}

