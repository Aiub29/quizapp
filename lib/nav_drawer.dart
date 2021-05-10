import 'package:flutter/material.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Text('This is a Quiz App',style: TextStyle(fontSize: 20.0),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Aiub Ali'),
                accountEmail: Text('aiubali29@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Image.asset('images/aiub.jpg',height: double.infinity, width: double.infinity,fit: BoxFit.cover,),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),title: Text('Home'),
              onTap: (){
                Navigator.pop(context);
              }
            ),


            ListTile(
              leading: Icon(Icons.contacts),title: Text('Contact'),
              onTap: (){
                Navigator.pop(context);
              }
            ),

            ListTile(
              leading: Icon(Icons.share),title: Text('SHARE'),
              onTap: (){
                Navigator.pop(context);
              }
            ),
          ],
        ),
      ),
    );
    
    
  }
}
