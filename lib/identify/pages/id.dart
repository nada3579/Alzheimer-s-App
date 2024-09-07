import 'package:althhimer_app/identify/pages/identify_view.dart';
import 'package:flutter/material.dart';
import 'details_page.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Identifyview extends StatefulWidget {
  @override
  _IdentifyviewState createState() => _IdentifyviewState();
}

class _IdentifyviewState extends State<Identifyview> {
  final List<ImageDetails> _images = [
    ImageDetails(
      imagePath: 'assets/persons2/Amelia.jpg',
      name: 'Amelia',
      details: 'She is your little sister,\n living in London.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Ava.jpg',
      name: 'Ava',
      details: 'She is your best friend from New York.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Benjamin.jpg',
      name: 'Benjamin',
      details: 'He is your cousin, living in Sydney.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Daniel.jpg',
      name: 'Daniel',
      details: 'He is your school friend, living in Berlin.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/David.jpg',
      name: 'David',
      details: 'He is your childhood friend, living in Paris.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Emily.jpg',
      name: 'Emily',
      details: 'She is your niece, living in Los Angeles.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Evelyn.jpg',
      name: 'Evelyn',
      details: 'She is your neighbor, living in Toronto.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Isabella.jpg',
      name: 'Isabella',
      details: 'She is your colleague, living in Chicago.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/James.jpg',
      name: 'James',
      details: 'He is your friend, living in Melbourne.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Liam.jpg',
      name: 'Liam',
      details: 'He is your older brother, living in Dublin.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Lucas.jpg',
      name: 'Lucas',
      details: 'He is your cousin, living in San Francisco.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Matthew.jpg',
      name: 'Matthew',
      details: 'He is your college friend, living in Miami.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Mia.jpg',
      name: 'Mia',
      details: 'She is your cousin, living in Rome.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Michael.jpg',
      name: 'Michael',
      details: 'He is your nephew, living in Boston.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Noah.jpg',
      name: 'Noah',
      details: 'He is your friend, living in Toronto.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Oliver.jpg',
      name: 'Oliver',
      details: 'He is your colleague, living in Vancouver.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Olivia.jpg',
      name: 'Olivia',
      details: 'She is your friend, living in Seattle.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/Sophia.jpg',
      name: 'Sophia',
      details: 'She is your best friend, living in Madrid.',
    ),
    ImageDetails(
      imagePath: 'assets/persons2/William.jpg',
      name: 'William',
      details: 'He is your uncle, living in London.',
    ),
    ImageDetails(
      imagePath: 'assets/persons/Kashyap_21.jpg',
      name: 'Kashyap',
      details: 'He is your neighbor, living in Mumbai.',
    ),
    ImageDetails(
      imagePath: 'assets/persons/Robert Downey Jr_1.jpg',
      name: 'Robert',
      details: 'He is your friend, living in Los Angeles.',
    ),
    ImageDetails(
      imagePath: 'assets/persons/Roger Federer_2.jpg',
      name: 'Roger',
      details: 'He is your cousin, living in Basel.',
    ),
  ];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(ImageDetails(
          imagePath: pickedFile.path,
          name: 'New Image',
          details: 'Added via button',
        ));
      });
    }
  }

  void _showAddDetailsDialog() {
    final nameController = TextEditingController();
    final detailsController = TextEditingController();
    String imagePath = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text(
            'Add Image Details',
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Constants.kBlue),
                    )),
              ),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(
                    labelText: 'Details',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Constants.kBlue),
                    )),
              ),
              ElevatedButton(
                onPressed: () async {
                  final picker = ImagePicker();
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      imagePath = pickedFile.path;
                    });
                  }
                },
                child: Text(
                  'Pick Image',
                  style:
                      TextStyle(color: const Color.fromARGB(255, 73, 121, 128)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _images.add(ImageDetails(
                    imagePath: imagePath,
                    name: nameController.text,
                    details: detailsController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Add',
                style:
                    TextStyle(color: const Color.fromARGB(255, 73, 121, 128)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: const Color.fromARGB(255, 73, 121, 128)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6e9fa4),
      appBar: AppBar(
        backgroundColor: Color(0xFF6e9fa4),
        title: Text(
          'Identify',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: _showAddDetailsDialog,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          _images.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Image deleted')),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                imagePath: _images[index].imagePath,
                                name: _images[index].name,
                                details: _images[index].details,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: _images[index].imagePath.contains('assets')
                                  ? AssetImage(_images[index].imagePath)
                                  : FileImage(File(_images[index].imagePath))
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String name;
  final String details;

  ImageDetails({
    required this.imagePath,
    required this.name,
    required this.details,
  });
}
