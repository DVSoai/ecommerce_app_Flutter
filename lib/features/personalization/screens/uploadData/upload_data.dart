import 'package:ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce_app/features/personalization/screens/uploadData/widgets/main_record.dart';
import 'package:ecommerce_app/features/personalization/screens/uploadData/widgets/relationships.dart';
import 'package:flutter/material.dart';
class UploadDataScreen extends StatelessWidget{
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Upload Data', style: Theme.of(context)
            .textTheme
            .headlineSmall),
      ),
      body: const SingleChildScrollView (
        child: Column(
          children: [
            TMainRecord(),
            TRelationships(),
          ],
        ),
      )
    );
  }

}