import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ohsundosun/asset/index.dart';
import 'package:ohsundosun/module/main/post_upsert/post_upsert_provider.dart';
import 'package:ohsundosun/provider/app_provider.dart';
import 'package:ohsundosun/style/index.dart';
import 'package:ohsundosun/widget/index.dart';

class PostUpsertView extends HookConsumerWidget {
  final String? id;

  const PostUpsertView({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final userInfo = ref.watch(userInfoProvider);
    final title = ref.watch(titleProvider);
    // final content = ref.watch(contentProvider);
    final images = ref.watch(imagesProvider);

    final isInsert = useState(id?.isEmpty ?? true);
    final mbti = useState(userInfo.mbti);

    useEffect(() {
      if (!isInsert.value) {}
      return null;
    }, []);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            ODSafeBox(
              top: true,
              child: Column(
                children: [
                  ODBackAppBar(
                    text: "게시글 ${isInsert.value ? "작성" : "수정"}",
                    right: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: const ODSvgImage(
                          SvgImage.icDot,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ODSingleScroll(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ODHeight(5),
                            Row(
                              children: [
                                ODBadge(
                                  mbti.value.toString(),
                                  type: mbti.value.toODBadgeType(),
                                ),
                              ],
                            ),
                            ODHeight(9),
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                showModalBottomSheet(
                                  enableDrag: false,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8.r),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return ODPostTypeBottomSheet(
                                      type: ref.watch(postWritePostTypeProvider),
                                      onTap: (type) {
                                        if (ref.read(postWritePostTypeProvider) != type) {
                                          ref.read(postWritePostTypeProvider.notifier).update(type);
                                        }
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 35.h,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1.h, color: ColorStyles.black10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        ref.watch(postWritePostTypeProvider).toString(),
                                        style: SpoqaHanSansNeo.regular.set(
                                          size: 13,
                                          height: 12,
                                          letter: -1,
                                          color: ColorStyles.black100,
                                        ),
                                      ),
                                    ),
                                    const ODSvgImage(
                                      SvgImage.icDrop,
                                      size: 13,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            ODHeight(11),
                            TextField(
                              onChanged: (value) => ref.read(titleProvider.notifier).update(value),
                              decoration: InputDecoration(
                                isDense: true,
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1.h, color: ColorStyles.black10),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1.h, color: ColorStyles.black10),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 1.h, color: ColorStyles.black10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                ),
                                hintText: "제목을 입력하세요",
                                hintStyle: SpoqaHanSansNeo.regular.set(
                                  size: 18,
                                  letter: -1,
                                  color: ColorStyles.black40,
                                ),
                              ),
                              cursorColor: ColorStyles.black100,
                              style: SpoqaHanSansNeo.regular.set(
                                size: 18,
                                letter: -1,
                                color: ColorStyles.black100,
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                minHeight: 350.h,
                              ),
                              child: TextField(
                                maxLines: null,
                                maxLength: 6000,
                                onChanged: (value) => ref.read(contentProvider.notifier).update(value),
                                decoration: InputDecoration(
                                  isDense: true,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                    top: 20.h,
                                    bottom: 10.h,
                                  ),
                                  hintText: "내용을 입력하세요",
                                  hintStyle: SpoqaHanSansNeo.regular.set(
                                    size: 15,
                                    height: 22.5,
                                    letter: -1,
                                    color: ColorStyles.black40,
                                  ),
                                  counterText: "",
                                ),
                                cursorColor: ColorStyles.black100,
                                style: SpoqaHanSansNeo.regular.set(
                                  size: 15,
                                  height: 22.5,
                                  letter: -1,
                                  color: ColorStyles.black80,
                                ),
                              ),
                            ),
                            Text(
                              "${title.length} / 6000",
                              textAlign: TextAlign.end,
                              style: SpoqaHanSansNeo.regular.set(
                                size: 11,
                                height: 10,
                                color: ColorStyles.black40,
                              ),
                            ),
                            ODHeight(10),
                            Container(
                              height: 1.h,
                              color: ColorStyles.black10,
                            ),
                            ODHeight(30),
                            Row(
                              children: [
                                Text(
                                  "사진 추가",
                                  style: SpoqaHanSansNeo.bold.set(
                                    size: 13,
                                    height: 10,
                                    letter: -1,
                                    color: ColorStyles.black100,
                                  ),
                                ),
                                ODWidth(5),
                                Text(
                                  "사진은 최대 3장까지 등록 가능합니다.",
                                  style: SpoqaHanSansNeo.regular.set(
                                    size: 11,
                                    height: 10,
                                    letter: -1,
                                    color: ColorStyles.black60,
                                  ),
                                ),
                              ],
                            ),
                            ODHeight(7),
                            SizedBox(
                              height: 70.r,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () => showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ODImageModal(
                                          onCameraTap: () async {
                                            if (ref.read(imagesProvider).length < 3) {
                                              final originalImage = await ImagePicker().pickImage(source: ImageSource.camera);

                                              if (originalImage != null) {
                                                final cropImage = await ImageCropper().cropImage(
                                                  sourcePath: originalImage.path,
                                                  maxWidth: 400,
                                                  maxHeight: 400,
                                                  compressQuality: 100,
                                                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                                                );
                                                if (cropImage != null) {
                                                  ref.read(imagesProvider.notifier).add(File(cropImage.path));
                                                }
                                              }
                                            }

                                            if (context.mounted) context.pop();
                                          },
                                          onGalleryTap: () async {
                                            if (ref.read(imagesProvider).length < 3) {
                                              final originalImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                                              if (originalImage != null) {
                                                final cropImage = await ImageCropper().cropImage(
                                                  sourcePath: originalImage.path,
                                                  maxWidth: 400,
                                                  maxHeight: 400,
                                                  compressQuality: 100,
                                                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                                                );
                                                if (cropImage != null) {
                                                  ref.read(imagesProvider.notifier).add(File(cropImage.path));
                                                }
                                              }
                                            }

                                            if (context.mounted) context.pop();
                                          },
                                        );
                                      },
                                    ),
                                    child: Container(
                                      height: 65.r,
                                      width: 65.r,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(width: 1.r, color: ColorStyles.black20),
                                      ),
                                      child: const Center(
                                        child: ODSvgImage(
                                          SvgImage.icAddCamera,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ODWidth(5),
                                  ...images.map(
                                    (image) => Container(
                                      margin: EdgeInsets.only(left: 5.w),
                                      height: 70.r,
                                      width: 70.r,
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Container(
                                            height: 65.r,
                                            width: 65.r,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(width: 1.r, color: ColorStyles.black20),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Image.file(
                                                image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                              onTap: () => ref.read(imagesProvider.notifier).delete(image),
                                              child: const ODSvgImage(
                                                SvgImage.icDelete,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ODHeight(28),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ODSafeBox(
                    bottom: true,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15.h, left: 20.w, right: 20.w),
                      child: ODButton(
                        isInsert.value ? "등록" : "저장",
                        onTap: () => upsertPost(context, ref),
                        type: ODButtonType.red,
                        enabled: ref.watch(upsertEnabledProvider),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (ref.watch(loadingProvider)) const ODLoading(),
          ],
        ),
      ),
    );
  }
}
