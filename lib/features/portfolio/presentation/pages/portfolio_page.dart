import 'package:flutter/material.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/proof_section.dart';
import '../sections/skills_section.dart';
import '../sections/work_section.dart';
import '../sections/workflow_section.dart';
import '../widgets/footer.dart';
import '../widgets/portfolio_navbar.dart';

class PortfolioPage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const PortfolioPage({
    super.key,
    required this.onToggleTheme,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'hero';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Determine active section based on scroll offset
    final offset = _scrollController.offset;
    if (offset < 400) {
      if (_activeSection != 'hero') setState(() => _activeSection = 'hero');
    } else if (offset < 1000) {
      if (_activeSection != 'about') setState(() => _activeSection = 'about');
    } else if (offset < 1700) {
      if (_activeSection != 'experience') setState(() => _activeSection = 'experience');
    } else if (offset < 3000) {
      if (_activeSection != 'work') setState(() => _activeSection = 'work');
    } else if (offset < 3900) {
      if (_activeSection != 'skills') setState(() => _activeSection = 'skills');
    } else {
      if (_activeSection != 'contact') setState(() => _activeSection = 'contact');
    }
  }

  void _scrollToSection(String sectionKey) {
    GlobalKey targetKey;
    switch (sectionKey) {
      case 'hero':
        targetKey = _heroKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'work':
        targetKey = _workKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
      default:
        targetKey = _heroKey;
    }

    final targetContext = targetKey.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PortfolioNavbar(
        onToggleTheme: widget.onToggleTheme,
        onSelectSection: _scrollToSection,
        activeSection: _activeSection,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(key: _heroKey, child: HeroSection(
              onViewWork: () => _scrollToSection('work'),
              onGetInTouch: () => _scrollToSection('contact'),
            )),
            const ProofSection(),
            Container(key: _aboutKey, child: const AboutSection()),
            Container(key: _experienceKey, child: const ExperienceSection()),
            Container(key: _workKey, child: const WorkSection()),
            Container(key: _skillsKey, child: const SkillsSection()),
            const WorkflowSection(),
            const EducationSection(),
            Container(key: _contactKey, child: const ContactSection()),
            Footer(
              onScrollToTop: () => _scrollToSection('hero'),
            ),
          ],
        ),
      ),
    );
  }
}
