; ModuleID = 'probe4.cc5138dda68f028c-cgu.0'
source_filename = "probe4.cc5138dda68f028c-cgu.0"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-gnueabihf"

@alloc_539b8bb596a7a0812d002020bd88e102 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/82e1608dfa6e0b5569232559e3d385fea5a93112/library/core/src/num/mod.rs" }>, align 1
@alloc_70acc4d22d023aff265f02ccded0af3e = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_539b8bb596a7a0812d002020bd88e102, [12 x i8] c"K\00\00\00y\04\00\00\05\00\00\00" }>, align 4
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"

; probe4::probe
; Function Attrs: uwtable
define void @_ZN6probe45probe17h4689bb922b44a814E() unnamed_addr #0 {
start:
  %0 = call i1 @llvm.expect.i1(i1 false, i1 false)
  br i1 %0, label %panic.i, label %"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h082697ec26d17537E.exit"

panic.i:                                          ; preds = %start
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17hc9494689c3b5544cE(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_70acc4d22d023aff265f02ccded0af3e) #3
  unreachable

"_ZN4core3num21_$LT$impl$u20$u32$GT$10div_euclid17h082697ec26d17537E.exit": ; preds = %start
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #1

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17hc9494689c3b5544cE(ptr align 1, i32, ptr align 4) unnamed_addr #2

attributes #0 = { uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #2 = { cold noinline noreturn uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21)"}
