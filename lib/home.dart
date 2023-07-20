import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beautiful Hasan'),
        centerTitle: true,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 180,
                      backgroundImage: NetworkImage(
                          'https://media.licdn.com/dms/image/D5603AQEeifD0eSgOZA/profile-displayphoto-shrink_800_800/0/1688810978987?e=1695254400&v=beta&t=-5TlTN7rzAIT-YVa8cnWGMHga4J6ZNt45mOpEbQtgbE'),
                    ),
                  ),
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Center(
                        child: Text(
                          'Hasan',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      'The boy who loves flirting and dirty language. He flirts with everyone, specially with Kamran',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                /*  Wrap(
                    spacing: 10,
                    children: [
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                      Image.network(
                        'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                        height: 90,
                        width: 110,
                      ),
                    ],
                  )*/
                ],
              ),
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 180,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/1761279/pexels-photo-1761279.jpeg?auto=compress&cs=tinysrgb&w=600'),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            'Nature',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          'Study nature, love nature, stay close to nature. It will never fail you. —Frank Lloyd Wright',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                          Image.network(
                            'https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/charleston-sc-edisto-island-botany-bay-road-dave-allen.jpg',
                            height: 90,
                            width: 110,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
