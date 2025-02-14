import 'package:api_practice/postCall/provider/post_call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Post Call',
        style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Center(
        child: Provider.of<Postcall>(context, listen: true).response == null
            ? const CircularProgressIndicator()
            : Consumer<Postcall>(
                builder: (context, postcall, child) => ListView.builder(
                  padding:const EdgeInsets.all(15),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      var title = postcall.response ?? 'N/A';
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 245, 241, 241),
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(title),
                      );
                    })),
      ),
    );
  }
}
