import 'package:flutter/material.dart';
import '../../../../core/constants/method_descriptions.dart';
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
          final desc = kMethodDescriptions[method.code];

          return _MethodCard(
            method: method,
            description: desc,
            isSelected: isSelected,
            canSelect: canSelect,
            onChanged: (value) {
              final updated = List<String>.from(selectedCodes);
              if (value == true) {
                updated.add(method.code);
              } else {
                updated.remove(method.code);
              }
              onChanged(updated);
            },
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

class _MethodCard extends StatefulWidget {
  final AnalysisMethod method;
  final MethodDescription? description;
  final bool isSelected;
  final bool canSelect;
  final ValueChanged<bool?> onChanged;

  const _MethodCard({
    required this.method,
    required this.description,
    required this.isSelected,
    required this.canSelect,
    required this.onChanged,
  });

  @override
  State<_MethodCard> createState() => _MethodCardState();
}

class _MethodCardState extends State<_MethodCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final desc = widget.description;
    final displayLabel = desc?.label ?? widget.method.name;
    final displayTagline = desc?.tagline ?? widget.method.description;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          CheckboxListTile(
            value: widget.isSelected,
            onChanged: widget.canSelect ? widget.onChanged : null,
            title: Text(
              displayLabel,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              displayTagline,
              style: theme.textTheme.bodySmall,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            // 상세 설명 펼치기 버튼
            secondary: desc != null
                ? IconButton(
                    icon: AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(Icons.expand_more, size: 20),
                    ),
                    tooltip: _expanded ? '접기' : '자세히 보기',
                    onPressed: () => setState(() => _expanded = !_expanded),
                  )
                : null,
          ),
          // 접기/펼치기 상세 설명
          if (desc != null)
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: _DescriptionPanel(desc: desc, theme: theme),
              crossFadeState: _expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
        ],
      ),
    );
  }
}

class _DescriptionPanel extends StatefulWidget {
  final MethodDescription desc;
  final ThemeData theme;

  const _DescriptionPanel({required this.desc, required this.theme});

  @override
  State<_DescriptionPanel> createState() => _DescriptionPanelState();
}

class _DescriptionPanelState extends State<_DescriptionPanel> {
  bool _showTechNote = false;

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 16),
          Text(
            widget.desc.description,
            style: theme.textTheme.bodySmall?.copyWith(
              height: 1.6,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          // 전문가 노트 토글
          InkWell(
            onTap: () => setState(() => _showTechNote = !_showTechNote),
            borderRadius: BorderRadius.circular(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _showTechNote ? Icons.science : Icons.science_outlined,
                  size: 14,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 4),
                Text(
                  _showTechNote ? '전문가 노트 접기' : '전문가 노트 보기',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (_showTechNote) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Text(
                widget.desc.techNote,
                style: theme.textTheme.bodySmall?.copyWith(
                  height: 1.6,
                  color: colorScheme.onPrimaryContainer,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
