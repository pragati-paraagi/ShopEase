import 'package:flutter/material.dart';
import 'package:shop_ease/common/widgets/appBar.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:shop_ease/features/personalization/screen/OrderList.dart';
class OrderScreen extends StatelessWidget {

  const OrderScreen({Key? key}): super(key: key);

  @override

  Widget build (BuildContext context) {

    return Scaffold(



        appBar: CustomAppBar(title: Center(child: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)), showBack: false),

    body:

    const Padding(

    padding: EdgeInsets.all(Tsizes.defaultSpace),

      child: TorderListItems(),
    ),
    );


  }

}

