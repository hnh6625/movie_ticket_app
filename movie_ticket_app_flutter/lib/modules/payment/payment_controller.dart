import 'dart:async';
import 'package:get/get.dart';
import '../../core/base_controller.dart';
import '../../data/services/api_client.dart';

class PaymentController extends BaseController {
  late final int showtimeId;
  late final List<int> showtimeSeatIds;
  late final Map<int, int> concessionQuantities;
  late final double totalPrice;

  final isProcessing = false.obs;
  final qrData = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    showtimeId = args['showtimeId'] as int;
    showtimeSeatIds = List<int>.from(args['showtimeSeatIds'] as List);
    concessionQuantities = Map<int, int>.from(args['concessionQuantities'] as Map);
    totalPrice = args['totalPrice'] as double;

    // Sinh nội dung QR giả lập, mô phỏng giống mã thanh toán thật
    qrData.value =
    'MOVIETICKET-PAYMENT|showtime:$showtimeId|amount:${totalPrice.toStringAsFixed(0)}|time:${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Người dùng bấm "Tôi đã quét & thanh toán" -> giả lập xử lý rồi tạo Order thật.
  Future<void> confirmPayment() async {
    isProcessing.value = true;
    errorMessage.value = null;

    // Giả lập thời gian xử lý thanh toán
    await Future.delayed(const Duration(seconds: 2));

    await runSafely(() async {
      final result = await client.order.create(
        showtimeId: showtimeId,
        showtimeSeatIds: showtimeSeatIds,
        concessionQuantities: concessionQuantities,
        paymentMethod: 'QR_MOCK',
      );

      if (!result.success) {
        errorMessage.value = result.message ?? 'Thanh toán thất bại';
        isProcessing.value = false;
        return;
      }

      final orderId = result.orderId!;
      isProcessing.value = false;
      Get.offNamed('/ticket', arguments: {'orderId': orderId});
    });

    isProcessing.value = false;
  }
}