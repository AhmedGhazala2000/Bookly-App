import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonsAction extends StatelessWidget {
  const ButtonsAction({Key? key, this.previewLink, this.downloadLink})
      : super(key: key);
  final String? previewLink, downloadLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: downloadLink != null ? 'Free Download' : 'Not Available',
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              onPressed: () async {
                if (downloadLink != null) {
                  await launchUrl(Uri.parse(downloadLink!));
                }
              },
            ),
          ),
          Expanded(
            child: CustomButton(
              text: previewLink != null ? 'Preview' : 'Not Available',
              backColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: () async {
                if (previewLink != null) {
                  await launchUrl(Uri.parse(previewLink!));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
