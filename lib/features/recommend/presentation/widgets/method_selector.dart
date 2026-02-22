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
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '분석 방법 선택',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: selectedCodes.isEmpty
                    ? colorScheme.errorContainer
                    : colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${selectedCodes.length}/3',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: selectedCodes.isEmpty
                      ? colorScheme.onErrorContainer
                      : colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...methods.where((m) => m.isActive).map((method) {
          final isSelected = selectedCodes.contains(method.code);
          final canSelect = selectedCodes.length < 3 || isSelected;
          final desc = kMethodDescriptions[method.code];
          final selectionOrder =
              isSelected ? selectedCodes.indexOf(method.code) + 1 : null;

          return _MethodCard(
            method: method,
            description: desc,
            isSelected: isSelected,
            canSelect: canSelect,
            selectionOrder: selectionOrder,
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
                color: colorScheme.error,
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
  final int? selectionOrder;
  final ValueChanged<bool?> onChanged;

  const _MethodCard({
    required this.method,
    required this.description,
    required this.isSelected,
    required this.canSelect,
    required this.selectionOrder,
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
    final colorScheme = theme.colorScheme;
    final desc = widget.description;
    final displayLabel = desc?.label ?? widget.method.name;
    final displayTagline = desc?.tagline ?? widget.method.description;
    final isDisabled = !widget.canSelect && !widget.isSelected;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: widget.isSelected
              ? LinearGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.18),
                    colorScheme.tertiary.withValues(alpha: 0.10),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: widget.isSelected
              ? null
              : isDisabled
                  ? colorScheme.surfaceContainerLow.withValues(alpha: 0.5)
                  : colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isSelected
                ? colorScheme.primary.withValues(alpha: 0.7)
                : colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: widget.isSelected ? 1.5 : 1.0,
          ),
          boxShadow: widget.isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.18),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: isDisabled ? null : () => widget.onChanged(!widget.isSelected),
            splashColor: colorScheme.primary.withValues(alpha: 0.12),
            highlightColor: colorScheme.primary.withValues(alpha: 0.06),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 8, 14),
                  child: Row(
                    children: [
                      // 선택 순서 인디케이터 (원형)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutBack,
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.isSelected
                              ? colorScheme.primary
                              : Colors.transparent,
                          border: Border.all(
                            color: widget.isSelected
                                ? colorScheme.primary
                                : isDisabled
                                    ? colorScheme.outlineVariant
                                        .withValues(alpha: 0.4)
                                    : colorScheme.outlineVariant,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, anim) =>
                                ScaleTransition(scale: anim, child: child),
                            child: widget.isSelected
                                ? Text(
                                    '${widget.selectionOrder}',
                                    key: ValueKey(widget.selectionOrder),
                                    style: TextStyle(
                                      color: colorScheme.onPrimary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    ),
                                  )
                                : Icon(
                                    Icons.add,
                                    key: const ValueKey('add'),
                                    size: 14,
                                    color: isDisabled
                                        ? colorScheme.outlineVariant
                                            .withValues(alpha: 0.4)
                                        : colorScheme.outlineVariant,
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // 제목 + 설명
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style: (theme.textTheme.bodyLarge ??
                                      const TextStyle())
                                  .copyWith(
                                fontWeight: FontWeight.w700,
                                color: widget.isSelected
                                    ? colorScheme.primary
                                    : isDisabled
                                        ? colorScheme.onSurface
                                            .withValues(alpha: 0.38)
                                        : colorScheme.onSurface,
                              ),
                              child: Text(displayLabel),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              displayTagline,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isDisabled
                                    ? colorScheme.onSurface
                                        .withValues(alpha: 0.38)
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 펼치기 버튼
                      if (desc != null)
                        IconButton(
                          icon: AnimatedRotation(
                            turns: _expanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                              Icons.expand_more,
                              size: 20,
                              color: widget.isSelected
                                  ? colorScheme.primary.withValues(alpha: 0.8)
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                          tooltip: _expanded ? '접기' : '자세히 보기',
                          onPressed: () =>
                              setState(() => _expanded = !_expanded),
                        ),
                    ],
                  ),
                ),
                // 상세 설명 패널
                if (desc != null)
                  AnimatedCrossFade(
                    firstChild: const SizedBox.shrink(),
                    secondChild: _DescriptionPanel(
                      desc: desc,
                      theme: theme,
                      isSelected: widget.isSelected,
                    ),
                    crossFadeState: _expanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DescriptionPanel extends StatefulWidget {
  final MethodDescription desc;
  final ThemeData theme;
  final bool isSelected;

  const _DescriptionPanel({
    required this.desc,
    required this.theme,
    required this.isSelected,
  });

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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      decoration: BoxDecoration(
        color: widget.isSelected
            ? colorScheme.primary.withValues(alpha: 0.05)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        border: Border(
          top: BorderSide(
            color: widget.isSelected
                ? colorScheme.primary.withValues(alpha: 0.2)
                : colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            widget.desc.description,
            style: theme.textTheme.bodySmall?.copyWith(
              height: 1.6,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => setState(() => _showTechNote = !_showTechNote),
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
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
