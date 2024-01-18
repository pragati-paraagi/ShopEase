import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ease/common/styles/productHorizontal.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/features/authentication/screens/home.dart';
import 'package:shop_ease/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {

  const SubCategoriesScreen({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: const CustomAppBar(title: Text('Sports'), showBack: false),

      body:

      SingleChildScrollView(

        child: Padding(

          padding: const EdgeInsets.all(Tsizes.defaultSpace),

          child: Column(

            children: [

              /// Banner

              const RoundImage(width: double.infinity, imageUrl: 'assets/icons/img_6.png', applyRadius: true,),

              const SizedBox(height: Tsizes.spaceSection),

              /// Sub-Categories

              Column(

                  children: [

                    /// Heading

                    Heading (title: 'Sports shirts', onPressed: (){}, color: Color(0xff10564F),),
                    const SizedBox(height: Tsizes.spaceItems / 2),
                    SizedBox(
                      height: 120,
                      child: SizedBox(
                        height: 120,
                        child: ListView.separated(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => SizedBox(width: 12),
                          itemBuilder: (context, index) => const ProductHorizontal(),
                        ),
                      ),
                    ),

                  ]
              ),



              // <-- Corrected this line.

              // Column
            ],
          ),
          // Column

        ),
      ),
    );//
  }
}
