import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseDemo extends StatefulWidget {
  const FirebaseDemo({Key? key}) : super(key: key);

  @override
  State<FirebaseDemo> createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;
  List<Map> userList = [];
  String storeKey = '';

  Future<void> insertData() async {
    DatabaseReference reference = database.ref('user').child('kevin');
    String? key = reference.push().key;
    await reference.child(key!).set({
      "email": emailController.text,
      "password": passController.text,
    }).whenComplete(() {
      emailController.clear();
      passController.clear();
    });
    setState(() {
      selectData();
    });
  }

  Future<void> updateData() async {
    DatabaseReference reference =
        database.ref('user').child('kevin').child(storeKey);
    await reference.update({
      "email": emailController.text,
      "password": passController.text
    }).whenComplete(() {
      emailController.clear();
      passController.clear();
      storeKey = '';
      setState(() {
        selectData();
      });
    });
  }

  Future<void> deleteData() async {
    DatabaseReference reference =
        database.ref('user').child('kevin').child(storeKey);
    await reference.remove().whenComplete(() {
      emailController.clear();
      passController.clear();
      storeKey = '';
    });
    setState(() {
      selectData();
    });
  }

  Future<void> selectData() async {
    userList.clear();
    DatabaseReference reference = database.ref('user').child('kevin');
    await reference.get().then((value) {
      Map data = value.value as Map;
      data.forEach((key, value) {
        value["id"] = key;
        userList.add(value);
      });
      // data.forEach((key, value) {
      //   print(key);
      //   print(value);
      //   value.forEach((key, value) {
      //     print(key);
      //     print(value);

      //     userList.add(value);
      //   });
      // }
      // );
    });
    setState(() {});
  }

  @override
  // Query dbRef = FirebaseDatabase.instance.ref('user').child('kevin');
  // DatabaseReference reference =
  //     FirebaseDatabase.instance.ref('user').child('kevin');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello User !!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              Text(
                "This is Firebase Demo",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passController,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () => insertData(), child: const Text('Insert')),
              ElevatedButton(
                  onPressed: () => updateData(), child: const Text('Update')),
              ElevatedButton(
                  onPressed: () => deleteData(), child: const Text('Delete')),
              ElevatedButton(
                  onPressed: () => selectData(), child: const Text('Select'))
            ],
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: userList.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(userList[index]['email']),
          //         subtitle: Text(userList[index]['password']),
          //         onTap: () {
          //           emailController.text = userList[index]['email'];
          //           passController.text = userList[index]['password'];
          //           storeKey = userList[index]['id'];
          //         },
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(15),
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.red),
                  child: ListTile(
                    title: Text("Email : " + userList[index]['email']),
                    subtitle: Text("Password : " + userList[index]['password']),
                    onTap: () {
                      emailController.text = userList[index]['email'];
                      passController.text = userList[index]['password'];
                      storeKey = userList[index]['id'];
                    },
                  ),
                );
              },
            ),
          )

          // Text(userList.toString()),
          // Column(
          //   children: [
          //     FirebaseAnimatedList(
          //       query: dbRef,
          //       itemBuilder: (BuildContext context, DataSnapshot snapshot,
          //           Animation<double> animation, int index) {
          //         return ListTile(
          //           title: Text(userList[index]['email']),
          //         );
          //       },
          //     )
          //   ],
          // children: [],
          // children: userList
          //     .map((e) => Expanded(
          //           child: ListTile(
          //             onTap: () {
          //               setState(() {
          //                 emailController.text = e["email"];
          //                 passController.text = e["password"];
          //                 storeKey = e["id"];
          //               });
          //             },
          //             title: Text(e["email"]),
          //             subtitle: Text(e["password"]),
          //           ),
          //         ))
          //     .toList()
          // ),
        ],
      ),
    );
  }
}

/*

class FirebaseDemo extends StatefulWidget {
  const FirebaseDemo({Key? key}) : super(key: key);

  @override
  State<FirebaseDemo> createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseDatabase database = FirebaseDatabase.instance;
  List<Map> userList = [];
  String storeKey = '';

  Future<void> insertData() async {
    DatabaseReference ref = database.ref("User").child("jaydip");
    String? key = ref.push().key;
    await ref.child(key!).set({
      "email": emailController.text,
      "pass": passController.text,
    }).whenComplete(() {
      emailController.clear();
      passController.clear();
      setState(() {});
    });
  }

  Future<void> update() async {
    DatabaseReference ref =
    database.ref("User").child("jaydip").child(storeKey);
    await ref.update({
      "email": emailController.text,
      "pass": passController.text,
    }).whenComplete(() {
      emailController.clear();
      passController.clear();
      storeKey = '';
      setState(() {
        select();
      });
    });
  }

  Future<void> delete() async {
    DatabaseReference ref = database.ref("User").child("jaydip");
    await ref.remove();
  }

  Future<void> select() async {
    userList.clear();
    DatabaseReference ref = database.ref("User");
    await ref.get().then((value) {
      Map data = value.value as Map;
      data.forEach((key, value) {
        print(key);
        print(value);
        value.forEach((key, value) {
          print(key);
          print(value);
          value["id"] = key;
          userList.add(value);
        });
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:const [
               Row(
                children: [
                  Text(
                    "This is Firebase Demo",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email")),
              TextField(
                  controller: passController,
                  decoration: const InputDecoration(labelText: "password")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => insertData(),
                    child: Text("Insert"),
                  ),
                  ElevatedButton(
                    onPressed: () => update(),
                    child: Text("Update"),
                  ),
                  ElevatedButton(
                    onPressed: () => delete(),
                    child: Text("Delete"),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => select(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3,
                  ),
                  child: Text("Select"),
                ),
              ),
              Column(
                children: userList
                    .map(
                      (e) => ListTile(
                    onTap: () {
                      setState(() {
                        emailController.text = e["email"];
                        passController.text = e["pass"];
                        storeKey = e["id"];
                      });
                    },
                    title: Text(e["email"]),
                    subtitle: Text(e["pass"]),
                  ),
                )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
