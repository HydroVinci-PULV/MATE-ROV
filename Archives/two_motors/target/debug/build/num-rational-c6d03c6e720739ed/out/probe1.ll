; ModuleID = 'probe1.e5c80b9f5a0efe0a-cgu.0'
source_filename = "probe1.e5c80b9f5a0efe0a-cgu.0"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-gnueabihf"

%"core::fmt::Arguments<'_>" = type { { ptr, i32 }, { ptr, i32 }, { ptr, i32 } }
%"alloc::string::String" = type { %"alloc::vec::Vec<u8>" }
%"alloc::vec::Vec<u8>" = type { { ptr, i32 }, i32 }
%"core::ptr::metadata::PtrRepr<[u8]>" = type { [2 x i32] }
%"alloc::alloc::Global" = type {}
%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>" = type { [1 x i32], i32, [1 x i32] }

@alloc_91c7fa63c3cfeaa3c795652d5cf060e4 = private unnamed_addr constant <{ [12 x i8] }> <{ [12 x i8] c"invalid args" }>, align 1
@alloc_e90401c92a6af8b32765b1534130c461 = private unnamed_addr constant <{ ptr, [4 x i8] }> <{ ptr @alloc_91c7fa63c3cfeaa3c795652d5cf060e4, [4 x i8] c"\0C\00\00\00" }>, align 4
@alloc_c06a172a08ac35a48b6ad59116e021fc = private unnamed_addr constant <{}> zeroinitializer, align 4
@alloc_b5970474149acb40bd55b9b54ff0a4d7 = private unnamed_addr constant <{ [75 x i8] }> <{ [75 x i8] c"/rustc/82e1608dfa6e0b5569232559e3d385fea5a93112/library/core/src/fmt/mod.rs" }>, align 1
@alloc_e2692cde95cee8eff404aaf56d326227 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b5970474149acb40bd55b9b54ff0a4d7, [12 x i8] c"K\00\00\00M\01\00\00\0D\00\00\00" }>, align 4
@alloc_d988653bf5bec18a49312bc37b98a2c4 = private unnamed_addr constant <{ [80 x i8] }> <{ [80 x i8] c"/rustc/82e1608dfa6e0b5569232559e3d385fea5a93112/library/core/src/alloc/layout.rs" }>, align 1
@alloc_5d0ba09cfa08f8d3f50d2b00368c5e00 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_d988653bf5bec18a49312bc37b98a2c4, [12 x i8] c"P\00\00\00\C1\01\00\00)\00\00\00" }>, align 4
@str.0 = internal constant [25 x i8] c"attempt to divide by zero"
@__rust_no_alloc_shim_is_unstable = external global i8
@alloc_97350e8bf483c1fe1c3a218b02d80fb1 = private unnamed_addr constant <{ ptr, [4 x i8] }> <{ ptr @alloc_c06a172a08ac35a48b6ad59116e021fc, [4 x i8] zeroinitializer }>, align 4
@alloc_83ea17bf0c4f4a5a5a13d3ae7955acd0 = private unnamed_addr constant <{ [4 x i8] }> zeroinitializer, align 4

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3fmt9Arguments6new_v117h223ec9651128b420E(ptr sret(%"core::fmt::Arguments<'_>") align 4 %_0, ptr align 4 %pieces.0, i32 %pieces.1, ptr align 4 %args.0, i32 %args.1) unnamed_addr #0 {
start:
  %_15 = alloca { ptr, i32 }, align 4
  %_13 = alloca { ptr, i32 }, align 4
  %_11 = alloca %"core::fmt::Arguments<'_>", align 4
  %_3 = icmp ult i32 %pieces.1, %args.1
  br i1 %_3, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_8 = add i32 %args.1, 1
  %_6 = icmp ugt i32 %pieces.1, %_8
  br i1 %_6, label %bb3, label %bb4

bb1:                                              ; preds = %start
  br label %bb3

bb4:                                              ; preds = %bb2
  store ptr null, ptr %_13, align 4
  %0 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %pieces.0, ptr %0, align 4
  %1 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %pieces.1, ptr %1, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %_13, i32 0, i32 0
  %3 = load ptr, ptr %2, align 4, !align !2, !noundef !3
  %4 = getelementptr inbounds { ptr, i32 }, ptr %_13, i32 0, i32 1
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 2
  %7 = getelementptr inbounds { ptr, i32 }, ptr %6, i32 0, i32 0
  store ptr %3, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %6, i32 0, i32 1
  store i32 %5, ptr %8, align 4
  %9 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_0, i32 0, i32 1
  %10 = getelementptr inbounds { ptr, i32 }, ptr %9, i32 0, i32 0
  store ptr %args.0, ptr %10, align 4
  %11 = getelementptr inbounds { ptr, i32 }, ptr %9, i32 0, i32 1
  store i32 %args.1, ptr %11, align 4
  ret void

bb3:                                              ; preds = %bb1, %bb2
  store ptr null, ptr %_15, align 4
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_11, i32 0, i32 0
  store ptr @alloc_e90401c92a6af8b32765b1534130c461, ptr %12, align 4
  %13 = getelementptr inbounds { ptr, i32 }, ptr %_11, i32 0, i32 1
  store i32 1, ptr %13, align 4
  %14 = getelementptr inbounds { ptr, i32 }, ptr %_15, i32 0, i32 0
  %15 = load ptr, ptr %14, align 4, !align !2, !noundef !3
  %16 = getelementptr inbounds { ptr, i32 }, ptr %_15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_11, i32 0, i32 2
  %19 = getelementptr inbounds { ptr, i32 }, ptr %18, i32 0, i32 0
  store ptr %15, ptr %19, align 4
  %20 = getelementptr inbounds { ptr, i32 }, ptr %18, i32 0, i32 1
  store i32 %17, ptr %20, align 4
  %21 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %_11, i32 0, i32 1
  %22 = getelementptr inbounds { ptr, i32 }, ptr %21, i32 0, i32 0
  store ptr @alloc_c06a172a08ac35a48b6ad59116e021fc, ptr %22, align 4
  %23 = getelementptr inbounds { ptr, i32 }, ptr %21, i32 0, i32 1
  store i32 0, ptr %23, align 4
; call core::panicking::panic_fmt
  call void @_ZN4core9panicking9panic_fmt17h8911d7f11480f1bdE(ptr align 4 %_11, ptr align 4 @alloc_e2692cde95cee8eff404aaf56d326227) #12
  unreachable
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17h07ce7fe76f7b3ee7E(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %0, i32 %1) unnamed_addr #0 {
start:
  %_2 = alloca { ptr, i32 }, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  store ptr %0, ptr %2, align 4
  %3 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  %5 = load ptr, ptr %4, align 4, !nonnull !3, !align !4, !noundef !3
  %6 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  %7 = load i32, ptr %6, align 4, !noundef !3
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17hf781709f94235a3bE"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %5, i32 %7)
  ret void
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: uwtable
define void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h72e3dd43756d4f32E"(ptr align 4 %_1) unnamed_addr #1 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h3fde5f6587f5f550E"(ptr align 4 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17h3fde5f6587f5f550E"(ptr align 4 %_1) unnamed_addr #1 personality ptr @rust_eh_personality {
start:
  %0 = alloca { ptr, i32 }, align 4
; invoke <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  invoke void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h002126a6b515e950E"(ptr align 4 %_1)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  invoke void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h3477f4b0b2eef4f1E"(ptr align 4 %_1) #13
          to label %bb1 unwind label %terminate

cleanup:                                          ; preds = %start
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  %3 = extractvalue { ptr, i32 } %1, 1
  %4 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 0
  store ptr %2, ptr %4, align 4
  %5 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  store i32 %3, ptr %5, align 4
  br label %bb3

bb4:                                              ; preds = %start
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h3477f4b0b2eef4f1E"(ptr align 4 %_1)
  ret void

terminate:                                        ; preds = %bb3
  %6 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %7 = extractvalue { ptr, i32 } %6, 0
  %8 = extractvalue { ptr, i32 } %6, 1
; call core::panicking::panic_in_cleanup
  call void @_ZN4core9panicking16panic_in_cleanup17h5a5a0410658fcc8fE() #14
  unreachable

bb1:                                              ; preds = %bb3
  %9 = load ptr, ptr %0, align 4, !noundef !3
  %10 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  %11 = load i32, ptr %10, align 4, !noundef !3
  %12 = insertvalue { ptr, i32 } poison, ptr %9, 0
  %13 = insertvalue { ptr, i32 } %12, i32 %11, 1
  resume { ptr, i32 } %13
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: uwtable
define void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h3477f4b0b2eef4f1E"(ptr align 4 %_1) unnamed_addr #1 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h0a719768b5dd6fd1E"(ptr align 4 %_1)
  ret void
}

; core::alloc::layout::Layout::array::inner
; Function Attrs: inlinehint uwtable
define internal { i32, i32 } @_ZN4core5alloc6layout6Layout5array5inner17h1fe2f62ffe65d219E(i32 %element_size, i32 %align, i32 %n) unnamed_addr #0 {
start:
  %_18 = alloca i32, align 4
  %_13 = alloca i32, align 4
  %_9 = alloca { i32, i32 }, align 4
  %_0 = alloca { i32, i32 }, align 4
  %0 = icmp eq i32 %element_size, 0
  br i1 %0, label %bb5, label %bb1

bb5:                                              ; preds = %bb4, %start
  %array_size = mul i32 %element_size, %n
  store i32 %align, ptr %_18, align 4
  %_19 = load i32, ptr %_18, align 4, !range !5, !noundef !3
  %_20 = icmp uge i32 %_19, 1
  %_21 = icmp ule i32 %_19, -2147483648
  %_22 = and i1 %_20, %_21
  call void @llvm.assume(i1 %_22)
  %1 = getelementptr inbounds { i32, i32 }, ptr %_9, i32 0, i32 1
  store i32 %array_size, ptr %1, align 4
  store i32 %_19, ptr %_9, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %_9, i32 0, i32 0
  %3 = load i32, ptr %2, align 4, !range !5, !noundef !3
  %4 = getelementptr inbounds { i32, i32 }, ptr %_9, i32 0, i32 1
  %5 = load i32, ptr %4, align 4, !noundef !3
  %6 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 0
  store i32 %3, ptr %6, align 4
  %7 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 1
  store i32 %5, ptr %7, align 4
  br label %bb6

bb1:                                              ; preds = %start
  store i32 %align, ptr %_13, align 4
  %_14 = load i32, ptr %_13, align 4, !range !5, !noundef !3
  %_15 = icmp uge i32 %_14, 1
  %_16 = icmp ule i32 %_14, -2147483648
  %_17 = and i1 %_15, %_16
  call void @llvm.assume(i1 %_17)
  %_11 = sub i32 %_14, 1
  %_6 = sub i32 2147483647, %_11
  %_7 = icmp eq i32 %element_size, 0
  %8 = call i1 @llvm.expect.i1(i1 %_7, i1 false)
  br i1 %8, label %panic, label %bb2

bb2:                                              ; preds = %bb1
  %_5 = udiv i32 %_6, %element_size
  %_4 = icmp ugt i32 %n, %_5
  br i1 %_4, label %bb3, label %bb4

panic:                                            ; preds = %bb1
; call core::panicking::panic
  call void @_ZN4core9panicking5panic17hc9494689c3b5544cE(ptr align 1 @str.0, i32 25, ptr align 4 @alloc_5d0ba09cfa08f8d3f50d2b00368c5e00) #12
  unreachable

bb4:                                              ; preds = %bb2
  br label %bb5

bb3:                                              ; preds = %bb2
  store i32 0, ptr %_0, align 4
  br label %bb6

bb6:                                              ; preds = %bb3, %bb5
  %9 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 0
  %10 = load i32, ptr %9, align 4, !range !6, !noundef !3
  %11 = getelementptr inbounds { i32, i32 }, ptr %_0, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = insertvalue { i32, i32 } poison, i32 %10, 0
  %14 = insertvalue { i32, i32 } %13, i32 %12, 1
  ret { i32, i32 } %14
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint uwtable
define void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h3acea89fd5e160e2E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %0, i32 %1, ptr align 4 %default) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %2 = alloca { ptr, i32 }, align 4
  %_10 = alloca i8, align 1
  %_9 = alloca i8, align 1
  %_7 = alloca { ptr, i32 }, align 4
  %self = alloca { ptr, i32 }, align 4
  %3 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 0
  store ptr %0, ptr %3, align 4
  %4 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  store i32 %1, ptr %4, align 4
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %5 = load ptr, ptr %self, align 4, !noundef !3
  %6 = ptrtoint ptr %5 to i32
  %7 = icmp eq i32 %6, 0
  %_4 = select i1 %7, i32 0, i32 1
  %8 = icmp eq i32 %_4, 0
  br i1 %8, label %bb1, label %bb3

bb1:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; invoke alloc::fmt::format::{{closure}}
  invoke void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17ha1516c1df524e780E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %default)
          to label %bb5 unwind label %cleanup

bb3:                                              ; preds = %start
  %9 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 0
  %t.0 = load ptr, ptr %9, align 4, !nonnull !3, !align !4, !noundef !3
  %10 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  %t.1 = load i32, ptr %10, align 4, !noundef !3
  store i8 0, ptr %_9, align 1
  %11 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 0
  store ptr %t.0, ptr %11, align 4
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 1
  store i32 %t.1, ptr %12, align 4
  %13 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 0
  %14 = load ptr, ptr %13, align 4, !nonnull !3, !align !4, !noundef !3
  %15 = getelementptr inbounds { ptr, i32 }, ptr %_7, i32 0, i32 1
  %16 = load i32, ptr %15, align 4, !noundef !3
; invoke core::ops::function::FnOnce::call_once
  invoke void @_ZN4core3ops8function6FnOnce9call_once17h07ce7fe76f7b3ee7E(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %14, i32 %16)
          to label %bb4 unwind label %cleanup

bb14:                                             ; preds = %cleanup
  %17 = load i8, ptr %_9, align 1, !range !7, !noundef !3
  %18 = trunc i8 %17 to i1
  br i1 %18, label %bb13, label %bb8

cleanup:                                          ; preds = %bb3, %bb1
  %19 = landingpad { ptr, i32 }
          cleanup
  %20 = extractvalue { ptr, i32 } %19, 0
  %21 = extractvalue { ptr, i32 } %19, 1
  %22 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 0
  store ptr %20, ptr %22, align 4
  %23 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 1
  store i32 %21, ptr %23, align 4
  br label %bb14

bb5:                                              ; preds = %bb1
  br label %bb11

bb11:                                             ; preds = %bb4, %bb5
  %24 = load i8, ptr %_9, align 1, !range !7, !noundef !3
  %25 = trunc i8 %24 to i1
  br i1 %25, label %bb10, label %bb6

bb4:                                              ; preds = %bb3
  br label %bb11

bb6:                                              ; preds = %bb10, %bb11
  %26 = load i8, ptr %_10, align 1, !range !7, !noundef !3
  %27 = trunc i8 %26 to i1
  br i1 %27, label %bb12, label %bb7

bb10:                                             ; preds = %bb11
  br label %bb6

bb7:                                              ; preds = %bb12, %bb6
  ret void

bb12:                                             ; preds = %bb6
  br label %bb7

bb8:                                              ; preds = %bb13, %bb14
  %28 = load i8, ptr %_10, align 1, !range !7, !noundef !3
  %29 = trunc i8 %28 to i1
  br i1 %29, label %bb15, label %bb9

bb13:                                             ; preds = %bb14
  br label %bb8

bb9:                                              ; preds = %bb15, %bb8
  %30 = load ptr, ptr %2, align 4, !noundef !3
  %31 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 1
  %32 = load i32, ptr %31, align 4, !noundef !3
  %33 = insertvalue { ptr, i32 } poison, ptr %30, 0
  %34 = insertvalue { ptr, i32 } %33, i32 %32, 1
  resume { ptr, i32 } %34

bb15:                                             ; preds = %bb8
  br label %bb9

bb2:                                              ; No predecessors!
  unreachable
}

; <T as alloc::slice::hack::ConvertVec>::to_vec
; Function Attrs: inlinehint uwtable
define void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17hbc7ff63e3090c507E"(ptr sret(%"alloc::vec::Vec<u8>") align 4 %_0, ptr align 1 %s.0, i32 %s.1) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %0 = alloca { ptr, i32 }, align 4
  %v = alloca %"alloc::vec::Vec<u8>", align 4
; invoke alloc::raw_vec::RawVec<T,A>::allocate_in
  %1 = invoke { ptr, i32 } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17h7c339c8f71f1ddeaE"(i32 %s.1, i1 zeroext false)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
  br i1 false, label %bb2, label %bb1

cleanup:                                          ; preds = %start
  %2 = landingpad { ptr, i32 }
          cleanup
  %3 = extractvalue { ptr, i32 } %2, 0
  %4 = extractvalue { ptr, i32 } %2, 1
  %5 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 0
  store ptr %3, ptr %5, align 4
  %6 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  store i32 %4, ptr %6, align 4
  br label %bb3

bb4:                                              ; preds = %start
  %_13.0 = extractvalue { ptr, i32 } %1, 0
  %_13.1 = extractvalue { ptr, i32 } %1, 1
  %7 = getelementptr inbounds { ptr, i32 }, ptr %v, i32 0, i32 0
  store ptr %_13.0, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %v, i32 0, i32 1
  store i32 %_13.1, ptr %8, align 4
  %9 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i32 0, ptr %9, align 4
  %self = load ptr, ptr %v, align 4, !nonnull !3, !noundef !3
  %10 = mul i32 %s.1, 1
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %self, ptr align 1 %s.0, i32 %10, i1 false)
  %11 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %v, i32 0, i32 1
  store i32 %s.1, ptr %11, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_0, ptr align 4 %v, i32 12, i1 false)
  ret void

bb1:                                              ; preds = %bb2, %bb3
  %12 = load ptr, ptr %0, align 4, !noundef !3
  %13 = getelementptr inbounds { ptr, i32 }, ptr %0, i32 0, i32 1
  %14 = load i32, ptr %13, align 4, !noundef !3
  %15 = insertvalue { ptr, i32 } poison, ptr %12, 0
  %16 = insertvalue { ptr, i32 } %15, i32 %14, 1
  resume { ptr, i32 } %16

bb2:                                              ; preds = %bb3
  br label %bb1
}

; alloc::fmt::format
; Function Attrs: inlinehint uwtable
define internal void @_ZN5alloc3fmt6format17h502e639fce812fa9E(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %args) unnamed_addr #0 {
start:
  %_4 = alloca ptr, align 4
  %_2 = alloca { ptr, i32 }, align 4
  %0 = getelementptr inbounds { ptr, i32 }, ptr %args, i32 0, i32 0
  %_6.0 = load ptr, ptr %0, align 4, !nonnull !3, !align !2, !noundef !3
  %1 = getelementptr inbounds { ptr, i32 }, ptr %args, i32 0, i32 1
  %_6.1 = load i32, ptr %1, align 4, !noundef !3
  %2 = getelementptr inbounds %"core::fmt::Arguments<'_>", ptr %args, i32 0, i32 1
  %3 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 0
  %_7.0 = load ptr, ptr %3, align 4, !nonnull !3, !align !2, !noundef !3
  %4 = getelementptr inbounds { ptr, i32 }, ptr %2, i32 0, i32 1
  %_7.1 = load i32, ptr %4, align 4, !noundef !3
  %5 = icmp eq i32 %_6.1, 0
  br i1 %5, label %bb3, label %bb5

bb3:                                              ; preds = %start
  %6 = icmp eq i32 %_7.1, 0
  br i1 %6, label %bb7, label %bb4

bb5:                                              ; preds = %start
  %7 = icmp eq i32 %_6.1, 1
  br i1 %7, label %bb6, label %bb4

bb7:                                              ; preds = %bb3
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  store ptr @alloc_c06a172a08ac35a48b6ad59116e021fc, ptr %8, align 4
  %9 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  store i32 0, ptr %9, align 4
  br label %bb1

bb4:                                              ; preds = %bb6, %bb5, %bb3
  store ptr null, ptr %_2, align 4
  br label %bb1

bb1:                                              ; preds = %bb4, %bb8, %bb7
  store ptr %args, ptr %_4, align 4
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  %11 = load ptr, ptr %10, align 4, !align !4, !noundef !3
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %_4, align 4, !nonnull !3, !align !2, !noundef !3
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17h3acea89fd5e160e2E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %11, i32 %13, ptr align 4 %14)
  ret void

bb6:                                              ; preds = %bb5
  %15 = icmp eq i32 %_7.1, 0
  br i1 %15, label %bb8, label %bb4

bb8:                                              ; preds = %bb6
  %s = getelementptr inbounds [0 x { ptr, i32 }], ptr %_6.0, i32 0, i32 0
  %16 = getelementptr inbounds [0 x { ptr, i32 }], ptr %_6.0, i32 0, i32 0
  %17 = getelementptr inbounds { ptr, i32 }, ptr %16, i32 0, i32 0
  %_14.0 = load ptr, ptr %17, align 4, !nonnull !3, !align !4, !noundef !3
  %18 = getelementptr inbounds { ptr, i32 }, ptr %16, i32 0, i32 1
  %_14.1 = load i32, ptr %18, align 4, !noundef !3
  %19 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 0
  store ptr %_14.0, ptr %19, align 4
  %20 = getelementptr inbounds { ptr, i32 }, ptr %_2, i32 0, i32 1
  store i32 %_14.1, ptr %20, align 4
  br label %bb1
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint uwtable
define void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17ha1516c1df524e780E"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %0) unnamed_addr #0 {
start:
  %_2 = alloca %"core::fmt::Arguments<'_>", align 4
  %_1 = alloca ptr, align 4
  store ptr %0, ptr %_1, align 4
  %_3 = load ptr, ptr %_1, align 4, !nonnull !3, !align !2, !noundef !3
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_2, ptr align 4 %_3, i32 24, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17h8192c62d2ca81920E(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 4 %_2)
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint uwtable
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17hf781709f94235a3bE"(ptr sret(%"alloc::string::String") align 4 %_0, ptr align 1 %self.0, i32 %self.1) unnamed_addr #0 {
start:
  %bytes = alloca %"alloc::vec::Vec<u8>", align 4
; call <T as alloc::slice::hack::ConvertVec>::to_vec
  call void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17hbc7ff63e3090c507E"(ptr sret(%"alloc::vec::Vec<u8>") align 4 %bytes, ptr align 1 %self.0, i32 %self.1)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_0, ptr align 4 %bytes, i32 12, i1 false)
  ret void
}

; alloc::alloc::Global::alloc_impl
; Function Attrs: inlinehint uwtable
define internal { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17h604154f957d68b32E(ptr align 1 %self, i32 %0, i32 %1, i1 zeroext %zeroed) unnamed_addr #0 {
start:
  %2 = alloca i8, align 1
  %_76 = alloca { ptr, i32 }, align 4
  %_75 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %_62 = alloca ptr, align 4
  %_57 = alloca i32, align 4
  %_43 = alloca i32, align 4
  %_34 = alloca { ptr, i32 }, align 4
  %_33 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %_22 = alloca i32, align 4
  %_18 = alloca { ptr, i32 }, align 4
  %self4 = alloca ptr, align 4
  %self3 = alloca ptr, align 4
  %_12 = alloca ptr, align 4
  %layout2 = alloca { i32, i32 }, align 4
  %layout1 = alloca { i32, i32 }, align 4
  %raw_ptr = alloca ptr, align 4
  %data = alloca ptr, align 4
  %_6 = alloca { ptr, i32 }, align 4
  %_0 = alloca { ptr, i32 }, align 4
  %layout = alloca { i32, i32 }, align 4
  %3 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  store i32 %0, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %1, ptr %4, align 4
  %5 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %size = load i32, ptr %5, align 4, !noundef !3
  %6 = icmp eq i32 %size, 0
  br i1 %6, label %bb2, label %bb1

bb2:                                              ; preds = %start
  %self5 = load i32, ptr %layout, align 4, !range !5, !noundef !3
  store i32 %self5, ptr %_22, align 4
  %_23 = load i32, ptr %_22, align 4, !range !5, !noundef !3
  %_24 = icmp uge i32 %_23, 1
  %_25 = icmp ule i32 %_23, -2147483648
  %_26 = and i1 %_24, %_25
  call void @llvm.assume(i1 %_26)
  %ptr = inttoptr i32 %_23 to ptr
  store ptr %ptr, ptr %data, align 4
  %_31 = load ptr, ptr %data, align 4, !noundef !3
  store ptr %_31, ptr %_34, align 4
  %7 = getelementptr inbounds { ptr, i32 }, ptr %_34, i32 0, i32 1
  store i32 0, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_34, i32 0, i32 0
  %9 = load ptr, ptr %8, align 4, !noundef !3
  %10 = getelementptr inbounds { ptr, i32 }, ptr %_34, i32 0, i32 1
  %11 = load i32, ptr %10, align 4, !noundef !3
  %12 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 0
  store ptr %9, ptr %12, align 4
  %13 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 1
  store i32 %11, ptr %13, align 4
  %14 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 0
  %ptr.0 = load ptr, ptr %14, align 4, !noundef !3
  %15 = getelementptr inbounds { ptr, i32 }, ptr %_33, i32 0, i32 1
  %ptr.1 = load i32, ptr %15, align 4, !noundef !3
  %16 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 0
  store ptr %ptr.0, ptr %16, align 4
  %17 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 1
  store i32 %ptr.1, ptr %17, align 4
  %18 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 0
  %19 = load ptr, ptr %18, align 4, !nonnull !3, !noundef !3
  %20 = getelementptr inbounds { ptr, i32 }, ptr %_6, i32 0, i32 1
  %21 = load i32, ptr %20, align 4, !noundef !3
  %22 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %19, ptr %22, align 4
  %23 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %21, ptr %23, align 4
  br label %bb11

bb1:                                              ; preds = %start
  br i1 %zeroed, label %bb3, label %bb4

bb11:                                             ; preds = %bb10, %bb8, %bb2
  %24 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  %25 = load ptr, ptr %24, align 4, !noundef !3
  %26 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = insertvalue { ptr, i32 } poison, ptr %25, 0
  %29 = insertvalue { ptr, i32 } %28, i32 %27, 1
  ret { ptr, i32 } %29

bb4:                                              ; preds = %bb1
  %30 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %31 = load i32, ptr %30, align 4, !range !5, !noundef !3
  %32 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %33 = load i32, ptr %32, align 4, !noundef !3
  %34 = getelementptr inbounds { i32, i32 }, ptr %layout2, i32 0, i32 0
  store i32 %31, ptr %34, align 4
  %35 = getelementptr inbounds { i32, i32 }, ptr %layout2, i32 0, i32 1
  store i32 %33, ptr %35, align 4
  %36 = load volatile i8, ptr @__rust_no_alloc_shim_is_unstable, align 1
  store i8 %36, ptr %2, align 1
  %_48 = load i8, ptr %2, align 1, !noundef !3
  %37 = getelementptr inbounds { i32, i32 }, ptr %layout2, i32 0, i32 1
  %_51 = load i32, ptr %37, align 4, !noundef !3
  %self6 = load i32, ptr %layout2, align 4, !range !5, !noundef !3
  store i32 %self6, ptr %_57, align 4
  %_58 = load i32, ptr %_57, align 4, !range !5, !noundef !3
  %_59 = icmp uge i32 %_58, 1
  %_60 = icmp ule i32 %_58, -2147483648
  %_61 = and i1 %_59, %_60
  call void @llvm.assume(i1 %_61)
  %38 = call ptr @__rust_alloc(i32 %_51, i32 %_58) #15
  store ptr %38, ptr %raw_ptr, align 4
  br label %bb5

bb3:                                              ; preds = %bb1
  %39 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %40 = load i32, ptr %39, align 4, !range !5, !noundef !3
  %41 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %42 = load i32, ptr %41, align 4, !noundef !3
  %43 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 0
  store i32 %40, ptr %43, align 4
  %44 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  store i32 %42, ptr %44, align 4
  %45 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  %_38 = load i32, ptr %45, align 4, !noundef !3
  %self7 = load i32, ptr %layout1, align 4, !range !5, !noundef !3
  store i32 %self7, ptr %_43, align 4
  %_44 = load i32, ptr %_43, align 4, !range !5, !noundef !3
  %_45 = icmp uge i32 %_44, 1
  %_46 = icmp ule i32 %_44, -2147483648
  %_47 = and i1 %_45, %_46
  call void @llvm.assume(i1 %_47)
  %46 = call ptr @__rust_alloc_zeroed(i32 %_38, i32 %_44) #15
  store ptr %46, ptr %raw_ptr, align 4
  br label %bb5

bb5:                                              ; preds = %bb3, %bb4
  %ptr8 = load ptr, ptr %raw_ptr, align 4, !noundef !3
  %_63 = ptrtoint ptr %ptr8 to i32
  %47 = icmp eq i32 %_63, 0
  br i1 %47, label %bb15, label %bb16

bb15:                                             ; preds = %bb5
  store ptr null, ptr %self4, align 4
  br label %bb6

bb16:                                             ; preds = %bb5
  store ptr %ptr8, ptr %_62, align 4
  %48 = load ptr, ptr %_62, align 4, !nonnull !3, !noundef !3
  store ptr %48, ptr %self4, align 4
  br label %bb6

bb6:                                              ; preds = %bb16, %bb15
  %49 = load ptr, ptr %self4, align 4, !noundef !3
  %50 = ptrtoint ptr %49 to i32
  %51 = icmp eq i32 %50, 0
  %_67 = select i1 %51, i32 0, i32 1
  %52 = icmp eq i32 %_67, 0
  br i1 %52, label %bb17, label %bb18

bb17:                                             ; preds = %bb6
  store ptr null, ptr %self3, align 4
  br label %bb19

bb18:                                             ; preds = %bb6
  %v = load ptr, ptr %self4, align 4, !nonnull !3, !noundef !3
  store ptr %v, ptr %self3, align 4
  br label %bb19

bb19:                                             ; preds = %bb18, %bb17
  %53 = load ptr, ptr %self3, align 4, !noundef !3
  %54 = ptrtoint ptr %53 to i32
  %55 = icmp eq i32 %54, 0
  %_69 = select i1 %55, i32 1, i32 0
  %56 = icmp eq i32 %_69, 0
  br i1 %56, label %bb21, label %bb20

bb21:                                             ; preds = %bb19
  %v9 = load ptr, ptr %self3, align 4, !nonnull !3, !noundef !3
  store ptr %v9, ptr %_12, align 4
  br label %bb7

bb20:                                             ; preds = %bb19
  store ptr null, ptr %_12, align 4
  br label %bb7

bb7:                                              ; preds = %bb20, %bb21
  %57 = load ptr, ptr %_12, align 4, !noundef !3
  %58 = ptrtoint ptr %57 to i32
  %59 = icmp eq i32 %58, 0
  %_16 = select i1 %59, i32 1, i32 0
  %60 = icmp eq i32 %_16, 0
  br i1 %60, label %bb8, label %bb10

bb8:                                              ; preds = %bb7
  %ptr10 = load ptr, ptr %_12, align 4, !nonnull !3, !noundef !3
  store ptr %ptr10, ptr %_76, align 4
  %61 = getelementptr inbounds { ptr, i32 }, ptr %_76, i32 0, i32 1
  store i32 %size, ptr %61, align 4
  %62 = getelementptr inbounds { ptr, i32 }, ptr %_76, i32 0, i32 0
  %63 = load ptr, ptr %62, align 4, !noundef !3
  %64 = getelementptr inbounds { ptr, i32 }, ptr %_76, i32 0, i32 1
  %65 = load i32, ptr %64, align 4, !noundef !3
  %66 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 0
  store ptr %63, ptr %66, align 4
  %67 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 1
  store i32 %65, ptr %67, align 4
  %68 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 0
  %ptr.011 = load ptr, ptr %68, align 4, !noundef !3
  %69 = getelementptr inbounds { ptr, i32 }, ptr %_75, i32 0, i32 1
  %ptr.112 = load i32, ptr %69, align 4, !noundef !3
  %70 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 0
  store ptr %ptr.011, ptr %70, align 4
  %71 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 1
  store i32 %ptr.112, ptr %71, align 4
  %72 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 0
  %73 = load ptr, ptr %72, align 4, !nonnull !3, !noundef !3
  %74 = getelementptr inbounds { ptr, i32 }, ptr %_18, i32 0, i32 1
  %75 = load i32, ptr %74, align 4, !noundef !3
  %76 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  store ptr %73, ptr %76, align 4
  %77 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %75, ptr %77, align 4
  br label %bb11

bb10:                                             ; preds = %bb7
  store ptr null, ptr %_0, align 4
  br label %bb11

bb9:                                              ; No predecessors!
  unreachable
}

; alloc::raw_vec::RawVec<T,A>::allocate_in
; Function Attrs: uwtable
define { ptr, i32 } @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$11allocate_in17h7c339c8f71f1ddeaE"(i32 %capacity, i1 zeroext %0) unnamed_addr #1 personality ptr @rust_eh_personality {
start:
  %1 = alloca { ptr, i32 }, align 4
  %_49 = alloca ptr, align 4
  %self1 = alloca { i32, i32 }, align 4
  %_41 = alloca { i32, i32 }, align 4
  %_32 = alloca ptr, align 4
  %_31 = alloca ptr, align 4
  %self = alloca ptr, align 4
  %_26 = alloca ptr, align 4
  %result = alloca { ptr, i32 }, align 4
  %_11 = alloca { i32, i32 }, align 4
  %_7 = alloca { i32, i32 }, align 4
  %layout = alloca { i32, i32 }, align 4
  %_0 = alloca { ptr, i32 }, align 4
  %alloc = alloca %"alloc::alloc::Global", align 1
  %init = alloca i8, align 1
  %2 = zext i1 %0 to i8
  store i8 %2, ptr %init, align 1
  br i1 false, label %bb2, label %bb1

bb1:                                              ; preds = %start
  %3 = icmp eq i32 %capacity, 0
  br i1 %3, label %bb2, label %bb3

bb2:                                              ; preds = %bb1, %start
  store ptr inttoptr (i32 1 to ptr), ptr %_32, align 4
  %4 = load ptr, ptr %_32, align 4, !nonnull !3, !noundef !3
  store ptr %4, ptr %_31, align 4
  %5 = load ptr, ptr %_31, align 4, !nonnull !3, !noundef !3
  store ptr %5, ptr %_0, align 4
  %6 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 0, ptr %6, align 4
  br label %bb16

bb3:                                              ; preds = %bb1
; invoke core::alloc::layout::Layout::array::inner
  %7 = invoke { i32, i32 } @_ZN4core5alloc6layout6Layout5array5inner17h1fe2f62ffe65d219E(i32 1, i32 1, i32 %capacity)
          to label %bb20 unwind label %cleanup

bb19:                                             ; preds = %cleanup
  br i1 true, label %bb18, label %bb17

cleanup:                                          ; preds = %bb4, %bb7, %bb14, %bb9, %bb10, %bb3
  %8 = landingpad { ptr, i32 }
          cleanup
  %9 = extractvalue { ptr, i32 } %8, 0
  %10 = extractvalue { ptr, i32 } %8, 1
  %11 = getelementptr inbounds { ptr, i32 }, ptr %1, i32 0, i32 0
  store ptr %9, ptr %11, align 4
  %12 = getelementptr inbounds { ptr, i32 }, ptr %1, i32 0, i32 1
  store i32 %10, ptr %12, align 4
  br label %bb19

bb20:                                             ; preds = %bb3
  store { i32, i32 } %7, ptr %_7, align 4
  %13 = load i32, ptr %_7, align 4, !range !6, !noundef !3
  %14 = icmp eq i32 %13, 0
  %_8 = select i1 %14, i32 1, i32 0
  %15 = icmp eq i32 %_8, 0
  br i1 %15, label %bb6, label %bb4

bb6:                                              ; preds = %bb20
  %16 = getelementptr inbounds { i32, i32 }, ptr %_7, i32 0, i32 0
  %layout.0 = load i32, ptr %16, align 4, !range !5, !noundef !3
  %17 = getelementptr inbounds { i32, i32 }, ptr %_7, i32 0, i32 1
  %layout.1 = load i32, ptr %17, align 4, !noundef !3
  %18 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  store i32 %layout.0, ptr %18, align 4
  %19 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %layout.1, ptr %19, align 4
  %20 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %alloc_size = load i32, ptr %20, align 4, !noundef !3
  %_40 = icmp ugt i32 %alloc_size, 2147483647
  br i1 %_40, label %bb21, label %bb22

bb4:                                              ; preds = %bb20
; invoke alloc::raw_vec::capacity_overflow
  invoke void @_ZN5alloc7raw_vec17capacity_overflow17h0d1a5dd45b7f5d47E() #12
          to label %unreachable unwind label %cleanup

bb22:                                             ; preds = %bb6
  store i32 -2147483647, ptr %_11, align 4
  br label %bb23

bb21:                                             ; preds = %bb6
  store i32 0, ptr %self1, align 4
  %21 = getelementptr inbounds { i32, i32 }, ptr %self1, i32 0, i32 0
  %22 = load i32, ptr %21, align 4, !range !6, !noundef !3
  %23 = getelementptr inbounds { i32, i32 }, ptr %self1, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = getelementptr inbounds { i32, i32 }, ptr %_41, i32 0, i32 0
  store i32 %22, ptr %25, align 4
  %26 = getelementptr inbounds { i32, i32 }, ptr %_41, i32 0, i32 1
  store i32 %24, ptr %26, align 4
  %27 = getelementptr inbounds { i32, i32 }, ptr %_41, i32 0, i32 0
  %28 = load i32, ptr %27, align 4, !range !6, !noundef !3
  %29 = getelementptr inbounds { i32, i32 }, ptr %_41, i32 0, i32 1
  %30 = load i32, ptr %29, align 4
  %31 = getelementptr inbounds { i32, i32 }, ptr %_11, i32 0, i32 0
  store i32 %28, ptr %31, align 4
  %32 = getelementptr inbounds { i32, i32 }, ptr %_11, i32 0, i32 1
  store i32 %30, ptr %32, align 4
  br label %bb23

bb23:                                             ; preds = %bb21, %bb22
  %33 = load i32, ptr %_11, align 4, !range !8, !noundef !3
  %34 = icmp eq i32 %33, -2147483647
  %_14 = select i1 %34, i32 0, i32 1
  %35 = icmp eq i32 %_14, 0
  br i1 %35, label %bb8, label %bb7

bb8:                                              ; preds = %bb23
  %36 = load i8, ptr %init, align 1, !range !7, !noundef !3
  %37 = trunc i8 %36 to i1
  %_17 = zext i1 %37 to i32
  %38 = icmp eq i32 %_17, 0
  br i1 %38, label %bb10, label %bb9

bb7:                                              ; preds = %bb23
; invoke alloc::raw_vec::capacity_overflow
  invoke void @_ZN5alloc7raw_vec17capacity_overflow17h0d1a5dd45b7f5d47E() #12
          to label %unreachable unwind label %cleanup

bb10:                                             ; preds = %bb8
  %39 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %_19.0 = load i32, ptr %39, align 4, !range !5, !noundef !3
  %40 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_19.1 = load i32, ptr %40, align 4, !noundef !3
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate
  %41 = invoke { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h15a389b1715faf3bE"(ptr align 1 %alloc, i32 %_19.0, i32 %_19.1)
          to label %bb11 unwind label %cleanup

bb9:                                              ; preds = %bb8
  %42 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %_21.0 = load i32, ptr %42, align 4, !range !5, !noundef !3
  %43 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_21.1 = load i32, ptr %43, align 4, !noundef !3
; invoke <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
  %44 = invoke { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h3a4e72c4420bb746E"(ptr align 1 %alloc, i32 %_21.0, i32 %_21.1)
          to label %bb12 unwind label %cleanup

bb11:                                             ; preds = %bb10
  store { ptr, i32 } %41, ptr %result, align 4
  br label %bb13

bb13:                                             ; preds = %bb12, %bb11
  %45 = load ptr, ptr %result, align 4, !noundef !3
  %46 = ptrtoint ptr %45 to i32
  %47 = icmp eq i32 %46, 0
  %_22 = select i1 %47, i32 1, i32 0
  %48 = icmp eq i32 %_22, 0
  br i1 %48, label %bb15, label %bb14

bb12:                                             ; preds = %bb9
  store { ptr, i32 } %44, ptr %result, align 4
  br label %bb13

bb15:                                             ; preds = %bb13
  %49 = getelementptr inbounds { ptr, i32 }, ptr %result, i32 0, i32 0
  %ptr.0 = load ptr, ptr %49, align 4, !nonnull !3, !noundef !3
  %50 = getelementptr inbounds { ptr, i32 }, ptr %result, i32 0, i32 1
  %ptr.1 = load i32, ptr %50, align 4, !noundef !3
  store ptr %ptr.0, ptr %self, align 4
  %_48 = load ptr, ptr %self, align 4, !noundef !3
  store ptr %_48, ptr %_49, align 4
  %51 = load ptr, ptr %_49, align 4, !nonnull !3, !noundef !3
  store ptr %51, ptr %_26, align 4
  %52 = load ptr, ptr %_26, align 4, !nonnull !3, !noundef !3
  store ptr %52, ptr %_0, align 4
  %53 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  store i32 %capacity, ptr %53, align 4
  br label %bb16

bb14:                                             ; preds = %bb13
  %54 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %_25.0 = load i32, ptr %54, align 4, !range !5, !noundef !3
  %55 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_25.1 = load i32, ptr %55, align 4, !noundef !3
; invoke alloc::alloc::handle_alloc_error
  invoke void @_ZN5alloc5alloc18handle_alloc_error17ha9f030e217f12f3aE(i32 %_25.0, i32 %_25.1) #12
          to label %unreachable unwind label %cleanup

bb16:                                             ; preds = %bb2, %bb15
  %56 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 0
  %57 = load ptr, ptr %56, align 4, !nonnull !3, !noundef !3
  %58 = getelementptr inbounds { ptr, i32 }, ptr %_0, i32 0, i32 1
  %59 = load i32, ptr %58, align 4, !noundef !3
  %60 = insertvalue { ptr, i32 } poison, ptr %57, 0
  %61 = insertvalue { ptr, i32 } %60, i32 %59, 1
  ret { ptr, i32 } %61

unreachable:                                      ; preds = %bb4, %bb7, %bb14
  unreachable

bb5:                                              ; No predecessors!
  unreachable

bb17:                                             ; preds = %bb18, %bb19
  %62 = load ptr, ptr %1, align 4, !noundef !3
  %63 = getelementptr inbounds { ptr, i32 }, ptr %1, i32 0, i32 1
  %64 = load i32, ptr %63, align 4, !noundef !3
  %65 = insertvalue { ptr, i32 } poison, ptr %62, 0
  %66 = insertvalue { ptr, i32 } %65, i32 %64, 1
  resume { ptr, i32 } %66

bb18:                                             ; preds = %bb19
  br label %bb17
}

; alloc::raw_vec::RawVec<T,A>::current_memory
; Function Attrs: uwtable
define void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17hd10571c3794672b8E"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 4 %_0, ptr align 4 %self) unnamed_addr #1 {
start:
  %self2 = alloca ptr, align 4
  %self1 = alloca ptr, align 4
  %_10 = alloca ptr, align 4
  %_9 = alloca { ptr, { i32, i32 } }, align 4
  %layout = alloca { i32, i32 }, align 4
  br i1 false, label %bb2, label %bb1

bb1:                                              ; preds = %start
  %0 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  %_3 = load i32, ptr %0, align 4, !noundef !3
  %1 = icmp eq i32 %_3, 0
  br i1 %1, label %bb2, label %bb3

bb2:                                              ; preds = %bb1, %start
  %2 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_0, i32 0, i32 1
  store i32 0, ptr %2, align 4
  br label %bb4

bb3:                                              ; preds = %bb1
  %3 = getelementptr inbounds { ptr, i32 }, ptr %self, i32 0, i32 1
  %rhs = load i32, ptr %3, align 4, !noundef !3
  %size = mul nuw i32 1, %rhs
  %4 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %size, ptr %4, align 4
  store i32 1, ptr %layout, align 4
  %self3 = load ptr, ptr %self, align 4, !nonnull !3, !noundef !3
  store ptr %self3, ptr %self1, align 4
  %_19 = load ptr, ptr %self1, align 4, !noundef !3
  store ptr %_19, ptr %self2, align 4
  %_24 = load ptr, ptr %self2, align 4, !noundef !3
  store ptr %_24, ptr %_10, align 4
  %5 = load ptr, ptr %_10, align 4, !nonnull !3, !noundef !3
  store ptr %5, ptr %_9, align 4
  %6 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %7 = load i32, ptr %6, align 4, !range !5, !noundef !3
  %8 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %9 = load i32, ptr %8, align 4, !noundef !3
  %10 = getelementptr inbounds { ptr, { i32, i32 } }, ptr %_9, i32 0, i32 1
  %11 = getelementptr inbounds { i32, i32 }, ptr %10, i32 0, i32 0
  store i32 %7, ptr %11, align 4
  %12 = getelementptr inbounds { i32, i32 }, ptr %10, i32 0, i32 1
  store i32 %9, ptr %12, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_0, ptr align 4 %_9, i32 12, i1 false)
  br label %bb4

bb4:                                              ; preds = %bb2, %bb3
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::deallocate
; Function Attrs: inlinehint uwtable
define internal void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h2241bb5081efc57dE"(ptr align 1 %self, ptr %ptr, i32 %0, i32 %1) unnamed_addr #0 {
start:
  %_14 = alloca i32, align 4
  %layout1 = alloca { i32, i32 }, align 4
  %layout = alloca { i32, i32 }, align 4
  %2 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  store i32 %0, ptr %2, align 4
  %3 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  store i32 %1, ptr %3, align 4
  %4 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %_4 = load i32, ptr %4, align 4, !noundef !3
  %5 = icmp eq i32 %_4, 0
  br i1 %5, label %bb2, label %bb1

bb2:                                              ; preds = %start
  br label %bb3

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 0
  %7 = load i32, ptr %6, align 4, !range !5, !noundef !3
  %8 = getelementptr inbounds { i32, i32 }, ptr %layout, i32 0, i32 1
  %9 = load i32, ptr %8, align 4, !noundef !3
  %10 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 0
  store i32 %7, ptr %10, align 4
  %11 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  store i32 %9, ptr %11, align 4
  %12 = getelementptr inbounds { i32, i32 }, ptr %layout1, i32 0, i32 1
  %_9 = load i32, ptr %12, align 4, !noundef !3
  %self2 = load i32, ptr %layout1, align 4, !range !5, !noundef !3
  store i32 %self2, ptr %_14, align 4
  %_15 = load i32, ptr %_14, align 4, !range !5, !noundef !3
  %_16 = icmp uge i32 %_15, 1
  %_17 = icmp ule i32 %_15, -2147483648
  %_18 = and i1 %_16, %_17
  call void @llvm.assume(i1 %_18)
  call void @__rust_dealloc(ptr %ptr, i32 %_9, i32 %_15) #15
  br label %bb3

bb3:                                              ; preds = %bb1, %bb2
  ret void
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate_zeroed
; Function Attrs: inlinehint uwtable
define internal { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$15allocate_zeroed17h3a4e72c4420bb746E"(ptr align 1 %self, i32 %layout.0, i32 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17h604154f957d68b32E(ptr align 1 %self, i32 %layout.0, i32 %layout.1, i1 zeroext true)
  %_0.0 = extractvalue { ptr, i32 } %0, 0
  %_0.1 = extractvalue { ptr, i32 } %0, 1
  %1 = insertvalue { ptr, i32 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i32 } %1, i32 %_0.1, 1
  ret { ptr, i32 } %2
}

; <alloc::alloc::Global as core::alloc::Allocator>::allocate
; Function Attrs: inlinehint uwtable
define internal { ptr, i32 } @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$8allocate17h15a389b1715faf3bE"(ptr align 1 %self, i32 %layout.0, i32 %layout.1) unnamed_addr #0 {
start:
; call alloc::alloc::Global::alloc_impl
  %0 = call { ptr, i32 } @_ZN5alloc5alloc6Global10alloc_impl17h604154f957d68b32E(ptr align 1 %self, i32 %layout.0, i32 %layout.1, i1 zeroext false)
  %_0.0 = extractvalue { ptr, i32 } %0, 0
  %_0.1 = extractvalue { ptr, i32 } %0, 1
  %1 = insertvalue { ptr, i32 } poison, ptr %_0.0, 0
  %2 = insertvalue { ptr, i32 } %1, i32 %_0.1, 1
  ret { ptr, i32 } %2
}

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h002126a6b515e950E"(ptr align 4 %self) unnamed_addr #1 {
start:
  %_10 = alloca { ptr, i32 }, align 4
  %_9 = alloca %"core::ptr::metadata::PtrRepr<[u8]>", align 4
  %self1 = load ptr, ptr %self, align 4, !nonnull !3, !noundef !3
  %0 = getelementptr inbounds %"alloc::vec::Vec<u8>", ptr %self, i32 0, i32 1
  %len = load i32, ptr %0, align 4, !noundef !3
  store ptr %self1, ptr %_10, align 4
  %1 = getelementptr inbounds { ptr, i32 }, ptr %_10, i32 0, i32 1
  store i32 %len, ptr %1, align 4
  %2 = getelementptr inbounds { ptr, i32 }, ptr %_10, i32 0, i32 0
  %3 = load ptr, ptr %2, align 4, !noundef !3
  %4 = getelementptr inbounds { ptr, i32 }, ptr %_10, i32 0, i32 1
  %5 = load i32, ptr %4, align 4, !noundef !3
  %6 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 0
  store ptr %3, ptr %6, align 4
  %7 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 1
  store i32 %5, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 0
  %_2.0 = load ptr, ptr %8, align 4, !noundef !3
  %9 = getelementptr inbounds { ptr, i32 }, ptr %_9, i32 0, i32 1
  %_2.1 = load i32, ptr %9, align 4, !noundef !3
  ret void
}

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: uwtable
define void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h0a719768b5dd6fd1E"(ptr align 4 %self) unnamed_addr #1 {
start:
  %_2 = alloca %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", align 4
; call alloc::raw_vec::RawVec<T,A>::current_memory
  call void @"_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$14current_memory17hd10571c3794672b8E"(ptr sret(%"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>") align 4 %_2, ptr align 4 %self)
  %0 = getelementptr inbounds %"core::option::Option<(core::ptr::non_null::NonNull<u8>, core::alloc::layout::Layout)>", ptr %_2, i32 0, i32 1
  %1 = load i32, ptr %0, align 4, !range !6, !noundef !3
  %2 = icmp eq i32 %1, 0
  %_4 = select i1 %2, i32 0, i32 1
  %3 = icmp eq i32 %_4, 1
  br i1 %3, label %bb2, label %bb4

bb2:                                              ; preds = %start
  %ptr = load ptr, ptr %_2, align 4, !nonnull !3, !noundef !3
  %4 = getelementptr inbounds { ptr, { i32, i32 } }, ptr %_2, i32 0, i32 1
  %5 = getelementptr inbounds { i32, i32 }, ptr %4, i32 0, i32 0
  %layout.0 = load i32, ptr %5, align 4, !range !5, !noundef !3
  %6 = getelementptr inbounds { i32, i32 }, ptr %4, i32 0, i32 1
  %layout.1 = load i32, ptr %6, align 4, !noundef !3
  %_7 = getelementptr i8, ptr %self, i32 8
; call <alloc::alloc::Global as core::alloc::Allocator>::deallocate
  call void @"_ZN63_$LT$alloc..alloc..Global$u20$as$u20$core..alloc..Allocator$GT$10deallocate17h2241bb5081efc57dE"(ptr align 1 %_7, ptr %ptr, i32 %layout.0, i32 %layout.1)
  br label %bb4

bb4:                                              ; preds = %bb2, %start
  ret void
}

; probe1::probe
; Function Attrs: uwtable
define void @_ZN6probe15probe17h2fc149f31f20cb85E() unnamed_addr #1 {
start:
  %_0.i = alloca { ptr, ptr }, align 4
  %_7 = alloca [1 x { ptr, ptr }], align 4
  %_3 = alloca %"core::fmt::Arguments<'_>", align 4
  %res = alloca %"alloc::string::String", align 4
  %_1 = alloca %"alloc::string::String", align 4
  store ptr @alloc_83ea17bf0c4f4a5a5a13d3ae7955acd0, ptr %_0.i, align 4
  %0 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  store ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h9f0b63b13407c9efE", ptr %0, align 4
  %1 = load ptr, ptr %_0.i, align 4, !nonnull !3, !align !4, !noundef !3
  %2 = getelementptr inbounds { ptr, ptr }, ptr %_0.i, i32 0, i32 1
  %3 = load ptr, ptr %2, align 4, !nonnull !3, !noundef !3
  %4 = insertvalue { ptr, ptr } poison, ptr %1, 0
  %5 = insertvalue { ptr, ptr } %4, ptr %3, 1
  %_8.0 = extractvalue { ptr, ptr } %5, 0
  %_8.1 = extractvalue { ptr, ptr } %5, 1
  %6 = getelementptr inbounds [1 x { ptr, ptr }], ptr %_7, i32 0, i32 0
  %7 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 0
  store ptr %_8.0, ptr %7, align 4
  %8 = getelementptr inbounds { ptr, ptr }, ptr %6, i32 0, i32 1
  store ptr %_8.1, ptr %8, align 4
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117h223ec9651128b420E(ptr sret(%"core::fmt::Arguments<'_>") align 4 %_3, ptr align 4 @alloc_97350e8bf483c1fe1c3a218b02d80fb1, i32 1, ptr align 4 %_7, i32 1)
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17h502e639fce812fa9E(ptr sret(%"alloc::string::String") align 4 %res, ptr align 4 %_3)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %_1, ptr align 4 %res, i32 12, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h72e3dd43756d4f32E"(ptr align 4 %_1)
  ret void
}

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h9f0b63b13407c9efE"(ptr align 4, ptr align 4) unnamed_addr #1

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking9panic_fmt17h8911d7f11480f1bdE(ptr align 4, ptr align 4) unnamed_addr #2

; Function Attrs: uwtable
declare i32 @rust_eh_personality(i32, ptr, ptr) unnamed_addr #1

; core::panicking::panic_in_cleanup
; Function Attrs: cold noinline noreturn nounwind uwtable
declare void @_ZN4core9panicking16panic_in_cleanup17h5a5a0410658fcc8fE() unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.expect.i1(i1, i1) #5

; core::panicking::panic
; Function Attrs: cold noinline noreturn uwtable
declare void @_ZN4core9panicking5panic17hc9494689c3b5544cE(ptr align 1, i32, ptr align 4) unnamed_addr #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #6

; alloc::fmt::format::format_inner
; Function Attrs: uwtable
declare void @_ZN5alloc3fmt6format12format_inner17h8192c62d2ca81920E(ptr sret(%"alloc::string::String") align 4, ptr align 4) unnamed_addr #1

; Function Attrs: nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc(i32, i32 allocalign) unnamed_addr #7

; Function Attrs: nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable
declare noalias ptr @__rust_alloc_zeroed(i32, i32 allocalign) unnamed_addr #8

; alloc::alloc::handle_alloc_error
; Function Attrs: cold noreturn uwtable
declare void @_ZN5alloc5alloc18handle_alloc_error17ha9f030e217f12f3aE(i32, i32) unnamed_addr #9

; alloc::raw_vec::capacity_overflow
; Function Attrs: noinline noreturn uwtable
declare void @_ZN5alloc7raw_vec17capacity_overflow17h0d1a5dd45b7f5d47E() unnamed_addr #10

; Function Attrs: nounwind allockind("free") uwtable
declare void @__rust_dealloc(ptr allocptr, i32, i32) unnamed_addr #11

attributes #0 = { inlinehint uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #1 = { uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #2 = { cold noinline noreturn uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #3 = { cold noinline noreturn nounwind uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nounwind allockind("alloc,uninitialized,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #8 = { nounwind allockind("alloc,zeroed,aligned") allocsize(0) uwtable "alloc-family"="__rust_alloc" "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #9 = { cold noreturn uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #10 = { noinline noreturn uwtable "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #11 = { nounwind allockind("free") uwtable "alloc-family"="__rust_alloc" "target-cpu"="generic" "target-features"="+v7,+vfp3,-d32,+thumb2,-neon" }
attributes #12 = { noreturn }
attributes #13 = { cold }
attributes #14 = { cold noreturn nounwind }
attributes #15 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{!"rustc version 1.75.0 (82e1608df 2023-12-21)"}
!2 = !{i64 4}
!3 = !{}
!4 = !{i64 1}
!5 = !{i32 1, i32 -2147483647}
!6 = !{i32 0, i32 -2147483647}
!7 = !{i8 0, i8 2}
!8 = !{i32 0, i32 -2147483646}
