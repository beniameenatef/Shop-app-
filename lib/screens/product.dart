import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp1/bloc/bottomnavbar/cubithome.dart';
import 'package:shopapp1/bloc/bottomnavbar/statehome.dart';
import 'package:shopapp1/models/shopapp/home%20model.dart';

class product extends StatelessWidget {
  const product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shophomecubit, shophomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: shophomecubit.get(context).model != null,
            builder: (context) =>
                builderwidget(shophomecubit.get(context).model!),
            fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }

  Widget builderwidget(homemodel model) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                items: model.data!.banners
                    .map((e) => Image(image: NetworkImage('${e.image}')))
                    .toList(),
                options: CarouselOptions(
                  height: 250.0,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                )),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.75,
                children: List.generate(
                  model.data!.products.length,
                  (index) => buildGridProduct(model.data!.products[index]),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(productsmodel model) => Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(model.image!),
                width: double.infinity,
                height: 200.0,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.old_price.round()}',
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 14.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ));
//      SizedBox(height: 20,),
//     Container(
//       color: Colors.grey[300],
//       child: GridView.count(
//       crossAxisCount: 2,
//       mainAxisSpacing: 1.0,
//       crossAxisSpacing: 1.0,
//       childAspectRatio: 1/1.4,
//       children:List.generate(model.data!.products.length, (index) =>
//           buildergridproduct(model.data!.products[index])),
//     ),)
//     // Card(child: Image(image: NetworkImage('${}'),),)
//   ],
// );
// Widget buildergridproduct(productsmodel model)=>
//   Expanded(
//
//         child:Image(image: NetworkImage(model.image!),
//           width: double.infinity,
//         height: 200,)
//
//   );
}
