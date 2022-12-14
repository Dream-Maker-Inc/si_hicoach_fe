import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/dto/get_my_info_response.dart';
import 'package:si_hicoach_fe/infrastructure/member/member/member_api.dart';
import 'package:tuple/tuple.dart';

class MemberAccountDetailViewModel extends _MyInfoFetchFeature {
  String get name => member?.name ?? "";
  String get email => member?.email ?? "";
  String get birthDay => member?.birthDay.toKoreanFormat ?? "";
  String get phone => member?.phone ?? "";
  String get trainerName => trainer?.name ?? "";
  String get trainerCompanyName => trainer?.trainerInfo.companyName ?? "";

  List<Tuple2<String, String>> get columns {
    final list = [
      Tuple2("이름", name),
      Tuple2("아이디 (이메일)", email),
      Tuple2("생년월일", birthDay),
      Tuple2("전화번호", phone),
    ];

    if (trainerName.isNotEmpty) {
      list.add(Tuple2("담당 트레이너", trainerName));
      list.add(Tuple2("소속", trainerCompanyName));
    }

    return list;
  }
}

// 내 정보 불러오기
class _MyInfoFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetMyInfoResponse> fetchAccountPageResponse = Rxn();
  Data? get data => fetchAccountPageResponse.value?.data;

  Member? get member => data?.member;
  Trainer? get trainer => data?.trainer;

  Future fetchData() async {
    final result = await MemberApi.findMe();

    result.when(
      (e) => (apiError.value = e),
      (res) => (fetchAccountPageResponse.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(apiError, (_) => (apiError.value = null));
  }
}
