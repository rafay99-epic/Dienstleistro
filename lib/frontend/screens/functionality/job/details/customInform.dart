import 'package:flutter/material.dart';

class InfoData {
  final IconData icon;
  final String title;
  final String value;

  InfoData({
    required this.icon,
    required this.title,
    required this.value,
  });
}

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}

class JobDescription extends StatelessWidget {
  final List<Pair<InfoData, InfoData>> data;

  const JobDescription({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: data.expand((infoDataPair) {
          int index = data.indexOf(infoDataPair);
          return [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildBox(infoDataPair.first),
                SizedBox(
                  width: 1,
                  child: VerticalDivider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 5,
                  ),
                ),
                _buildBox(infoDataPair.second),
              ],
            ),
            if (index != data.length - 1) // Add this line
              Divider(
                color: Theme.of(context).colorScheme.inversePrimary,
                thickness: 1,
              ),
          ];
        }).toList(),
      ),
    );
  }

  Widget _buildBox(InfoData infoData) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              infoData.icon,
              color: Colors.blue,
              size: 20,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  infoData.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  infoData.value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         children: data
//             .map((infoDataPair) => Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     _buildBox(infoDataPair.first),
//                     _buildBox(infoDataPair.second),
//                   ],
//                 ))
//             .toList(),
//       ),
//     );
//   }

//   Widget _buildBox(InfoData infoData) {
//     return Expanded(
//       child: Container(
//         margin: const EdgeInsets.all(5),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.grey,
//           ),
//           borderRadius: BorderRadius.circular(10), // Add this line
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Icon(
//               infoData.icon,
//               color: Colors.blue,
//               size: 20,
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   infoData.title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 Text(
//                   infoData.value,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }