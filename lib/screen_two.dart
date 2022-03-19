import 'package:convert_project/screen_three.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> sendData() async {
    final response = await http.post(Uri.parse('http://18.118.42.249:4000/account/otpverify/'),
        body: {
          'email': emailController.toString(),
          'name': nameController.toString()
        });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print("<<<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>>>");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    color: const Color(0xFF37517E),
                  ),
                ],
              ),
              Positioned(
                top: 350,
                left: 15,
                right: 15,
                child: Column(
                  children: [
                    const Text(
                      "Data Submitter",
                      style: TextStyle(color: Colors.white,fontSize: 20),),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xfff3f3f4), Color(0xfff3f3f4)]
                          )
                      ),
                      // height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Name "),
                          const SizedBox(height: 5,),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),),
                            controller: nameController,
                          ),
                          const SizedBox(height: 20,),
                          const Text("Email "),
                          const SizedBox(height: 5,),
                          TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),),
                            controller: emailController,
                          ),
                          const SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: (){
                              sendData();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ScreenThree()),
                              );
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF06D6A0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 10)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
