import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/notification/notification_types.dart';
import 'package:si_hicoach_fe/infrastructure/notifications/agreed_notification_api.dart';
import 'package:si_hicoach_fe/infrastructure/notifications/dto/get_agreed_notifi_list_response.dart';

class MemberNotificationViewModel extends _MemberAgreedNotifiDeleteFeature {
  toggleNotifiAllow(PushNotifiTypes type) {
    if (isAgreedNotifi(type)) {
      return _deleteAgreedNotifi(type);
    }

    _createAgreedNotifi(type);
  }
}

// 멤버가 푸시 알림에 미동의
class _MemberAgreedNotifiDeleteFeature
    extends _MemberAgreedNotifiCreateFeature {
  final RxBool _agreedNotifiDeleteSuccess = RxBool(false);

  Future _deleteAgreedNotifi(PushNotifiTypes type) async {
    final target = getAgreedNotifi(type);

    if (target == null) return;

    final result = await AgreedNotificationApi.delete(target.id);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_agreedNotifiDeleteSuccess.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(_agreedNotifiDeleteSuccess, (_) {
      _agreedNotifiDeleteSuccess.value = false;
      fetchAgreedNotifiList();
    });
  }
}

// 멤버가 푸시 알림에 동의
class _MemberAgreedNotifiCreateFeature extends _MemberAgreedNotifiFetchFeature {
  final RxBool _agreedNotifiCreateSuccess = RxBool(false);

  Future _createAgreedNotifi(PushNotifiTypes type) async {
    final result = await AgreedNotificationApi.create(type);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_agreedNotifiCreateSuccess.value = res),
    );
  }

  @override
  void onInit() {
    super.onInit();

    ever(_agreedNotifiCreateSuccess, (_) {
      _agreedNotifiCreateSuccess.value = false;
      fetchAgreedNotifiList();
    });
  }
}

// 멤버가 동의한 푸시 알림 목록 불러오기
class _MemberAgreedNotifiFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);
  final Rxn<GetAgreedNotifiListResponse> _agreedNotifiFetchResponse = Rxn(null);
  List<Items>? get _agreedNotifications =>
      _agreedNotifiFetchResponse.value?.data.items;

  // 수업 일지 등록 알림 허용 여부
  bool get isStudyCreatedNotifiAllow =>
      _agreedNotifications?.any(
        (it) => it.type == PushNotifiTypes.createStudy.key,
      ) ??
      false;

  // 수업 횟수 변경 알림 허용 여부
  bool get isTicketCountChangeNotifiAllow =>
      _agreedNotifications?.any(
        (it) => it.type == PushNotifiTypes.changedTicketCount.key,
      ) ??
      false;

  // 푸시 알림 데이터 찾기
  Items? getAgreedNotifi(PushNotifiTypes type) {
    return _agreedNotifications?.firstWhereOrNull(
      (it) => it.type == type.key,
    );
  }

  // 푸시 알림이 동의되어 있는지
  bool isAgreedNotifi(PushNotifiTypes type) {
    return getAgreedNotifi(type) != null;
  }

  Future fetchAgreedNotifiList() async {
    final result = await AgreedNotificationApi.getAgreedNotifiList();

    result.when(
      (e) => (apiError.value = e),
      (res) => (_agreedNotifiFetchResponse.value = res),
    );
  }
}
