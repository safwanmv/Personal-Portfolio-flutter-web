import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

enum DeviceMockupPreset {
  fieldOps,
  jsmScheme,
  familyTree,
  schoolDash,
  trialsFeed,
  generic,
}

class MobileDeviceFrame extends StatelessWidget {
  final String imagePath;
  final String title;
  final DeviceMockupPreset preset;
  final double width;
  final double height;

  const MobileDeviceFrame({
    super.key,
    required this.imagePath,
    required this.title,
    this.preset = DeviceMockupPreset.generic,
    this.width = 280,
    this.height = 560,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(38.0),
        border: Border.all(
          color: isDark ? const Color(0xFF334155) : const Color(0xFF475569),
          width: 8.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.15),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Stack(
          children: [
            // Screen Background
            Positioned.fill(
              child: Container(
                color: isDark ? const Color(0xFF0D1321) : const Color(0xFFF1F5F9),
                child: (imagePath.contains('_preview.png') ||
                        imagePath.contains('placeholder') ||
                        imagePath.isEmpty)
                    ? _buildConceptualUIPreview(context, isDark)
                    : Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildConceptualUIPreview(context, isDark);
                        },
                      ),
              ),
            ),

            // Top Camera Punch Hole / Dynamic Island
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 76,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E293B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Navigation Indicator Bar
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 110,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white54 : Colors.black45,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConceptualUIPreview(BuildContext context, bool isDark) {
    // // Replace this placeholder with actual project screenshot
    final primaryColor = isDark ? AppColors.primaryDark : AppColors.primaryLight;
    final cardBg = isDark ? const Color(0xFF1E293B) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subtextColor = isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B);

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 38, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Header Bar Mockup
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF10B981),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Sync Active (Hive)',
                            style: TextStyle(fontSize: 8, color: subtextColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              CircleAvatar(
                radius: 12,
                backgroundColor: primaryColor.withValues(alpha: 0.2),
                child: Icon(Icons.person, size: 12, color: primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Preset specific body layout
          Expanded(
            child: ClipRect(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: _buildPresetContent(primaryColor, cardBg, textColor, subtextColor),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Code Comment Hint Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined, size: 10, color: Colors.amberAccent),
                SizedBox(width: 4),
                Flexible(
                  child: Text(
                    'SCREENSHOT PLACEHOLDER',
                    style: TextStyle(
                      fontSize: 7.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.4,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresetContent(
    Color primaryColor,
    Color cardBg,
    Color textColor,
    Color subtextColor,
  ) {
    switch (preset) {
      case DeviceMockupPreset.fieldOps:
        return Column(
          children: [
            _mockCard(
              cardBg,
              primaryColor,
              'Work Order #WO-408',
              'HVAC Maintenance · Priority High',
              'Step 3 of 4: Signature Capture',
              Icons.assignment_outlined,
            ),
            const SizedBox(height: 8),
            _mockCard(
              cardBg,
              const Color(0xFF10B981),
              'Offline Queue Status',
              '2 Drafts Pending Sync',
              'Hive Cache Enabled',
              Icons.cloud_upload_outlined,
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Inspection Photos',
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      _photoThumbnail('Before', primaryColor),
                      const SizedBox(width: 6),
                      _photoThumbnail('After', const Color(0xFF10B981)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      case DeviceMockupPreset.jsmScheme:
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('JSM Gold Savings Scheme',
                      style: TextStyle(fontSize: 9, color: Colors.white70)),
                  const SizedBox(height: 2),
                  const Text('₹12,500 Collected',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text('Flavor: Agent App',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text('Odoo Sync: OK',
                          style: TextStyle(fontSize: 8, color: Colors.amberAccent)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _mockListItem(cardBg, textColor, subtextColor, 'Field Collection #892',
                'Door-to-door · Instant Receipt'),
            _mockListItem(cardBg, textColor, subtextColor, 'Branch Locator',
                'Google Maps Integration'),
            _mockListItem(cardBg, textColor, subtextColor, 'Offline Transaction Log',
                'Queued RPC Retry Handling'),
          ],
        );
      case DeviceMockupPreset.familyTree:
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_tree_outlined, size: 14, color: primaryColor),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text('GraphView Family Tree',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 14,
                      backgroundColor: primaryColor,
                      child: const Icon(Icons.person, size: 14, color: Colors.white)),
                  Container(width: 2, height: 12, color: primaryColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: subtextColor.withValues(alpha: 0.3),
                          child: Icon(Icons.person, size: 12, color: textColor)),
                      CircleAvatar(
                          radius: 12,
                          backgroundColor: subtextColor.withValues(alpha: 0.3),
                          child: Icon(Icons.person, size: 12, color: textColor)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('Real-time updates via Socket.IO',
                      style: TextStyle(fontSize: 8, color: subtextColor)),
                ],
              ),
            ),
          ],
        );
      default:
        return Column(
          children: [
            _mockCard(
              cardBg,
              primaryColor,
              title,
              'Flutter Mobile App Module',
              'Clean Architecture · Provider',
              Icons.mobile_friendly_rounded,
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Key Specifications',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: textColor)),
                  const SizedBox(height: 6),
                  _specRow(textColor, subtextColor, 'State', 'Provider'),
                  _specRow(textColor, subtextColor, 'Storage', 'Hive / SQLite'),
                  _specRow(textColor, subtextColor, 'Network', 'Dio + REST'),
                ],
              ),
            ),
          ],
        );
    }
  }

  Widget _mockCard(
    Color bg,
    Color accent,
    String title,
    String subtitle,
    String tag,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: accent, width: 3)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: accent),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 9.5, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(subtitle,
                    style: const TextStyle(fontSize: 7.5, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(tag,
                    style: TextStyle(
                        fontSize: 7.5,
                        fontWeight: FontWeight.w600,
                        color: accent),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _photoThumbnail(String label, Color border) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: border.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: border, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_outlined, size: 12, color: border),
            const SizedBox(height: 2),
            Text(label,
                style: TextStyle(
                    fontSize: 7.5, fontWeight: FontWeight.bold, color: border)),
          ],
        ),
      ),
    );
  }

  Widget _mockListItem(
      Color bg, Color titleColor, Color subColor, String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: bg, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 9.5, fontWeight: FontWeight.bold, color: titleColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(sub,
              style: TextStyle(fontSize: 7.5, color: subColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _specRow(Color titleColor, Color subColor, String label, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(label,
                style: TextStyle(fontSize: 8.5, color: subColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
          Text(val,
              style: TextStyle(
                  fontSize: 8.5, fontWeight: FontWeight.bold, color: titleColor)),
        ],
      ),
    );
  }
}
