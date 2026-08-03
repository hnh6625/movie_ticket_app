import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'seat_selection_controller.dart';
import 'seat_display_model.dart';

class SeatSelectionView extends GetView<SeatSelectionController> {
  const SeatSelectionView({super.key});

  Color _seatColor(SeatDisplayModel s) {
    if (s.status == 'BOOKED') return Colors.grey;
    if (s.status == 'HELD') return s.isHeldByMe ? Colors.orange : Colors.red.shade200;
    switch (s.seat.seatType) {
      case 'VIP':
        return Colors.amber;
      case 'COUPLE':
        return Colors.pink.shade200;
      default:
        return Colors.blue.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chọn ghế')),
      body: Obx(() {
        if (controller.isLoading.value && controller.seats.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            if (controller.remainingSeconds.value != null)
              Container(
                color: Colors.orange.shade50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Giữ ghế trong: ${controller.remainingSeconds.value}s',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            if (controller.errorMessage.value != null)
              Container(
                color: Colors.red.shade50,
                padding: const EdgeInsets.all(8),
                child: Text(
                  controller.errorMessage.value!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: controller.seats.length,
                itemBuilder: (context, index) {
                  final s = controller.seats[index];
                  return GestureDetector(
                    onTap: () => controller.onSeatTap(s),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _seatColor(s),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      alignment: Alignment.center,
                      child: Text(s.label, style: const TextStyle(fontSize: 10)),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: controller.goToConcessions,
                child: Obx(() => Text(
                    'Tiếp tục (${controller.mySelectedShowtimeSeatIds.length} ghế - ${controller.totalPrice.toStringAsFixed(0)}đ)')),
              ),
            ),
          ],
        );
      }),
    );
  }
}