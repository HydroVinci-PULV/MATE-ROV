; ModuleID = 'probe7.c7170ffe201ebe21-cgu.0'
source_filename = "probe7.c7170ffe201ebe21-cgu.0"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-gnueabihf"

; core::f64::<impl f64>::to_ne_bytes
; Function Attrs: inlinehint uwtable
define internal void @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17hf394437098ed2b43E"(ptr sret([8 x i8]) align 1 %_0, double %self) unnamed_addr #0 {
start:
  %self1 = bitcast double %self to i64
  store i64 %self1, ptr %_0, align 1
  ret void
}

; probe7::probe
; Function Attrs: uwtable
define void @_ZN6probe75probe17h2dce38dd3e5ecc07E() unnamed_addr #1 {
start:
  %_1 = alloca [8 x i8], align 1
; call core::f64::<impl f64>::to_ne_bytes
  call void @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17hf394437098ed2b43E"(ptr sret([8 x i8]) align 1 %_1, double 3.140000e+00)
  ret void
}

attributes #0 = { inlinehint uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #1 = { uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21)"}
