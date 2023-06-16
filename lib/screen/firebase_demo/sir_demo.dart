import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SirDemo extends StatefulWidget {
  const SirDemo({Key? key}) : super(key: key);

  @override
  State<SirDemo> createState() => _SirDemoState();
}

class _SirDemoState extends State<SirDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FirebaseDatabase database = FirebaseDatabase.instance;
  List<Map> userList = [];
  String storeKey = '';

  Future<void> insertData() async {
    DatabaseReference ref = database.ref("User").child("kevin");
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
    DatabaseReference ref = database.ref("User").child("kevin").child(storeKey);
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
    DatabaseReference ref = database.ref("User").child("kevin");
    await ref.remove();
  }

  Future<void> select() async {
    userList.clear();
    DatabaseReference ref = database.ref("User").child('kevin');
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
            children: [
              Row(
                children: [
                  Text(
                    "This is Firebase Demo  by Jaydip sir",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
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
