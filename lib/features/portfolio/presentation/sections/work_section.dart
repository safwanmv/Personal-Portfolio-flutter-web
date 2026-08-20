import 'package:flutter/material.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../data/portfolio_data/projects_data.dart';
import '../widgets/project_card.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.sectionPadding(context),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                label: 'PORTFOLIO',
                title: 'Selected Work',
                subtitle:
                    "A selection of the products and cross-platform mobile applications I've built and maintained.",
              ),
              ...ProjectsData.projects.asMap().entries.map((entry) {
                final index = entry.key;
                final project = entry.value;
                return ProjectCard(
                  project: project,
                  index: index,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
