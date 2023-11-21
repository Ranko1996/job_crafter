// import 'dart:ui';

// import 'package:flutter/material.dart';

// class SingleArticleScreen extends StatelessWidget {
//   const SingleArticleScreen({Key? key}) : super(key: key);

//   // Adjust this code to your needs:
//   static const routeName = '/single_article';
//   @override
//   Widget build(BuildContext context) {
//     final article = ModalRoute.of(context)!.settings.arguments as Article;
//     return ImageContainer(
//       width: double.infinity,
//       imageUrl: article.imageUrl,
//       child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             iconTheme: const IconThemeData(color: Colors.white),
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//           ),
//           extendBodyBehindAppBar: true,
//           body: ListView(
//             children: [
//               _NewsHeadline(
//                 article: article,
//               ),
//               _NewsBody(article: article)
//             ],
//           )),
//     );
//   }
// }

// class _NewsBody extends StatelessWidget {
//   const _NewsBody({
//     super.key,
//     required this.article,
//   });

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20.0),
//       // color: Colors.white,

//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//           color: Colors.white),
//       child: Column(children: [
//         Row(
//           children: [
//             CustomTag(
//               backgroundColor: Colors.black,
//               children: [
//                 CircleAvatar(
//                   radius: 10,
//                   backgroundImage: NetworkImage(article.authorImageUrl),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   article.author,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             CustomTag(
//               backgroundColor: Colors.grey.shade200,
//               children: [
//                 const Icon(Icons.timer),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   '${DateTime.now().difference(article.createdAt).inHours}h',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             CustomTag(
//               backgroundColor: Colors.grey.shade200,
//               children: [
//                 const Icon(Icons.remove_red_eye),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   '${article.views}',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Text(
//           '${article.title}',
//           style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           '${article.body}',
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
//         ),
//         const SizedBox(height: 20),
//         GridView.builder(
//           shrinkWrap: true,
//           itemCount: 2,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.25),
//           itemBuilder: (context, index) {
//             return ImageContainer(width: MediaQuery.of(context).size.width * 0.42, imageUrl: article.imageUrl);
//           },
//         )
//       ]),
//     );
//   }
// }

// class _NewsHeadline extends StatelessWidget {
//   const _NewsHeadline({super.key, required this.article});

//   final Article article;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.15,
//           ),
//           CustomTag(
//             backgroundColor: Colors.grey.withAlpha(150),
//             children: [
//               Text(
//                 article.category,
//                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
//               ),
//             ],
//           ),
//           Text(
//             article.title,
//             style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.white, height: 1.25),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             article.subtitle,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal, color: Colors.white, height: 1.25),
//           )
//         ],
//       ),
//     );
//   }
// }
