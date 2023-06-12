import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Grid with ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Photo {
  final String imageUrl;
  final String title;
  final String subtitle;

  Photo({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class MyHomePage extends StatelessWidget {
  final List<Photo> photos = [
    Photo(
      imageUrl:
          'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      title: 'Sample Photo 1',
      subtitle: 'Description 1',
    ),
    Photo(
      imageUrl:
          'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      title: 'Sample Photo 2',
      subtitle: 'Description 2',
    ),
    Photo(
      imageUrl:
          'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      title: 'Sample Photo 3',
      subtitle: 'Description 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to my photo gallery!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.network(
                            'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Image.network(
                            'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Image.network(
                            'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Image.network(
                            'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Image.network(
                            'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Image.network(
                            'https://images.pexels.com/photos/17133050/pexels-photo-17133050.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Caption',
                            style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.blueGrey),
                          ),
                        ))
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Clicked on photo!'),
                        backgroundColor: Colors.blue,
                      ));
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(photos[index].imageUrl),
                    ),
                    title: Text(photos[index].title),
                    subtitle: Text(photos[index].subtitle),
                  );
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                    backgroundColor: Colors.blue,
                  ));
                },
                icon: Icon(
                  Icons.cloud_upload,
                  color: Colors.blue,
                  size: 40,
                ))
          ],
        ),
      ),
    );
  }
}
