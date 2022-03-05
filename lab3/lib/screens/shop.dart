import 'package:flutter/material.dart';
import 'package:lab3/data.dart';
import 'package:lab3/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Shop extends StatelessWidget{
  static const String routeName = '/shop';
  const Shop ({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context,index){
                Item item = items.elementAt(index);
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(items.elementAt(index).name),
                    subtitle: Text(items.elementAt(index).price.toString()),
                    trailing: IconButton(icon:Icon(Icons.delete),onPressed: (){
                      Provider.of<CartProvider>(context,listen:false).removeItem(item);


                },
                    ),
                  )
                );
              }
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
                Provider.of<CartProvider>(context).total.toString(),
                style:Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}

