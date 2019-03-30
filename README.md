# vaapi-opencl-interop

## source code

compute-runtime https://github.com/intel/compute-runtime

intel-graphics-compiler https://github.com/intel/intel-graphics-compiler

libva https://github.com/intel/libva

gmmlib https://github.com/intel/gmmlib

media-driver https://github.com/intel/media-driver

## dependencies
download intel-graphics-compiler offical release binaries

https://github.com/intel/intel-graphics-compiler/releases
```bash
sudo dpkg -i ./intel-igc-core_1.0-0_amd64.deb
sudo dpkg -i ./intel-igc-media_1.0-0_amd64.deb
sudo dpkg -i ./intel-igc-opencl-devel_1.0-0_amd64.deb
sudo dpkg -i ./intel-igc-opencl_1.0-0_amd64.deb
sudo ldconfig
```

## build
```bash
# build compute-runtime
mkdir build & cd build & mkdir neo & cd neo
cmake ../../source/compute-runtime
make -j8
sudo make install
sudo ln -s /usr/lib/x86_64-linux-gnu/libOpenCL.so.1 /usr/lib/libOpenCL.so

# build interop sample app
cd build & mkdir interop & cd interop
cmake ../../source/vaapi-opencl-interop/interop
make
sudo make install
```

## run test
```bash
export LIBVA_DRIVER_NAME=iHD
cd build/interop
./vaocl
```
output
```
libva info: VA-API version 1.5.0
libva info: va_getDriverName() returns 0
libva info: User requested driver 'iHD'
libva info: Trying to open /usr/local/lib/dri/iHD_drv_video.so
libva info: Found init function __vaDriverInit_1_5
libva info: va_openDriver() returns 0
INFO: platform nubmer = 1
INFO: Intel(R) OpenCL HD Graphics
INFO: OpenCL 2.1 
execute sucessfully.
```

i915 trace-log
```
 vaocl-23226 [001] 19011.120267: i915_ppgtt_create:    dev=0, vm=0xffff8b0d90632000
 vaocl-23226 [001] 19011.120270: i915_context_create:  dev=0, ctx=0xffff8b0cffd09c00, ctx_vm=0xffff8b0d90632000, hw_id=28
 vaocl-23226 [001] 19011.124004: i915_reg_rw:          read reg=0xd3b0, len=4, val=(0x6000, 0x0)
 vaocl-23226 [001] 19011.124040: i915_reg_rw:          read reg=0xd3b0, len=4, val=(0x6000, 0x0)
 vaocl-23226 [001] 19011.124183: i915_ppgtt_create:    dev=0, vm=0xffff8b0d90630000
 vaocl-23226 [001] 19011.124184: i915_context_create:  dev=0, ctx=0xffff8b0cffd08a00, ctx_vm=0xffff8b0d90630000, hw_id=35
 vaocl-23226 [001] 19011.124200: i915_gem_object_create: obj=0xffff8b0cfe6cde00, size=0x4000
 vaocl-23226 [001] 19011.124206: i915_gem_object_create: obj=0xffff8b0cfe6cd800, size=0x4000
 vaocl-23226 [001] 19011.124212: i915_gem_object_create: obj=0xffff8b0cfe6ce400, size=0x4000
 vaocl-23226 [001] 19011.124217: i915_gem_object_create: obj=0xffff8b0cfe6cfc00, size=0x4000
 vaocl-23226 [001] 19011.124223: i915_gem_object_create: obj=0xffff8b0d51b1b900, size=0x4000
 vaocl-23226 [001] 19011.124229: i915_gem_object_create: obj=0xffff8b0d51b1aa00, size=0x4000
 vaocl-23226 [001] 19011.124234: i915_gem_object_create: obj=0xffff8b0d51b18f00, size=0x4000
 vaocl-23226 [001] 19011.124239: i915_gem_object_create: obj=0xffff8b0d51b1bc00, size=0x4000
 vaocl-23226 [001] 19011.124246: i915_gem_object_create: obj=0xffff8b0d51b1b300, size=0x4000
 vaocl-23226 [001] 19011.124251: i915_gem_object_create: obj=0xffff8b0d51b19b00, size=0x4000
 vaocl-23226 [001] 19011.124256: i915_gem_object_create: obj=0xffff8b0d51b1ad00, size=0x4000
 vaocl-23226 [001] 19011.124263: i915_gem_object_create: obj=0xffff8b0d51b18600, size=0x4000
 vaocl-23226 [001] 19011.124268: i915_gem_object_create: obj=0xffff8b0d51b1a100, size=0x4000
 vaocl-23226 [001] 19011.124273: i915_gem_object_create: obj=0xffff8b0d51b19200, size=0x4000
 vaocl-23226 [001] 19011.124277: i915_gem_object_create: obj=0xffff8b0d51b18c00, size=0x4000
 vaocl-23226 [001] 19011.124282: i915_gem_object_create: obj=0xffff8b0d51b18000, size=0x4000
 vaocl-23226 [001] 19011.124286: i915_gem_object_create: obj=0xffff8b0ce9b90f00, size=0x4000
 vaocl-23226 [001] 19011.124290: i915_gem_object_create: obj=0xffff8b0ce9b91500, size=0x4000
 vaocl-23226 [001] 19011.124295: i915_gem_object_create: obj=0xffff8b0ce9b91b00, size=0x4000
 vaocl-23226 [001] 19011.124301: i915_gem_object_create: obj=0xffff8b0ce9b92400, size=0x4000
 vaocl-23226 [001] 19011.124306: i915_gem_object_create: obj=0xffff8b0ce9b92d00, size=0x4000
 vaocl-23226 [001] 19011.124310: i915_gem_object_create: obj=0xffff8b0ce9b90c00, size=0x4000
 vaocl-23226 [001] 19011.124315: i915_gem_object_create: obj=0xffff8b0ce9b91e00, size=0x4000
 vaocl-23226 [001] 19011.124319: i915_gem_object_create: obj=0xffff8b0ce9b93900, size=0x4000
 vaocl-23226 [001] 19011.124325: i915_gem_object_create: obj=0xffff8b0ce9b90600, size=0x4000
 vaocl-23226 [001] 19011.124329: i915_gem_object_create: obj=0xffff8b0ce9b93300, size=0x4000
 vaocl-23226 [001] 19011.124333: i915_gem_object_create: obj=0xffff8b0ce9b90000, size=0x4000
 vaocl-23226 [001] 19011.124338: i915_gem_object_create: obj=0xffff8b0b7eb91e00, size=0x4000
 vaocl-23226 [001] 19011.124343: i915_gem_object_create: obj=0xffff8b0b7eb90600, size=0x4000
 vaocl-23226 [001] 19011.124348: i915_gem_object_create: obj=0xffff8b0b7eb90f00, size=0x4000
 vaocl-23226 [001] 19011.124352: i915_gem_object_create: obj=0xffff8b0b7eb90300, size=0x4000
 vaocl-23226 [001] 19011.124357: i915_gem_object_create: obj=0xffff8b0b7eb92a00, size=0x4000
 vaocl-23226 [001] 19011.124378: i915_gem_object_create: obj=0xffff8b0b7eb91b00, size=0x2000
 vaocl-23226 [001] 19011.124427: i915_ppgtt_create:    dev=0, vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.124432: i915_context_create:  dev=0, ctx=0xffff8b0cffd08600, ctx_vm=0xffff8b0d49514000, hw_id=36
 vaocl-23226 [001] 19011.124506: i915_gem_object_create: obj=0xffff8b0b7eb93600, size=0x50000
 vaocl-23226 [001] 19011.124684: i915_gem_object_create: obj=0xffff8b0b7eb91200, size=0x1000
 vaocl-23226 [001] 19011.124869: i915_gem_object_create: obj=0xffff8b0b7eb90c00, size=0x1000
 vaocl-23226 [001] 19011.124876: i915_gem_object_create: obj=0xffff8b0d907ea400, size=0x1000
 vaocl-23226 [001] 19011.124881: i915_gem_object_create: obj=0xffff8b0d907e9e00, size=0x1000
 vaocl-23226 [001] 19011.124887: i915_gem_object_create: obj=0xffff8b0d907eb000, size=0x1000
 vaocl-23226 [001] 19011.124892: i915_gem_object_create: obj=0xffff8b0d907ead00, size=0x1000
 vaocl-23226 [001] 19011.124897: i915_gem_object_create: obj=0xffff8b0d907e9b00, size=0x1000
 vaocl-23226 [001] 19011.124916: i915_gem_object_create: obj=0xffff8b0d907e8900, size=0x1000
 vaocl-23226 [001] 19011.124942: i915_gem_object_create: obj=0xffff8b0d907e8000, size=0x1000
 vaocl-23226 [001] 19011.124981: i915_gem_object_create: obj=0xffff8b0d907ea700, size=0x3000
 vaocl-23226 [001] 19011.124993: i915_gem_object_pwrite: obj=0xffff8b0d907ea700, offset=0x0, len=0x96
 vaocl-23226 [001] 19011.125016: i915_gem_object_create: obj=0xffff8b0d907e8600, size=0x8000
 vaocl-23226 [001] 19011.125071: i915_vma_bind:        obj=0xffff8b0b7eb93600, offset=0x0000000000000000 size=0x50000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125082: i915_vma_bind:        obj=0xffff8b0b7eb91b00, offset=0x0000000000050000 size=0x2000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125083: i915_vma_bind:        obj=0xffff8b0d907eb000, offset=0x0000000000052000 size=0x1000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125083: i915_vma_bind:        obj=0xffff8b0d907ea700, offset=0x0000000000053000 size=0x3000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125084: i915_vma_bind:        obj=0xffff8b0d907ead00, offset=0x0000000000056000 size=0x1000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125084: i915_vma_bind:        obj=0xffff8b0b7eb90c00, offset=0x0000000000057000 size=0x1000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125085: i915_vma_bind:        obj=0xffff8b0d907e8600, offset=0x0000000000058000 size=0x8000 vm=0xffff8b0d49514000
 vaocl-23226 [001] 19011.125090: i915_gem_object_create: obj=0xffff8b0d51a24f00, size=0x3000
 vaocl-23226 [001] 19011.125133: i915_vma_bind:        obj=0xffff8b0d51a24f00, offset=0x00000000fff13000 size=0x3000 vm=0xffff8b0de7dcd740
 vaocl-23226 [001] 19011.125134: i915_reg_rw:          write reg=0x101008, len=4, val=(0x1, 0x0)
 vaocl-23226 [001] 19011.125137: i915_vma_bind:        obj=0xffff8b0d51a24000, offset=0x000000000189c000 size=0x4000 vm=0xffff8b0de7dcd740
 vaocl-23226 [001] 19011.125137: i915_reg_rw:          write reg=0x101008, len=4, val=(0x1, 0x0)
 vaocl-23226 [001] 19011.125139: i915_request_queue:   dev=0, hw_id=36, ring=2, ctx=494, seqno=1, flags=0x0
 vaocl-23226 [001] 19011.125142: i915_request_add:     dev=0, hw_id=36, ring=2, ctx=494, seqno=1, global=0
 vaocl-23226 [001] 19011.125169: i915_request_retire:  dev=0, hw_id=36, ring=2, ctx=494, seqno=1, global=50
 vaocl-23226 [001] 19011.125172: i915_context_free:    dev=0, ctx=0xffff8b0deca9aa00, ctx_vm=0xffff8b0dec9c0000, hw_id=39
 vaocl-23226 [001] 19011.130211: i915_ppgtt_create:    dev=0, vm=0xffff8b0d2f9f4000
 vaocl-23226 [001] 19011.130213: i915_context_create:  dev=0, ctx=0xffff8b0cffd0bc00, ctx_vm=0xffff8b0d2f9f4000, hw_id=39
 vaocl-23226 [001] 19011.131502: i915_ppgtt_create:    dev=0, vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.131504: i915_context_create:  dev=0, ctx=0xffff8b0cffd0b000, ctx_vm=0xffff8b0d2f9f0000, hw_id=40
 vaocl-23226 [001] 19011.131531: i915_ppgtt_create:    dev=0, vm=0xffff8b0c011b6000
 vaocl-23226 [001] 19011.131531: i915_context_create:  dev=0, ctx=0xffff8b0cffd09800, ctx_vm=0xffff8b0c011b6000, hw_id=41
 vaocl-23226 [001] 19011.131540: i915_reg_rw:          read reg=0x235c, len=4, val=(0x9, 0x0)
 vaocl-23226 [001] 19011.131540: i915_reg_rw:          read reg=0x2358, len=4, val=(0xf7bf0da9, 0x0)
 vaocl-23226 [001] 19011.131541: i915_reg_rw:          read reg=0x235c, len=4, val=(0x9, 0x0)
 vaocl-23226 [001] 19011.434261: i915_vma_bind:        obj=0xffff8b0b7eb91b00, offset=0x00007f60007e5000 size=0x2000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434270: i915_vma_bind:        obj=0xffff8b0cfffc5500, offset=0x00007f5ff3ffd000 size=0x1000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434275: i915_vma_bind:        obj=0xffff8b0cfffc6700, offset=0x000055788dbf1000 size=0x10000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434286: i915_vma_bind:        obj=0xffff8b0cfffc6d00, offset=0x000055788dbc8000 size=0x10000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434288: i915_vma_bind:        obj=0xffff8b0cfffc5800, offset=0x000055788d6b4000 size=0x1000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434293: i915_vma_bind:        obj=0xffff8b0cfffc7600, offset=0x00007f5ff3ffe000 size=0x2000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434297: i915_vma_bind:        obj=0xffff8b0cfffc4900, offset=0x000055788df00000 size=0x10000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.434301: i915_vma_bind:        obj=0xffff8b0cfffc4600, offset=0x000055788decf000 size=0x10000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.435461: i915_vma_bind:        obj=0xffff8b0cfffc4c00, offset=0x00007f5ff3fed000 size=0x10000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.435463: i915_vma_bind:        obj=0xffff8b0cfffc7c00, offset=0x00007f5ff8c40000 size=0x800000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.435476: i915_gem_object_create: obj=0xffff8b0d995cde00, size=0x17000
 vaocl-23226 [001] 19011.435566: i915_vma_bind:        obj=0xffff8b0d995cde00, offset=0x00000000ffed4000 size=0x17000 vm=0xffff8b0de7dcd740
 vaocl-23226 [001] 19011.435568: i915_reg_rw:          write reg=0x101008, len=4, val=(0x1, 0x0)
 vaocl-23226 [001] 19011.435571: i915_vma_bind:        obj=0xffff8b0d995cd500, offset=0x00000000018b6000 size=0x4000 vm=0xffff8b0de7dcd740
 vaocl-23226 [001] 19011.435571: i915_reg_rw:          write reg=0x101008, len=4, val=(0x1, 0x0)
 vaocl-23226 [001] 19011.435573: i915_request_queue:   dev=0, hw_id=40, ring=0, ctx=495, seqno=1, flags=0x0
 vaocl-23226 [001] 19011.435577: i915_request_add:     dev=0, hw_id=40, ring=0, ctx=495, seqno=1, global=0
 vaocl-23226 [001] 19011.435625: i915_request_wait_begin: dev=0, hw_id=40, ring=0, ctx=495, seqno=1, global=1704597, blocking=0, flags=0x5
 vaocl-23227 [006] 19011.435633: i915_request_wait_begin: dev=0, hw_id=40, ring=0, ctx=495, seqno=1, global=1704597, blocking=0, flags=0x5
<idle>-0     [006] 19011.435916: intel_engine_notify:  dev=0, ring=0, seqno=1704597, waiters=1
 vaocl-23227 [006] 19011.435919: i915_request_wait_end: dev=0, hw_id=40, ring=0, ctx=495, seqno=1, global=1704597
 vaocl-23226 [001] 19011.435920: i915_request_wait_end: dev=0, hw_id=40, ring=0, ctx=495, seqno=1, global=1704597
 vaocl-23226 [001] 19011.436266: i915_vma_bind:        obj=0xffff8b0d494a4000, offset=0x00007fff0c0df000 size=0x1000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.436272: i915_vma_bind:        obj=0xffff8b0d51a26a00, offset=0x000055788d6b0000 size=0x1000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.436273: i915_request_queue:   dev=0, hw_id=40, ring=0, ctx=495, seqno=2, flags=0x0
 vaocl-23226 [001] 19011.436273: i915_request_add:     dev=0, hw_id=40, ring=0, ctx=495, seqno=2, global=0
 vaocl-23226 [001] 19011.436276: i915_request_retire:  dev=0, hw_id=40, ring=0, ctx=495, seqno=1, global=1704597
 vaocl-23226 [001] 19011.436354: i915_vma_bind:        obj=0xffff8b0d494a7000, offset=0x00007f5ff3fec000 size=0x1000 vm=0xffff8b0d2f9f0000
 vaocl-23226 [001] 19011.436356: i915_request_queue:   dev=0, hw_id=40, ring=0, ctx=495, seqno=3, flags=0x0
 vaocl-23226 [001] 19011.436357: i915_request_add:     dev=0, hw_id=40, ring=0, ctx=495, seqno=3, global=0
<idle>-0     [006] 19011.436357: i915_reg_rw:          write reg=0x20a8, len=4, val=(0xfffffeff, 0x0)
 vaocl-23226 [001] 19011.436360: i915_request_retire:  dev=0, hw_id=40, ring=0, ctx=495, seqno=2, global=1704598
<idle>-0     [006] 19011.436361: intel_engine_notify:  dev=0, ring=0, seqno=1704598, waiters=0
 vaocl-23226 [001] 19011.436370: i915_request_wait_begin: dev=0, hw_id=40, ring=0, ctx=495, seqno=3, global=1704599, blocking=0, flags=0x5
 vaocl-23227 [006] 19011.436372: i915_request_wait_begin: dev=0, hw_id=40, ring=0, ctx=495, seqno=3, global=1704599, blocking=0, flags=0x5
 vaocl-23226 [001] 19011.436376: i915_reg_rw:          write reg=0x20a8, len=4, val=(0xfffffefe, 0x0)
<idle>-0     [006] 19011.436425: intel_engine_notify:  dev=0, ring=0, seqno=1704599, waiters=1
 vaocl-23227 [006] 19011.436427: i915_request_wait_end: dev=0, hw_id=40, ring=0, ctx=495, seqno=3, global=1704599
 vaocl-23226 [001] 19011.436429: i915_request_wait_end: dev=0, hw_id=40, ring=0, ctx=495, seqno=3, global=1704599
 vaocl-23226 [001] 19011.436709: i915_context_free:    dev=0, ctx=0xffff8b0cffd08a00, ctx_vm=0xffff8b0d90630000, hw_id=35
 vaocl-23226 [001] 19011.436883: i915_context_free:    dev=0, ctx=0xffff8b0cffd09c00, ctx_vm=0xffff8b0d90632000, hw_id=28
 vaocl-23226 [001] 19011.440846: i915_context_free:    dev=0, ctx=0xffff8b0cffd0bc00, ctx_vm=0xffff8b0d2f9f4000, hw_id=39
 vaocl-23226 [001] 19011.440849: i915_context_free:    dev=0, ctx=0xffff8b0cffd09800, ctx_vm=0xffff8b0c011b6000, hw_id=41
```
