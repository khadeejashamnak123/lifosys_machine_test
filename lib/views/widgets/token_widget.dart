import 'package:flutter/material.dart';
import 'package:machine_test_lifosys/provider/main_provider.dart';
import 'package:provider/provider.dart';

Widget tokenWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Consumer<MainProvider>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Token',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF1E293B),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Color(0xFF1E293B),
                    ),
                    onPressed: () {
                      value.scrollUp();
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF1E293B),
                    ),
                    onPressed: () {
                      value.scrollDown();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
      const SizedBox(height: 12),
      Consumer<MainProvider>(
        builder: (context, value, child) {
          return SizedBox(
            height: 200,
            child: GridView.builder(
              controller: value.scrollController,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.3,
              ),
              itemCount: value.tokens.length,
              itemBuilder: (context, index) {
                final token = value.tokens[index];
                final bool isSelected = value.selectedToken == token.id;
                final bool isBooked = token.booked;

                return GestureDetector(
                  onTap: isBooked
                      ? null
                      : () {
                          value.selectToken(token.id);
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF0B1437)
                            : const Color(0xFFE5E7EB),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                token.id.toString().padLeft(2, '0'),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: isBooked
                                      ? const Color(0xFFE5E7EB)
                                      : isSelected
                                      ? const Color(0xFF0B1437)
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                token.time,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isBooked
                                      ? const Color(0xFFFADADD)
                                      : isSelected
                                      ? const Color(0xFFEC286F)
                                      : const Color(0xFFEC286F),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            right: 1,
                            top: 0,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0B1437),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    ],
  );
}
