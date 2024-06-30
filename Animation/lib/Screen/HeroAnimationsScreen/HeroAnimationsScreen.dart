import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imageUrls = [
    'https://cdn.promptden.com/images/41e0bc09-2b0f-4ba2-855c-afd51c4c38a2.webp?class=thumbnail',
    'https://cdn.promptden.com/images/d2b1ab00-885b-4b75-a5fe-43fc6d8628d7.png?class=thumbnail',
    'https://cdn.promptden.com/images/89f104e9-f799-4e33-aa9c-ad79b1294c04.webp?class=thumbnail',
    'https://cdn.promptden.com/images/665df614-b3cd-4404-86cd-fe380a50525b.webp?class=thumbnail',
    'https://cdn.promptden.com/images/0d3c432a-ccb2-415a-8f92-7f7ff695d5dc.webp?class=thumbnail',
    'https://cdn.promptden.com/images/f2b2799a-5cbd-45e7-a6d0-324c203b520b.webp?class=thumbnail',
    'https://cdn.promptden.com/images/2e2a1a00-e9cd-40db-bc20-a521c5961e48.webp?class=thumbnail',
    'https://cdn.promptden.com/images/d9d11dcf-fbee-4069-b77d-298d2d655143.webp?class=thumbnail',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiple Grid View Images'),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
          ),
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(imageUrl: imageUrls[index]),
                  ),
                );
              },
              child: Hero(
                tag: imageUrls[index], // Unique tag for each image
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      imageUrls[index],
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String imageUrl;

  DetailPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
