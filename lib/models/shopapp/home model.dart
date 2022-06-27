class homemodel
{
  bool? status;
  homedatamodel? data;
  homemodel.fromjson(Map<String,dynamic>json)
  {
    status=json['status'];
    data=homedatamodel.fromjson(json['data']);
  }

}
class homedatamodel
{
  List<bannermodel>banners=[];
  List<productsmodel> products=[];

  // homedatamodel.fromjson(Map<String,dynamic>json)
  // {
  //   banners=bannermodel.fromjson(json['banners']) as List<bannermodel>;
  //   products=productsmodel.fromjson(json['products']) as List<productsmodel>;
  //
  // }
   homedatamodel.fromjson(Map<String,dynamic>json)
{
  json['banners'].forEach((element)
  {
    banners.add(bannermodel.fromjson(element));
  });
  json['products'].forEach((element)
  {
    products.add(productsmodel.fromjson(element));
  });

}
  // homedatamodel.fromjson(Map<String, dynamic> json)
  // {
  //   json['banners'].forEach((element)
  //   {
  //     banners.add(bannermodel.fromjson(element));
  //   });
  //
  //   json['products'].forEach((element)
  //   {
  //     products.add(productsmodel.fromjson(element));
  //   });
  // }
}
 class bannermodel
 {
   int ?id;
   String? image;
   bannermodel.fromjson(Map<String,dynamic>json)
   {
     id=json['id'];
     image=json['image'];
   }
 }
 class productsmodel
 {
   int?id;
   dynamic price;
   dynamic old_price;
   dynamic discount;
   String?image;
   String?name;
   bool?in_favorites;
   bool?in_cart ;
   productsmodel.fromjson(Map<String,dynamic>json)
   {
     id=json['id'];
     price=json['price'];
     old_price=json['old_price'];
     discount=json['discount'];
     image=json['image'];
     name=json['name'];
     in_favorites=json['in_favorites'];
     in_cart=json['in_cart'];
   }

 }
 