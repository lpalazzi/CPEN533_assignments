; ModuleID = 'fac.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @fac(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %12

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = load i32* %2, align 4
  %9 = sub nsw i32 %8, 1
  %10 = call i32 @fac(i32 %9)
  %11 = mul nsw i32 %7, %10
  store i32 %11, i32* %1
  br label %12

; <label>:12                                      ; preds = %6, %5
  %13 = load i32* %1
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %s, align 4
  store volatile i32 5, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %i, align 4
  %4 = load volatile i32* %n, align 4
  %5 = icmp sle i32 %3, %4
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %2
  %7 = load i32* %i, align 4
  %8 = call i32 @fac(i32 %7)
  %9 = load i32* %s, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, i32* %s, align 4
  br label %11

; <label>:11                                      ; preds = %6
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = load i32* %s, align 4
  ret i32 %15
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
