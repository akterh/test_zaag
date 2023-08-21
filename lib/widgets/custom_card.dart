import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      this.image,
      this.name,
      this.source,
      required this.onPressed,
      this.isSelected,
      this.description})
      : super(key: key);
  final String? image;
  final String? name;
  final String? source;
  final VoidCallback onPressed;
  final bool? isSelected;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(image!),
                ),
                Column(
                  children: [
                    Text("Name: $name"),
                    Text('Share Source: $source')
                  ],
                ),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      isSelected! ? Icons.favorite : Icons.favorite_border,
                      color: isSelected! ? Colors.red : Colors.grey,
                    ))
              ],
            ),
            Text("Share Description"),
            Text(description!)
          ],
        ),
      ),
    );
  }
}
