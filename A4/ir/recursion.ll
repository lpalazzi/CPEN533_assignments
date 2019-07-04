; ModuleID = 'recursion.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@In = external global i32

; Function Attrs: nounwind uwtable
define i32 @fib(i32 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %18

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  store i32 1, i32* %1
  br label %18

; <label>:10                                      ; preds = %6
  %11 = load i32* %2, align 4
  %12 = sub nsw i32 %11, 1
  %13 = call i32 @fib(i32 %12)
  %14 = load i32* %2, align 4
  %15 = sub nsw i32 %14, 2
  %16 = call i32 @fib(i32 %15)
  %17 = add nsw i32 %13, %16
  store i32 %17, i32* %1
  br label %18

; <label>:18                                      ; preds = %10, %9, %5
  %19 = load i32* %1
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @kalle(i32 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sle i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sub nsw i32 %7, 1
  %9 = call i32 @anka(i32 %8)
  store i32 %9, i32* %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @anka(i32 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sle i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %1
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sub nsw i32 %7, 1
  %9 = call i32 @kalle(i32 %8)
  store i32 %9, i32* %1
  br label %10

; <label>:10                                      ; preds = %6, %5
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
  %1 = call i32 @fib(i32 10)
  store volatile i32 %1, i32* @In, align 4
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
