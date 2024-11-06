import 'package:appunificada/widgets/custom_header.dart';
import 'package:appunificada/widgets/custom_percentage_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:appunificada/providers/tips_provider.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HeadersTriangulo(),
          Positioned(
            bottom: 7,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Title(),
              const SizedBox(height: 10),
              _TipsAmount(),
              const SizedBox(height: 20),
              _TipsListPercentage(),
              const SizedBox(height: 20),
              _TotalAmount(),
            ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Ingrese el monto a pagar',
      style: TextStyle(fontSize: 20),
    );
  }
}

class _TipsAmount extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              final enteredAmount = double.tryParse(controller.text) ?? 0.0;
              Provider.of<TipsProvider>(context, listen: false).setAmount =
                  enteredAmount;
              FocusScope.of(context).unfocus();
            },
            icon: const FaIcon(FontAwesomeIcons.paperPlane),
          ),
        ),
      ),
    );
  }
}

class _TipsListPercentage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TipsProvider>(
      builder: (context, provider, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: provider.availableTipPercentages.map((percentage) {
                  return PercentageWidget(
                    percentage: percentage,
                    isSelected: provider.selectedTipPercentage == percentage,
                    onTap: () {
                      provider.selectTipPercentage(percentage);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TotalAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TipsProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Text(
              'Propina: \$${provider.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        );
      },
    );
  }
}
