<?php $__env->startSection('title', $translator->trans('core.views.log_out.title')); ?>

<?php $__env->startSection('content'); ?>
  <p><?php echo e($translator->trans('core.views.log_out.log_out_confirmation', ['{forum}' => $settings->get('forum_title')])); ?></p>

  <p>
    <a href="<?php echo e($url); ?>" class="button">
      <?php echo e($translator->trans('core.views.log_out.log_out_button')); ?>

    </a>
  </p>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('flarum.forum::layouts.basic', \Illuminate\Support\Arr::except(get_defined_vars(), array('__data', '__path')))->render(); ?>