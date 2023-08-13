import 'package:flutter/material.dart';
import 'package:ecom/home_page.dart';

class LoginPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.black,
      ),
      body: LoginBody(),
    );
  }
}


class LoginBody extends StatefulWidget
{
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context)
  {
    return  Center(child:
        Container(height: 500,width:350,child:
      Card( elevation: 2,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock,size: 100,),

            const Padding(padding: EdgeInsets.only(bottom: 50)),

            Form(child: Column(
              children:[
                SizedBox(width: 300, child:
                TextFormField(decoration:
                const InputDecoration(labelText:"Username" ,
                    border: OutlineInputBorder()),),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 50)),
                SizedBox(width: 300, child:
                TextFormField(decoration: const InputDecoration(labelText: "Password",border:OutlineInputBorder(),),)),
                const Padding(padding: EdgeInsets.only(bottom:50)),

                SizedBox(width: 300,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)), child: const Text("Login"),))

              ]
            ))

          ],

      )
    )
        )
    );
  }
}