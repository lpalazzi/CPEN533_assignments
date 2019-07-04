; ModuleID = 'insertsort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [11 x i32] zeroinitializer, align 16
@cnt1 = common global i32 0, align 4
@cnt2 = common global i32 0, align 4
@.str = private unnamed_addr constant [23 x i8] c"Inner Loop Counts: %d\0A\00", align 1
@.str1 = private unnamed_addr constant [36 x i8] c"Outer Loop : %d ,  Inner Loop : %d\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  %loop = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 0), align 4
  store i32 11, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 1), align 4
  store i32 10, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 2), align 4
  store i32 9, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 3), align 4
  store i32 8, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 4), align 4
  store i32 7, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 5), align 4
  store i32 6, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 6), align 4
  store i32 5, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 7), align 4
  store i32 4, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 8), align 4
  store i32 3, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 9), align 4
  store i32 2, i32* getelementptr inbounds ([11 x i32]* @a, i32 0, i64 10), align 4
  store i32 2, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %42, %0
  %3 = load i32* %i, align 4
  %4 = icmp sle i32 %3, 10
  br i1 %4, label %5, label %47

; <label>:5                                       ; preds = %2
  %6 = load i32* @cnt1, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @cnt1, align 4
  %8 = load i32* %i, align 4
  store i32 %8, i32* %j, align 4
  store i32 0, i32* @cnt2, align 4
  br label %9

; <label>:9                                       ; preds = %20, %5
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = load i32* %j, align 4
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = icmp ult i32 %13, %18
  br i1 %19, label %20, label %42

; <label>:20                                      ; preds = %9
  %21 = load i32* @cnt2, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* @cnt2, align 4
  %23 = load i32* %j, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %24
  %26 = load i32* %25, align 4
  store i32 %26, i32* %temp, align 4
  %27 = load i32* %j, align 4
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %29
  %31 = load i32* %30, align 4
  %32 = load i32* %j, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %33
  store i32 %31, i32* %34, align 4
  %35 = load i32* %temp, align 4
  %36 = load i32* %j, align 4
  %37 = sub nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %38
  store i32 %35, i32* %39, align 4
  %40 = load i32* %j, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, i32* %j, align 4
  br label %9

; <label>:42                                      ; preds = %9
  %43 = load i32* @cnt2, align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %43)
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %2

; <label>:47                                      ; preds = %2
  %48 = load i32* @cnt1, align 4
  %49 = load i32* @cnt2, align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str1, i32 0, i32 0), i32 %48, i32 %49)
  store i32 0, i32* %loop, align 4
  br label %51

; <label>:51                                      ; preds = %60, %47
  %52 = load i32* %loop, align 4
  %53 = icmp slt i32 %52, 10
  br i1 %53, label %54, label %63

; <label>:54                                      ; preds = %51
  %55 = load i32* %loop, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [11 x i32]* @a, i32 0, i64 %56
  %58 = load i32* %57, align 4
  %59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %58)
  br label %60

; <label>:60                                      ; preds = %54
  %61 = load i32* %loop, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %loop, align 4
  br label %51

; <label>:63                                      ; preds = %51
  ret i32 1
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
