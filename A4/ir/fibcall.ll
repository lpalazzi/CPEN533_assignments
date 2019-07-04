; ModuleID = 'fibcall.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %n) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %Fnew = alloca i32, align 4
  %Fold = alloca i32, align 4
  %temp = alloca i32, align 4
  %ans = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  store i32 1, i32* %Fnew, align 4
  store i32 0, i32* %Fold, align 4
  store i32 2, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %15, %0
  %3 = load i32* %i, align 4
  %4 = icmp sle i32 %3, 30
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = load i32* %1, align 4
  %8 = icmp sle i32 %6, %7
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %5
  %10 = load i32* %Fnew, align 4
  store i32 %10, i32* %temp, align 4
  %11 = load i32* %Fnew, align 4
  %12 = load i32* %Fold, align 4
  %13 = add nsw i32 %11, %12
  store i32 %13, i32* %Fnew, align 4
  %14 = load i32* %temp, align 4
  store i32 %14, i32* %Fold, align 4
  br label %15

; <label>:15                                      ; preds = %9
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %2

; <label>:18                                      ; preds = %5, %2
  %19 = load i32* %Fnew, align 4
  store i32 %19, i32* %ans, align 4
  %20 = load i32* %ans, align 4
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %1
  store i32 30, i32* %a, align 4
  %2 = load i32* %a, align 4
  %3 = call i32 @fib(i32 %2)
  %4 = load i32* %a, align 4
  ret i32 %4
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
