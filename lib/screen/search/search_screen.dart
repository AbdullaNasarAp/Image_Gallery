// import 'package:assignment_thebrewapps/controller/get_image_controller.dart';
// import 'package:assignment_thebrewapps/controller/search_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   String _searchText = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           decoration: InputDecoration(
//             hintText: 'Search...',
//           ),
//           onChanged: (value) {
//             setState(() {
//               _searchText = value;
//             });
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _getFilteredResults().length,
//         itemBuilder: (context, index) {
//           // build your search results UI here

//           return ListTile(
//             title: Text(Provider.of<HomeProvider>(context).name[index]),
//           );
//         },
//       ),
//     );
//   }

//   List<String> _getFilteredResults() {
//     // apply your search logic here
//     // e.g. filter items from a list based on search text
//     return Provider.of<HomeProvider>(context)
//         .name
//         .where((item) => item.contains(_searchText))
//         .toList();
//   }
// }
