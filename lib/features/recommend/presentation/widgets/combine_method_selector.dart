import 'package:flutter/material.dart';
import '../../data/models/recommend_models.dart';

class CombineMethodSelector extends StatelessWidget {
  final List<CombineMethod> methods;
  final String selectedCode;
  final ValueChanged<String> onChanged;
  final List<String> selectedMethodCodes;
  final Map<String, double> weights;
  final ValueChanged<Map<String, double>> onWeightsChanged;
  final String minMaxMode;
  final ValueChanged<String> onMinMaxChanged;

  const CombineMethodSelector({
    super.key,
    required this.methods,
    required this.selectedCode,
    required this.onChanged,
    required this.selectedMethodCodes,
    required this.weights,
    required this.onWeightsChanged,
    required this.minMaxMode,
    required this.onMinMaxChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '결합 방법 선택',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RadioGroup<String>(
          groupValue: selectedCode,
          onChanged: (value) {
            if (value != null) onChanged(value);
          },
          child: Column(
            children: methods.map((method) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      value: method.code,
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
                    ),
                    // WEIGHTED_AVG: 가중치 슬라이더
                    if (method.code == 'WEIGHTED_AVG' &&
                        selectedCode == 'WEIGHTED_AVG' &&
                        selectedMethodCodes.isNotEmpty)
                      _WeightSliders(
                        methodCodes: selectedMethodCodes,
                        weights: weights,
                        onChanged: onWeightsChanged,
                      ),
                    // MIN_MAX: MAX/MIN 선택
                    if (method.code == 'MIN_MAX' && selectedCode == 'MIN_MAX')
                      _MinMaxSelector(
                        mode: minMaxMode,
                        onChanged: onMinMaxChanged,
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _WeightSliders extends StatelessWidget {
  final List<String> methodCodes;
  final Map<String, double> weights;
  final ValueChanged<Map<String, double>> onChanged;

  const _WeightSliders({
    required this.methodCodes,
    required this.weights,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // 가중치가 비어있으면 균등 분배
    final currentWeights = Map<String, double>.from(weights);
    for (final code in methodCodes) {
      currentWeights.putIfAbsent(code, () => 1.0 / methodCodes.length);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text(
            '가중치 설정 (합계: 1.0)',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ...methodCodes.map((code) {
            final weight = currentWeights[code] ?? 0.0;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      code,
                      style: theme.textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: weight.clamp(0.0, 1.0),
                      min: 0.0,
                      max: 1.0,
                      divisions: 20,
                      label: weight.toStringAsFixed(2),
                      onChanged: (value) {
                        final updated =
                            Map<String, double>.from(currentWeights);
                        updated[code] = value;
                        // 나머지를 균등 분배
                        final others =
                            methodCodes.where((c) => c != code).toList();
                        if (others.isNotEmpty) {
                          final remaining = (1.0 - value).clamp(0.0, 1.0);
                          final each = remaining / others.length;
                          for (final other in others) {
                            updated[other] = each;
                          }
                        }
                        onChanged(updated);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Text(
                      weight.toStringAsFixed(2),
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _MinMaxSelector extends StatelessWidget {
  final String mode;
  final ValueChanged<String> onChanged;

  const _MinMaxSelector({
    required this.mode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          const Divider(),
          RadioGroup<String>(
            groupValue: mode,
            onChanged: (v) {
              if (v != null) onChanged(v);
            },
            child: Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'MAX',
                    title: const Text('MAX (낙관적)'),
                    dense: true,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'MIN',
                    title: const Text('MIN (보수적)'),
                    dense: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
