import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ProductModel.dart';



class ProductScreen extends StatefulWidget {
  final ValueSetter<ProductModel> _valueSetter;
  final ValueSetter<ProductModel>_valueRemoval;

  ProductScreen(this._valueSetter,this._valueRemoval);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  List<ProductModel> products = [
    ProductModel("Cow1", 300,"23",Image.network("https://www.freshone.com.pk/content/images/thumbs/0002803_mutton-mince_550.jpeg")),
    ProductModel("Cow2", 400,"43",Image.network("https://w7.pngwing.com/pngs/17/1014/png-transparent-sliced-raw-meat-steak-seafood-red-meat-beef-meat-ingredients-food-roast-beef-chicken-meat.png")),
    ProductModel("Cow3",600,"56",Image.network("https://www.wholesalemeat.co.nz/wp-content/uploads/2016/10/Beef-Kidney.jpg")),
    ProductModel("Cow4",1000,"76",Image.network("https://myhalalgrocery.com/wp-content/uploads/2019/03/1529753468karahi-cut.jpg")),
    ProductModel("Cow5", 900,"87",Image.network("https://rnwgraphics.s3.ap-south-1.amazonaws.com/products/mutton/goat-biryani-cut.jpg")),
    ProductModel("Cow6",1200,"98",Image.network("https://image.shutterstock.com/image-photo/raw-liver-isolated-on-white-260nw-1016966311.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index){
          return Container(

            child: ListTile(

              leading:products[index].i,
              title: Text(products[index].name),
              subtitle:Column(
                children:<Widget>[
                  Text("\$${products[index].price}",
                    style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
                  Text(products[index].weight.toString()+" kg",
                    style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[


                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.green,),
                        onPressed: () {
                          widget._valueRemoval(products[index]);
                          SnackBar s = SnackBar(content: Text(
                              products[index].name + " removed from your cart"),
                            duration: Duration(milliseconds: 3),
                            backgroundColor: Colors.pinkAccent,);
                          Scaffold.of(context).showSnackBar(s);
                        },),


                      IconButton(icon: Icon(Icons.add_circle, color: Colors.red,),
                        onPressed: () {
                          widget._valueSetter(products[index]);
                          SnackBar s = SnackBar(content: Text(
                              products[index].name + " added to your cart"),
                            duration: Duration(milliseconds: 3),
                            backgroundColor: Colors.cyanAccent,);
                          Scaffold.of(context).showSnackBar(s);
                        },),


                    ],),

                ], ),

              onTap: (){

              },

            ),);
        },
        separatorBuilder: (context, index){
          return Divider();
        },
        itemCount: products.length
    );
  }
}
