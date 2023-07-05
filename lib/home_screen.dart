import 'package:flutter/material.dart';
import 'package:mobile_application/add_new_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CURD App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewProductScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.only(left: 16, top: 8),
                    contentPadding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Choose an action'),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit'),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            title: const Text('Product Name'),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Code'),
                Text('Total Price'),
                Text('Units Available'),
              ],
            ),
            leading: Image.network(
              'https://render.fineartamerica.com/images/images-profile-flow/400/images/artworkimages/mediumlarge/1/asus-vx7-lamborghini-cosmin-constantin-sava.jpg',
              width: 50,
              height: 50,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image,
                  size: 32,
                );
              },
            ),
            trailing: const Text('Unit Price'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
