// ignore_for_file: library_prefixes

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_extension.dart';
import 'package:si_hicoach_fe/ui/common/inbody/models/inbody_model.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/create_today_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/get_inbodies_response.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/update_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/inbody_api.dart';

class InBodyViewModel extends InBodyDeleteFeature {
  int memberId = 0;
  int matchingId = 0;

  InBodyViewModel({
    required this.memberId,
    required this.matchingId,
  });

  List<InBodyModel> get inBodyModels => inbodies
      .map(
        (it) => InBodyModel(
          inbodyId: it.id,
          imageUrl: it.imageUrl,
          registedAt: it.registDate,
        ),
      )
      .toList();

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(todayInBodyCreateSuccess, (_) {
      todayInBodyCreateSuccess.value = false;
      loadingMsg.value = null;
      fetchMemberInbodies(memberId);
    });

    ever(inBodyUpdateSuccess, (_) {
      inBodyUpdateSuccess.value = false;
      loadingMsg.value = null;

      fetchMemberInbodies(memberId);
    });

    ever(inBodyDeleteSuccess, (_) {
      inBodyDeleteSuccess.value = false;
      fetchMemberInbodies(memberId);
    });

    ever(apiError, (_) {
      apiError.value = null;
      loadingMsg.value = null;
    });
  }
}

class InBodyDeleteFeature extends InBodyUpdateFeature {
  RxBool inBodyDeleteSuccess = RxBool(false);

  deleteInBody(int inbodyId) async {
    final result = await InBodyApi.deleteInBody(inbodyId);

    result.when(
      (e) => (apiError.value = e),
      (res) => (inBodyDeleteSuccess.value = res),
    );
  }
}

class InBodyUpdateFeature extends InBodyCreateFeature {
  RxBool inBodyUpdateSuccess = RxBool(false);

  updateInBody(int inbodyId, FilePickerResult filePickerResult) async {
    final multipartFiles = await Future.wait(
      filePickerResult.files.map((it) => it.toMultipartFile),
    );

    final dto = UpdateInBodyDto(multipartFiles);

    loadingMsg.value = "파일 업로드 중 입니다.";

    final result = await InBodyApi.updateInBody(inbodyId, dto);

    result.when(
      (e) => (apiError.value = e),
      (res) => (inBodyUpdateSuccess.value = res),
    );
  }
}

class InBodyCreateFeature extends InBodyFetchFeature {
  RxBool todayInBodyCreateSuccess = RxBool(false);
  RxnString loadingMsg = RxnString(null);

  createTodayInBody(int memberId, FilePickerResult filePickerResult) async {
    final multipartFiles = await Future.wait(
      filePickerResult.files.map((it) => it.toMultipartFile),
    );

    final dto = CreateTodayInBodyDto(
      memberId: memberId,
      files: multipartFiles,
    );

    loadingMsg.value = "파일 업로드 중 입니다.";

    final result = await InBodyApi.createTodayInBody(dto);

    result.when(
      (e) => apiError.value = e,
      (res) => (todayInBodyCreateSuccess.value = res),
    );
  }
}

class InBodyFetchFeature extends BaseInBodyViewModel {
  final Rxn<GetInbodiesResponse> fetchInbodyResponse = Rxn();

  List<Items> get inbodies => fetchInbodyResponse.value?.data.items ?? [];

  Future fetchMemberInbodies(int memberId) async {
    final result = await InBodyApi.getInBodies(memberId);

    result.when(
      (e) => apiError.value = e,
      (res) => fetchInbodyResponse.value = res,
    );
  }
}

class BaseInBodyViewModel extends GetxController {
  Rx<Exception?> apiError = Rx(null);
}
