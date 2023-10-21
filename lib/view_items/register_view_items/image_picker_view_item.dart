import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:we_chats/utils/extensions.dart';

import '../../bloc/register_page_bloc.dart';
import '../../constant/color.dart';
import '../../constant/dimens.dart';
import '../../constant/strings.dart';
import '../../utils/image_utils.dart';
import '../../widgets/choose_image_type_widget.dart';

class ChooseImageItemView extends StatelessWidget {
  const ChooseImageItemView({
    super.key,
    required this.file,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheetForImagePicker(
            context, context.getRegisterPageBlocInstance());
      },
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.20,
          child: (file.path.isEmpty)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(kSP10x),
                  child: Image.asset(
                    AssetsImageUtils.defaultImage,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.file(file)),
    );
  }
}

void showBottomSheetForImagePicker(
    BuildContext context, RegisterPageBloc registerPageBloc) {
  showModalBottomSheet(
      context: context,
      backgroundColor: kBlack38Color,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSP10x)),
      builder: (context) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChooseImageWidget(
                    onTap: () async {
                      context.navigateBack(context);
                      final ImagePicker picker = ImagePicker();

                      final XFile? photo =
                          await picker.pickImage(source: ImageSource.camera);

                      if (photo != null) {
                        registerPageBloc.setImage(File(photo.path));
                      }
                    },
                    title: kTakePhotoText),
                const SizedBox(
                  height: kSP10x,
                ),
                ChooseImageWidget(
                    onTap: () async {
                      context.navigateBack(context);
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'png', 'gif'],
                      );
                      if (result != null) {
                        registerPageBloc
                            .setImage(File(result.paths.single ?? ''));
                      }
                    },
                    title: kChooseFromAlbumText),
                const Divider(
                  thickness: kSP10x,
                  color: kBlack38Color,
                ),
                ChooseImageWidget(
                    onTap: () {
                      context.navigateBack(context);
                      registerPageBloc.removePhoto();
                    },
                    title: kCancelText)
              ],
            ));
      });
}
