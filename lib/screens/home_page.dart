import 'package:e_com_app_exam/utils/products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "E-Com App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('cart_page');
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: s.height * 0.23,
              width: s.width * 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.thestatesman.com/wp-content/uploads/2019/03/e-comm-1024x683.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: allproducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 4.7 / 7,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'detail_page',
                      arguments: allproducts[index],
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 4),
                          color: Colors.grey,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                (!cart.contains(allproducts[index]))
                                    ? cart.add(allproducts[index])
                                    : cart.remove(allproducts[index]);
                              },
                              icon: (!cart.contains(allproducts[index])
                                  ? Icon(Icons.add_shopping_cart_outlined)
                                  : Icon(Icons.done)),
                            ),
                          ),
                          Image.network(
                            allproducts[index]['thumbnail'],
                            fit: BoxFit.cover,
                          ),
                          // Spacer(),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            allproducts[index]['title'],
                          ),
                          Text(
                            allproducts[index]['description'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
