import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget categoriesContainer({@required String image, @required String name}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget bottomContainer({
    @required String image,
    @required String name,
    @required int price,
  }) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Color(0xff3a3e3e),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            trailing: Text(
              "\$ $price",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem({@required String name,@required IconData icon}){
    return ListTile(
      leading: Icon(icon,color: Colors.white,),
      title: Text(name,style: TextStyle(fontSize: 20,color: Colors.white),),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff2b2b2b),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("lib/assets/images/userback.jpg"),
                        )
                    ),
                    currentAccountPicture: CircleAvatar(
                      child: Icon(Icons.account_circle_outlined),
                    ),
                    accountName: Text("User name"),
                    accountEmail: Text("user@gmail.com"),),
                drawerItem(
                  name: "Person",
                  icon: Icons.person,
                ),
                drawerItem(
                  name: "Cart",
                  icon: Icons.add_shopping_cart,
                ),
                drawerItem(
                  name: "Order",
                  icon: Icons.shop,
                ),
                drawerItem(
                  name: "About",
                  icon: Icons.person,
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white,

                ),
                ListTile(leading: Text(
                  "Communicate",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),),
                drawerItem(
                  name: "Change",
                  icon: Icons.lock,
                ),
                drawerItem(
                  name: "Log Out",
                  icon: Icons.exit_to_app,
                ),

              ],
            ),
          ),
        ),
      ),
        appBar: AppBar(

          elevation: 0.0,

          actions: [
            CircleAvatar(
              child: Icon(Icons.account_circle_outlined),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "All",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Pizza",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Burger",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Sandwitch",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Curries",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Drinks",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Shakes",
                  ),
                  categoriesContainer(
                    image: "lib/assets/images/1.png",
                    name: "Naans",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 500,
              child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    bottomContainer(
                        image: "lib/assets/images/1.png",
                        name: "Cheese Pizza",
                        price: 14),
                    bottomContainer(
                        image: "lib/assets/images/1.png",
                        name: "Cheese Pizza",
                        price: 14),
                    bottomContainer(
                        image: "lib/assets/images/1.png",
                        name: "Cheese Pizza",
                        price: 14),
                    bottomContainer(
                        image: "lib/assets/images/1.png",
                        name: "Cheese Pizza",
                        price: 14),
                  ]),
            )
          ],
        ));
  }
}
