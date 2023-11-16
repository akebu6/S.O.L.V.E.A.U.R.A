import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solveaura/ui/User/controllers/auth/firebase_auth_services.dart';
import 'package:solveaura/ui/User/profile/profile.dart';
import 'package:solveaura/ui/pages/home.dart';
import 'package:solveaura/ui/pages/tasks.dart';
import 'package:solveaura/ui/pages/achievements.dart';
import 'package:solveaura/ui/pages/support.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DatabaseReference ref = FirebaseDatabase.instance.ref('Users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User userID;

  @override
  void initState() {
    super.initState();
    userID = _auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    String userName = "";
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          'Welcome',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
              ),
              child: Text(
                'User Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              title: const Text('Profile'),
              onTap: () {
                Get.to(
                      () => const ProfileScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 200),
                );
                // Handle profile item click
              },
            ),
            GestureDetector(
              onTap: () {
                // Handle dashboard item click
                Get.to(
                      () => const Home(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                );
              },
              child: const ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                title: Text('Home'),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Get.to(
                  const Tasks(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                );
              },
              child: const ListTile(
                leading: Icon(
                  Icons.task,
                  color: Colors.grey,
                ),
                title: Text('Tasks'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  const Achievements(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                );
              },
              child: const ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                title: Text('Achievements'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  const Support(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                );
              },
              child: const ListTile(
                leading: Icon(
                  Icons.support,
                  color: Colors.grey,
                ),
                title: Text('Support'),
              ),
            ),

            // Add more items as needed
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Colors.grey,
              ),
              title: const Text('Logout'),
              onTap: () {
                AuthController.instance.logout();
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange.shade900,
                  Colors.orange.shade800,
                  Colors.orange.shade400,
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1300),
                      child: const Text("Dashboard",
                        style: TextStyle(color: Colors.white, fontSize: 30),)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20
                    ),
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Tasks()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.red,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.assessment,size: 50,color: Colors.white,),
                              Text("Tasks",style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Achievements()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.blue,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star,size: 50,color: Colors.white,),
                              Text("Achievements",style: TextStyle(color: Colors.white, fontSize: 20),)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.green,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,size: 50,color: Colors.white,),
                              Text("Profile",style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Learn()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.purple,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book,size: 50,color: Colors.white,),
                              Text("Learn",style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Support()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),color: Colors.yellow,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.support,size: 50,color: Colors.white,),
                              Text("Support",style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],),
                        ),
                      ),
                    ],
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