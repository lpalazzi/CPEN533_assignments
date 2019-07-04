; ModuleID = 'duff.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@source = common global [100 x i8] zeroinitializer, align 16
@target = common global [100 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @duffcopy(i8* %to, i8* %from, i32 %count) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %n = alloca i32, align 4
  store i8* %to, i8** %1, align 8
  store i8* %from, i8** %2, align 8
  store i32 %count, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = add nsw i32 %4, 7
  %6 = sdiv i32 %5, 8
  store i32 %6, i32* %n, align 4
  %7 = load i32* %3, align 4
  %8 = srem i32 %7, 8
  switch i32 %8, label %63 [
    i32 0, label %9
    i32 7, label %16
    i32 6, label %22
    i32 5, label %28
    i32 4, label %34
    i32 3, label %40
    i32 2, label %46
    i32 1, label %52
  ]

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %58, %9
  %11 = load i8** %2, align 8
  %12 = getelementptr inbounds i8* %11, i32 1
  store i8* %12, i8** %2, align 8
  %13 = load i8* %11, align 1
  %14 = load i8** %1, align 8
  %15 = getelementptr inbounds i8* %14, i32 1
  store i8* %15, i8** %1, align 8
  store i8 %13, i8* %14, align 1
  br label %16

; <label>:16                                      ; preds = %10, %0
  %17 = load i8** %2, align 8
  %18 = getelementptr inbounds i8* %17, i32 1
  store i8* %18, i8** %2, align 8
  %19 = load i8* %17, align 1
  %20 = load i8** %1, align 8
  %21 = getelementptr inbounds i8* %20, i32 1
  store i8* %21, i8** %1, align 8
  store i8 %19, i8* %20, align 1
  br label %22

; <label>:22                                      ; preds = %16, %0
  %23 = load i8** %2, align 8
  %24 = getelementptr inbounds i8* %23, i32 1
  store i8* %24, i8** %2, align 8
  %25 = load i8* %23, align 1
  %26 = load i8** %1, align 8
  %27 = getelementptr inbounds i8* %26, i32 1
  store i8* %27, i8** %1, align 8
  store i8 %25, i8* %26, align 1
  br label %28

; <label>:28                                      ; preds = %22, %0
  %29 = load i8** %2, align 8
  %30 = getelementptr inbounds i8* %29, i32 1
  store i8* %30, i8** %2, align 8
  %31 = load i8* %29, align 1
  %32 = load i8** %1, align 8
  %33 = getelementptr inbounds i8* %32, i32 1
  store i8* %33, i8** %1, align 8
  store i8 %31, i8* %32, align 1
  br label %34

; <label>:34                                      ; preds = %28, %0
  %35 = load i8** %2, align 8
  %36 = getelementptr inbounds i8* %35, i32 1
  store i8* %36, i8** %2, align 8
  %37 = load i8* %35, align 1
  %38 = load i8** %1, align 8
  %39 = getelementptr inbounds i8* %38, i32 1
  store i8* %39, i8** %1, align 8
  store i8 %37, i8* %38, align 1
  br label %40

; <label>:40                                      ; preds = %34, %0
  %41 = load i8** %2, align 8
  %42 = getelementptr inbounds i8* %41, i32 1
  store i8* %42, i8** %2, align 8
  %43 = load i8* %41, align 1
  %44 = load i8** %1, align 8
  %45 = getelementptr inbounds i8* %44, i32 1
  store i8* %45, i8** %1, align 8
  store i8 %43, i8* %44, align 1
  br label %46

; <label>:46                                      ; preds = %40, %0
  %47 = load i8** %2, align 8
  %48 = getelementptr inbounds i8* %47, i32 1
  store i8* %48, i8** %2, align 8
  %49 = load i8* %47, align 1
  %50 = load i8** %1, align 8
  %51 = getelementptr inbounds i8* %50, i32 1
  store i8* %51, i8** %1, align 8
  store i8 %49, i8* %50, align 1
  br label %52

; <label>:52                                      ; preds = %46, %0
  %53 = load i8** %2, align 8
  %54 = getelementptr inbounds i8* %53, i32 1
  store i8* %54, i8** %2, align 8
  %55 = load i8* %53, align 1
  %56 = load i8** %1, align 8
  %57 = getelementptr inbounds i8* %56, i32 1
  store i8* %57, i8** %1, align 8
  store i8 %55, i8* %56, align 1
  br label %58

; <label>:58                                      ; preds = %52
  %59 = load i32* %n, align 4
  %60 = add nsw i32 %59, -1
  store i32 %60, i32* %n, align 4
  %61 = icmp sgt i32 %60, 0
  br i1 %61, label %10, label %62

; <label>:62                                      ; preds = %58
  br label %63

; <label>:63                                      ; preds = %62, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @initialize(i8* %arr, i32 %length) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %arr, i8** %1, align 8
  store i32 %length, i32* %2, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %19

; <label>:7                                       ; preds = %3
  %8 = load i32* %2, align 4
  %9 = load i32* %i, align 4
  %10 = sub nsw i32 %8, %9
  %11 = trunc i32 %10 to i8
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = load i8** %1, align 8
  %15 = getelementptr inbounds i8* %14, i64 %13
  store i8 %11, i8* %15, align 1
  br label %16

; <label>:16                                      ; preds = %7
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %3

; <label>:19                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
  call void @initialize(i8* getelementptr inbounds ([100 x i8]* @source, i32 0, i32 0), i32 100)
  call void @duffcopy(i8* getelementptr inbounds ([100 x i8]* @source, i32 0, i32 0), i8* getelementptr inbounds ([100 x i8]* @target, i32 0, i32 0), i32 43)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
