// import 'package:flutter/material.dart';

// class FoodTile extends StatelessWidget {
//   final String name;
//   final String image;
//   final String price;
//   const FoodTile({
//     super.key,
//     required this.name,
//     required this.image,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(),
//         borderRadius: BorderRadius.circular(10),
//       ),

//       child: Column(
//         children: [
//           Image.asset(image, fit: BoxFit.cover),
//           Text(name),
//           Text(price),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class FoodTile extends StatelessWidget {
//   final String name;
//   final String image;
//   final String price;

//   const FoodTile({
//     super.key,
//     required this.name,
//     required this.image,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return InkWell(
//       borderRadius: BorderRadius.circular(16),
//       onTap: () {
//         // Handle tap (navigate to detail, etc.)
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: theme.colorScheme.surface,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(2, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// --- Image section ---
//             ClipRRect(
//               borderRadius: const BorderRadius.vertical(
//                 top: Radius.circular(16),
//               ),
//               child: AspectRatio(
//                 aspectRatio: 1.2, // keeps consistent shape
//                 child: Image.asset(
//                   image,
//                   fit: BoxFit.contain,
//                   width: double.infinity,
//                 ),
//               ),
//             ),

//             /// --- Info section ---
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     /// Name
//                     Text(
//                       name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: theme.textTheme.titleMedium?.copyWith(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),

//                     /// Price and Add button row
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "\$$price",
//                           style: theme.textTheme.titleSmall?.copyWith(
//                             color: theme.colorScheme.primary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: theme.colorScheme.primary,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: IconButton(
//                             onPressed: () {
//                               // Add to cart logic
//                             },
//                             icon: const Icon(
//                               Icons.add_rounded,
//                               color: Colors.white,
//                             ),
//                             iconSize: 20,
//                             constraints: const BoxConstraints(
//                               minHeight: 32,
//                               minWidth: 32,
//                             ),
//                             padding: EdgeInsets.zero,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/detail_screen/detail_screen.dart';

class FoodTile extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const FoodTile({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4), // space between tiles
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ), // clean border instead of shadow
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// --- Food Image ---
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 1.2, // keeps square shape
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          /// --- Text & Button Section ---
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        color: Color(0xffef2b39),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => DetailScreen(
                                image: image,
                                name: name,
                                price: price,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        iconSize: 18,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
