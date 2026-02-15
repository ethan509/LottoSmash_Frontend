import 'package:flutter/material.dart';
import '../../data/models/recommend_models.dart';

class MethodSelector extends StatelessWidget {
  final List<AnalysisMethod> methods;
  final List<String> selectedCodes;
  final ValueChanged<List<String>> onChanged;

  const MethodSelector({
    super.key,
    required this.methods,
    required this.selectedCodes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '분석 방법 선택 (최대 3개)',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...methods.where((m) => m.isActive).map((method) {
          final isSelected = selectedCodes.contains(method.code);
          final canSelect = selectedCodes.length < 3 || isSelected;

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: CheckboxListTile(
              value: isSelected,
              onChanged: canSelect
                  ? (value) {
                      final updated = List<String>.from(selectedCodes);
                      if (value == true) {
                        updated.add(method.code);
                      } else {
                        updated.remove(method.code);
                      }
                      onChanged(updated);
                    }
                  : null,
              title: Text(
                method.name,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                method.description,
                style: theme.textTheme.bodySmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        }),
        if (selectedCodes.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              '최소 1개의 분석 방법을 선택해주세요',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
