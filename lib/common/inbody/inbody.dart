import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/dio/dio_helper.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_extension.dart';
import 'package:si_hicoach_fe/common/utils/get_date_time.dart';
import 'package:si_hicoach_fe/common/inbody/item.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/update_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class InbodyProps {
  final String imageUrl;
  final String dateTime;

  InbodyProps(this.imageUrl, this.dateTime);
}

class InbodyView extends StatefulWidget {
  const InbodyView({Key? key}) : super(key: key);

  @override
  State<InbodyView> createState() => _InbodyViewState();
}

class _InbodyViewState extends State<InbodyView> {
  List<InbodyProps> list = [
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
    InbodyProps(
      'https://placeimg.com/640/480/any',
      Utils.getCurrentDateTime('year_month_date'),
    ),
  ];

  // TODO: 코드 정리
  void _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      onFileLoading: (FilePickerStatus status) => print('loading : $status'),
    );

    if (result == null) return;

    ///
    final multipartFiles =
        await Future.wait(result.files.map((it) => it.toMultipartFile));

    ///

    ///
    final dto = UpdateInBodyDto(multipartFiles);

    final rrr = await StudyApi.updateInBody(1, dto);

    Logger().d(rrr);

    ///
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarArrowBack(
        titleText: '인바디 데이터',
        actionsWidget: <Widget>[
          IconButton(
            onPressed: _pickImage,
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(defaultPadding),
        children: List.from(
          list.map(
            (it) => InbodyItem(
              imageUrl: it.imageUrl,
              dateTime: it.dateTime,
            ),
          ),
        ),
      ),
    );
  }
}
