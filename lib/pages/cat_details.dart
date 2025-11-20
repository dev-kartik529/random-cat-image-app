import 'package:flutter/material.dart';

class CatDetails extends StatelessWidget {
  final String imageUrl;
  final Map<String, dynamic>? breedInfo;

  const CatDetails({
    super.key,
    required this.imageUrl,
    required this.breedInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cat Details"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl),
              ),

              SizedBox(height: 20),

              if (breedInfo != null) ...[
                Text(
                  "Breed: ${breedInfo!['name']}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 8),

                Text(
                  "Description:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),

                Text(breedInfo!['description']),
              ] else ...[
                Text("No breed information available."),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
