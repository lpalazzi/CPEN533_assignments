; ModuleID = 'bs.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DATA = type { i32, i32 }

@data = global [15 x %struct.DATA] [%struct.DATA { i32 1, i32 100 }, %struct.DATA { i32 5, i32 200 }, %struct.DATA { i32 6, i32 300 }, %struct.DATA { i32 7, i32 700 }, %struct.DATA { i32 8, i32 900 }, %struct.DATA { i32 9, i32 250 }, %struct.DATA { i32 10, i32 400 }, %struct.DATA { i32 11, i32 600 }, %struct.DATA { i32 12, i32 800 }, %struct.DATA { i32 13, i32 1500 }, %struct.DATA { i32 14, i32 1200 }, %struct.DATA { i32 15, i32 110 }, %struct.DATA { i32 16, i32 140 }, %struct.DATA { i32 17, i32 133 }, %struct.DATA { i32 18, i32 10 }], align 16
@.str = private unnamed_addr constant [9 x i8] c"FOUND!!\0A\00", align 1
@.str1 = private unnamed_addr constant [7 x i8] c"MID-1\0A\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"MID+1\0A\00", align 1
@cnt1 = common global i32 0, align 4
@.str3 = private unnamed_addr constant [17 x i8] c"Loop Count : %d\0A\00", align 1
@.str4 = private unnamed_addr constant [19 x i8] c"Return value : %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = call i32 @binary_search(i32 8)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @binary_search(i32 %x) #0 {
  %1 = alloca i32, align 4
  %fvalue = alloca i32, align 4
  %mid = alloca i32, align 4
  %up = alloca i32, align 4
  %low = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 0, i32* %low, align 4
  store i32 14, i32* %up, align 4
  store i32 -1, i32* %fvalue, align 4
  br label %2

; <label>:2                                       ; preds = %44, %0
  %3 = load i32* %low, align 4
  %4 = load i32* %up, align 4
  %5 = icmp sle i32 %3, %4
  br i1 %5, label %6, label %47

; <label>:6                                       ; preds = %2
  %7 = load i32* %low, align 4
  %8 = load i32* %up, align 4
  %9 = add nsw i32 %7, %8
  %10 = ashr i32 %9, 1
  store i32 %10, i32* %mid, align 4
  %11 = load i32* %mid, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [15 x %struct.DATA]* @data, i32 0, i64 %12
  %14 = getelementptr inbounds %struct.DATA* %13, i32 0, i32 0
  %15 = load i32* %14, align 4
  %16 = load i32* %1, align 4
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %18, label %27

; <label>:18                                      ; preds = %6
  %19 = load i32* %low, align 4
  %20 = sub nsw i32 %19, 1
  store i32 %20, i32* %up, align 4
  %21 = load i32* %mid, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [15 x %struct.DATA]* @data, i32 0, i64 %22
  %24 = getelementptr inbounds %struct.DATA* %23, i32 0, i32 1
  %25 = load i32* %24, align 4
  store i32 %25, i32* %fvalue, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %44

; <label>:27                                      ; preds = %6
  %28 = load i32* %mid, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [15 x %struct.DATA]* @data, i32 0, i64 %29
  %31 = getelementptr inbounds %struct.DATA* %30, i32 0, i32 0
  %32 = load i32* %31, align 4
  %33 = load i32* %1, align 4
  %34 = icmp sgt i32 %32, %33
  br i1 %34, label %35, label %39

; <label>:35                                      ; preds = %27
  %36 = load i32* %mid, align 4
  %37 = sub nsw i32 %36, 1
  store i32 %37, i32* %up, align 4
  %38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0))
  br label %43

; <label>:39                                      ; preds = %27
  %40 = load i32* %mid, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %low, align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0))
  br label %43

; <label>:43                                      ; preds = %39, %35
  br label %44

; <label>:44                                      ; preds = %43, %18
  %45 = load i32* @cnt1, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* @cnt1, align 4
  br label %2

; <label>:47                                      ; preds = %2
  %48 = load i32* @cnt1, align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str3, i32 0, i32 0), i32 %48)
  %50 = load i32* %fvalue, align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str4, i32 0, i32 0), i32 %50)
  %52 = load i32* %fvalue, align 4
  ret i32 %52
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
