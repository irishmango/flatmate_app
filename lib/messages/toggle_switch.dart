import 'package:flutter/material.dart';

enum Mode { People, Households }

class ToggleSwitch extends StatefulWidget {
  final Function(Mode) onChanged;
  final Mode initialMode;

  const ToggleSwitch({super.key, required this.onChanged, this.initialMode = Mode.People});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late Mode selectedMode;

  @override
  void initState() {
    super.initState();
    selectedMode = widget.initialMode;
  }

  Widget _buildToggleIcon(Mode mode, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: Alignment.center,
      child: Icon(
        mode == Mode.People ? Icons.person : Icons.home,
        color: isSelected ? Colors.green : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: selectedMode == Mode.People ? Alignment.centerLeft : Alignment.centerRight,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Container(
              width: 60,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox.expand(
            child: Row(
              children: Mode.values.map((mode) {
                final isSelected = selectedMode == mode;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isSelected) {
                        setState(() => selectedMode = mode);
                        widget.onChanged(mode);
                      }
                    },
                    child: Center(
                      child: _buildToggleIcon(mode, isSelected),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}