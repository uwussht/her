import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/widgets.dart';

/// Video lesson player.
///
/// Wraps [Chewie] and keeps its own error state, so a lesson still opens and
/// reads when the video cannot be fetched.
class LessonVideoPlayer extends StatefulWidget {
  const LessonVideoPlayer({
    required this.url,
    this.aspectRatio = 16 / 9,
    this.timeout = defaultTimeout,
    super.key,
  });

  final String url;
  final double aspectRatio;

  /// How long to wait for the first frame before showing the error panel.
  final Duration timeout;

  /// A stalled video should not leave her watching a placeholder forever.
  static const Duration defaultTimeout = Duration(seconds: 15);

  @override
  State<LessonVideoPlayer> createState() => _LessonVideoPlayerState();
}

class _LessonVideoPlayerState extends State<LessonVideoPlayer> {
  VideoPlayerController? _video;
  ChewieController? _chewie;
  Object? _error;
  bool _initialising = true;

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  @override
  void dispose() {
    _chewie?.dispose();
    final video = _video;
    if (video != null) _release(video);
    super.dispose();
  }

  Future<void> _prepare() async {
    setState(() {
      _initialising = true;
      _error = null;
    });
    final video = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    try {
      await video.initialize().timeout(widget.timeout);
      if (!mounted) {
        _release(video);
        return;
      }
      setState(() {
        _video = video;
        _chewie = ChewieController(
          videoPlayerController: video,
          aspectRatio: widget.aspectRatio,
          autoPlay: false,
          looping: false,
          materialProgressColors: ChewieProgressColors(
            playedColor: context.colors.primary,
            handleColor: context.colors.primary,
            bufferedColor: context.colors.primaryContainer,
            backgroundColor: context.palette.surfaceMuted,
          ),
        );
        _initialising = false;
      });
    } on Object catch (error) {
      // Catches Error as well as Exception: a missing or failing platform
      // implementation must leave the lesson readable rather than take the
      // screen down.
      _release(video);
      if (!mounted) return;
      setState(() {
        _error = error;
        _initialising = false;
      });
    }
  }

  /// Disposes a controller without waiting for it.
  ///
  /// When the platform never answered, `dispose()` never completes either, so
  /// awaiting it here would leave the player stuck on its placeholder.
  void _release(VideoPlayerController video) {
    unawaited(video.dispose().catchError((Object _) {}));
  }

  @override
  Widget build(BuildContext context) {
    if (_initialising) {
      return AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: const SkeletonBox(
          height: double.infinity,
          borderRadius: AppRadius.cardBorder,
        ),
      );
    }
    if (_error != null || _chewie == null) {
      return _ErrorPanel(onRetry: _prepare);
    }

    return ClipRRect(
      borderRadius: AppRadius.cardBorder,
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: Chewie(controller: _chewie!),
      ),
    );
  }
}

class _ErrorPanel extends StatelessWidget {
  const _ErrorPanel({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      elevated: false,
      color: context.palette.surfaceMuted,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          Icon(
            Icons.videocam_off_rounded,
            size: AppSizes.iconLg,
            color: context.palette.textSecondary,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.videoUnavailableTitle, style: context.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            l10n.videoUnavailableBody,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          OutlinedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded),
            label: Text(l10n.videoRetry),
          ),
        ],
      ),
    );
  }
}
