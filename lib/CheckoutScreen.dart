import 'package:flutter/material.dart';


class CheckoutScreen extends StatefulWidget {
  final cart;
  final sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),backgroundColor: Colors.teal,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(widget.cart[index].name),
                subtitle:IconButton(icon:Icon(Icons.remove_circle,color:Colors.green,),onPressed: (){

                  setState(() {
                    widget.cart([index].remove(widget.cart.name));
                  });

                },) ,
                trailing: Text("\$${widget.cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.w500),),
                onTap: (){

                },
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: widget.cart.length,
            shrinkWrap: true,
          ),
          Divider(),
          Text("Total : \$${widget.sum}"),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton.icon(onPressed:(){//whatsAppOpen();
              //  FlutterOpenWhatsapp.sendSingleMessage("03172467774","hi");
            },
              //
              icon:Icon(Icons.call), label:Text("order"),color: Colors.green,),
          ),
        ],
      ),);
  }
}
