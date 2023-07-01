import 'package:flutter/material.dart';

import '../home/cart_screen.dart';

class SearchAreaWidget extends StatelessWidget {
  const SearchAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Text("Threads and Co.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.blue),),
                IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
          }, icon:Icon(Icons.shopping_cart_checkout_outlined,size: 30,color:Color.fromARGB(255, 255, 85, 0),))
                ],
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              decoration: InputDecoration(
                  hintText: "Search Here",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.arrow_forward),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Discover Your Signature Style: Browse, Buy, Be Fabulous !",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
