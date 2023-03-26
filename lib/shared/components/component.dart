import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../constants/constants.dart';

Widget newsItem(context,{
  required Map news,
  required String type,
  required int index,
})
{
  return InkWell(
    onTap: ()
    {
      Navigator.push(context,MaterialPageRoute(builder: (context) => Scaffold(
        appBar: AppBar(),
        body: WebView(
          initialUrl : news['url'],
        ),
      )));
    },
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children:
      [
        Container(
          height: 250,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image(
            image: NetworkImage(
             news['urlToImage'] ?? 'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
            ),
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          news['title'],
          maxLines: 2,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              '2022-11-03T06:35:31Z',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Expanded(
              child: Text(
                news['author']?? 'غير معروف',
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                    fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
),
  );
}