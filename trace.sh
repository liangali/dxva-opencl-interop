sudo trace-cmd record \
-e "i915:intel_cpu_fifo_underrun" \
-e "i915:intel_pch_fifo_underrun" \
-e "i915:intel_memory_cxsr" \
-e "i915:g4x_wm" \
-e "i915:vlv_wm" \
-e "i915:vlv_fifo_size" \
-e "i915:intel_update_plane" \
-e "i915:intel_disable_plane" \
-e "i915:i915_pipe_update_start" \
-e "i915:i915_pipe_update_vblank_evaded" \
-e "i915:i915_pipe_update_end" \
-e "i915:i915_gem_object_create" \
-e "i915:i915_gem_shrink" \
-e "i915:i915_vma_bind" \
-e "i915:i915_vma_unbind" \
-e "i915:i915_gem_object_pwrite" \
-e "i915:i915_gem_object_pread" \
-e "i915:i915_gem_object_fault" \
-e "i915:i915_gem_object_clflush" \
-e "i915:i915_gem_object_destroy" \
-e "i915:i915_gem_evict" \
-e "i915:i915_gem_evict_node" \
-e "i915:i915_gem_evict_vm" \
-e "i915:i915_gem_ring_sync_to" \
-e "i915:i915_request_queue" \
-e "i915:i915_request_add" \
-e "i915:intel_engine_notify" \
-e "i915:i915_request_retire" \
-e "i915:i915_request_wait_begin" \
-e "i915:i915_request_wait_end" \
-e "i915:i915_reg_rw" \
-e "i915:intel_gpu_freq_change" \
-e "i915:i915_ppgtt_create" \
-e "i915:i915_ppgtt_release" \
-e "i915:i915_context_create" \
-e "i915:i915_context_free" \
-e "i915:switch_mm" \
sleep 3

trace-cmd report >trace.log