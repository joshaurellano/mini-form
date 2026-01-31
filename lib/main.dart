import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    const String title = 'Mini Form';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:title,
      home: Scaffold(
        appBar: AppBar(
          title:const Text(title, 
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: MyCustomForm()) 
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() {
    return _MyCustomFormState();
    }
}

class _MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey <FormState>();
  final _nameTextController = TextEditingController();
  final _messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Padding(padding: EdgeInsets.all(16),
          child: TextFormField(
            controller: _nameTextController,
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: 'Enter your Name'
            ),
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Name should not be empty';
              }
              return null;
            },
          )
        ),

        Padding(
          padding: EdgeInsets.all(16),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: null,
            controller: _messageTextController,
            decoration:const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter  your Message'
            ),
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Please enter some  message';
              }
              return null;
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: SizedBox(
              width: 200,
              child:ElevatedButton(
              onPressed:() {
                if(_formKey.currentState!.validate()) {
                 setState(() {
                   
                 });
                }
              },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
              ),
            child: const Text('Submit'),
          ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                  
                    children: [
                        Text('Name: ${_nameTextController.text}'),
                                
                        Text('Message: ${_messageTextController.text}')
                    ],
                  ),
                ),
              ),
            ),
          ),
        
        )

        ]
      ),
    );
  }
}