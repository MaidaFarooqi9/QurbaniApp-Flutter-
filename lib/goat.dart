
import 'package:flutter/material.dart';
import 'ProductModel.dart';
import 'CheckoutScreen.dart';

class goat extends StatefulWidget {
  @override
  _goatState createState() => _goatState();
}

List<ProductModel> cart = [];
int sum = 0;

class _goatState extends State<goat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Goat'), backgroundColor: Colors.teal, actions: <Widget>[
        IconButton(
          icon: Icon(
              Icons.shopping_cart, color: Colors.pink.shade900, size: 20.0),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => new CheckoutScreen(cart, sum)));
          },),
      ],),
      body: Stack(
        children: <Widget>[

          goatScreen((selectedProduct) {
            setState(() {
              cart.add(selectedProduct); //update
              sum = 0;
              cart.forEach((item) {
                sum = sum + item.price;
              });
            });
          }, (unSelectedProduct) {
            setState(() {
              cart.remove(unSelectedProduct);
              //update
              sum = sum - unSelectedProduct.price;
            });
          }
          ),


        ],
      ),


    );
  }
}
class goatScreen extends StatefulWidget {
  @override
  _goatScreenState createState() => _goatScreenState();
  final ValueSetter<ProductModel> _valueSetter;
  final ValueSetter<ProductModel>_valueRemoval;

  goatScreen(this._valueSetter,this._valueRemoval);




}

class _goatScreenState extends State<goatScreen> {


  List<ProductModel> products = [
    ProductModel("Goat 1",300,"33",Image.network("https://www.freshone.com.pk/content/images/thumbs/0002803_mutton-mince_550.jpeg")),
    ProductModel("Goat 2", 400,"56",Image.network("https://w7.pngwing.com/pngs/17/1014/png-transparent-sliced-raw-meat-steak-seafood-red-meat-beef-meat-ingredients-food-roast-beef-chicken-meat.png")),
    ProductModel("Goat 3",600,"76",Image.network("https://www.wholesalemeat.co.nz/wp-content/uploads/2016/10/Beef-Kidney.jpg")),
    ProductModel("Goat 4",1000,"89",Image.network("https://myhalalgrocery.com/wp-content/uploads/2019/03/1529753468karahi-cut.jpg")),
    ProductModel("Goat 5", 900,"89",Image.network("https://rnwgraphics.s3.ap-south-1.amazonaws.com/products/mutton/goat-biryani-cut.jpg")),
    ProductModel("Goat 6",1200,"12",Image.network("https://image.shutterstock.com/image-photo/raw-liver-isolated-on-white-260nw-1016966311.jpg")),

  ];






  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index){

        return Container(

          child:ListTile(

            //leading:SizedBox(height: 100, width:150 ,child:products[index].i,),

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
      ,);
  }
}