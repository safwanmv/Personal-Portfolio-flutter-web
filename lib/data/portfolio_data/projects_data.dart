import '../models/project_model.dart';

class ProjectsData {
  ProjectsData._();

  static const List<ProjectModel> projects = [
    ProjectModel(
      id: 'field-operations',
      title: 'Field Operations / Work Order Application',
      category: 'Professional Project',
      shortDescription:
          'A field operations application designed around multi-step work order creation, assignment, and status workflows built for field technicians.',
      keyContributions: [
        'Multi-step work order creation & assignment workflows',
        'Before and after photo capture with image annotation',
        'Signature capture & multipart image upload integration',
        'Company selection & secure authentication flows',
        'Offline drafts & queued background uploads for low-connectivity zones',
      ],
      techStack: ['Flutter', 'Dart', 'Provider', 'Hive', 'REST APIs'],
      // Replace this placeholder with actual project screenshot
      screenshotPath: 'assets/images/projects/field_operations/field_ops_preview.png',
      isConfidential: true,
      confidentialNotice:
          'Professional project — selected details shown due to confidentiality.',
      detailedHighlights: [
        'Designed multi-step state machine for work order lifecycle (Draft -> Assigned -> In Progress -> Review -> Completed).',
        'Integrated local Hive database for instant offline caching of draft submissions and high-res photo metadata.',
        'Implemented background queue processor that automatically synchronizes queued jobs when cellular network becomes available.',
        'Added custom canvas signature pad and drawing annotations directly on captured photos before server upload.',
      ],
    ),
    ProjectModel(
      id: 'jsm-jewellery-scheme',
      title: 'JSM — Jewellery Scheme Management',
      category: 'Professional Project',
      shortDescription:
          'Customer and agent applications built from a single shared Flutter codebase using environment-specific Flutter flavors.',
      keyContributions: [
        'Jewellery scheme & installment payment tracking',
        'Door-to-door field collection with optimized route selection',
        'Offline collection queue with automatic background sync',
        'Odoo ERP integration using custom JSON-RPC calls & token refresh',
        'Digital receipt generation, sharing, and Google Maps branch locator',
      ],
      techStack: [
        'Flutter',
        'Provider',
        'Odoo JSON-RPC',
        'Google Maps',
        'Offline Storage'
      ],
      // Replace this placeholder with actual project screenshot
      screenshotPath: 'assets/images/projects/jsm/jsm_preview.png',
      isConfidential: true,
      confidentialNotice:
          'Professional project — selected details shown due to confidentiality.',
      detailedHighlights: [
        'Structured white-label architecture using Flutter flavors (`customer` & `agent` target bundles) sharing 85%+ common logic.',
        'Handled Odoo ERP backend communication over JSON-RPC protocol with robust session recovery and token retry interceptors.',
        'Engineered offline-first payment logging for field agents collecting daily installments in low signal rural areas.',
        'Built PDF receipt generator allowing agents to immediately print or share payment slips via WhatsApp/Email.',
      ],
    ),
    ProjectModel(
      id: 'family-intelligence-platform',
      title: 'Family Intelligence Platform',
      category: 'Team Project',
      shortDescription:
          'An interactive platform for exploring and managing multi-generational family information, business directories, and real-time updates.',
      keyContributions: [
        'Interactive family tree rendering using GraphView engine',
        'Family member profiles, search, filtering, and media gallery',
        'JWT authentication, Dio interceptors, and secure token refresh',
        'Hive local data caching for lightning-fast profile browsing',
        'Real-time announcements and notifications via Socket.IO',
      ],
      techStack: [
        'Flutter',
        'Dio',
        'Hive',
        'GraphView',
        'Socket.IO',
        'Node.js APIs'
      ],
      // Replace this placeholder with actual project screenshot
      screenshotPath: 'assets/images/projects/family_platform/family_preview.png',
      isConfidential: false,
      detailedHighlights: [
        'Rendered complex multi-generational tree hierarchies using custom node layouts and GraphView force-directed graphs.',
        'Configured Dio HTTP client with automatic auth refresh tokens and network error boundary handlers.',
        'Implemented Socket.IO listeners to push instant family announcements and broadcast events to active app instances.',
        'Structured modular data caching using Hive boxes to enable full offline browsing of cached family directories.',
      ],
    ),
    ProjectModel(
      id: 'school-management-system',
      title: 'School Management System',
      category: 'Independent Project · In Development',
      shortDescription:
          'A role-based school management mobile app providing customized workflows for administrators, teachers, students, and parents.',
      keyContributions: [
        'Role-based dashboard & permissions (Admin / Teacher / Student)',
        'Attendance tracking, exam scheduling, and gradebook management',
        'Fee structure tracking, payments summary, and timetable schedules',
        'Clean feature-based architecture with Provider state management',
        'Dual storage strategy using Hive for fast key-value data & SQLite for relational records',
      ],
      techStack: ['Flutter', 'Provider', 'Dio', 'Hive', 'SQLite'],
      // Replace this placeholder with actual project screenshot
      screenshotPath: 'assets/images/projects/school_management/school_preview.png',
      githubUrl: 'https://github.com/safwanmv', // Configurable repository link
      isConfidential: false,
      detailedHighlights: [
        'Architected clean feature-based directory structure separating UI widgets, state providers, and repository layers.',
        'Designed role-aware navigation routers hiding admin controls from student profiles while serving unified code.',
        'Leveraged SQLite via `sqflite` for relational gradebook lookups alongside Hive for lightweight UI settings.',
        'Integrated Dio request handlers to manage multi-part assignment uploads and grade report downloads.',
      ],
    ),
    ProjectModel(
      id: 'selection-trials',
      title: 'Selection Trials Platform',
      category: 'Academic Team Project · Project Lead',
      shortDescription:
          'A collaborative platform built to connect sports players, training academies, and talent scouts for organized trial events.',
      keyContributions: [
        'Led a 4-member mobile development team from planning through delivery',
        'Architected admin, academy, coach, and player interaction modules',
        'Planned REST API contracts and backend synchronization workflows',
        'Implemented trial event registration, status updates, and player evaluation cards',
      ],
      techStack: ['Flutter', 'Python', 'Django', 'REST APIs'],
      // Replace this placeholder with actual project screenshot
      screenshotPath: 'assets/images/projects/selection_trials/trials_preview.png',
      isConfidential: false,
      detailedHighlights: [
        'Organized sprint tasks and Git feature branch strategy across 4 student developers.',
        'Integrated Python/Django REST API endpoints for user role verification, trial registration, and scoring sheets.',
        'Built responsive player profile cards showing physical metrics, position statistics, and trial attendance history.',
      ],
    ),
  ];
}
