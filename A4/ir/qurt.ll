; ModuleID = 'qurt.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [3 x double] zeroinitializer, align 16
@flag = common global i32 0, align 4
@x1 = common global [2 x double] zeroinitializer, align 16
@x2 = common global [2 x double] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define double @qurt_fabs(double %n) #0 {
  %1 = alloca double, align 8
  %f = alloca double, align 8
  store double %n, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fcmp oge double %2, 0.000000e+00
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load double* %1, align 8
  store double %5, double* %f, align 8
  br label %9

; <label>:6                                       ; preds = %0
  %7 = load double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %f, align 8
  br label %9

; <label>:9                                       ; preds = %6, %4
  %10 = load double* %f, align 8
  ret double %10
}

; Function Attrs: nounwind uwtable
define double @qurt_sqrt(double %val) #0 {
  %1 = alloca double, align 8
  %x = alloca double, align 8
  %dx = alloca double, align 8
  %diff = alloca double, align 8
  %min_tol = alloca double, align 8
  %i = alloca i32, align 4
  %flag = alloca i32, align 4
  store double %val, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fdiv double %2, 1.000000e+01
  store double %3, double* %x, align 8
  store double 1.000000e-05, double* %min_tol, align 8
  store i32 0, i32* %flag, align 4
  %4 = load double* %1, align 8
  %5 = fcmp oeq double %4, 0.000000e+00
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store double 0.000000e+00, double* %x, align 8
  br label %43

; <label>:7                                       ; preds = %0
  store i32 1, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %39, %7
  %9 = load i32* %i, align 4
  %10 = icmp slt i32 %9, 20
  br i1 %10, label %11, label %42

; <label>:11                                      ; preds = %8
  %12 = load i32* %flag, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %37, label %14

; <label>:14                                      ; preds = %11
  %15 = load double* %1, align 8
  %16 = load double* %x, align 8
  %17 = load double* %x, align 8
  %18 = fmul double %16, %17
  %19 = fsub double %15, %18
  %20 = load double* %x, align 8
  %21 = fmul double 2.000000e+00, %20
  %22 = fdiv double %19, %21
  store double %22, double* %dx, align 8
  %23 = load double* %x, align 8
  %24 = load double* %dx, align 8
  %25 = fadd double %23, %24
  store double %25, double* %x, align 8
  %26 = load double* %1, align 8
  %27 = load double* %x, align 8
  %28 = load double* %x, align 8
  %29 = fmul double %27, %28
  %30 = fsub double %26, %29
  store double %30, double* %diff, align 8
  %31 = load double* %diff, align 8
  %32 = call double @qurt_fabs(double %31)
  %33 = load double* %min_tol, align 8
  %34 = fcmp ole double %32, %33
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %14
  store i32 1, i32* %flag, align 4
  br label %36

; <label>:36                                      ; preds = %35, %14
  br label %38

; <label>:37                                      ; preds = %11
  br label %38

; <label>:38                                      ; preds = %37, %36
  br label %39

; <label>:39                                      ; preds = %38
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  br label %8

; <label>:42                                      ; preds = %8
  br label %43

; <label>:43                                      ; preds = %42, %6
  %44 = load double* %x, align 8
  ret double %44
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store double 1.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 0), align 8
  store double -3.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  store double 2.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 2), align 8
  %2 = call i32 @qurt()
  store double 1.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 0), align 8
  store double -2.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  store double 1.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 2), align 8
  %3 = call i32 @qurt()
  store double 1.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 0), align 8
  store double -4.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  store double 8.000000e+00, double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 2), align 8
  %4 = call i32 @qurt()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @qurt() #0 {
  %1 = alloca i32, align 4
  %d = alloca double, align 8
  %w1 = alloca double, align 8
  %w2 = alloca double, align 8
  %2 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 0), align 8
  %3 = fcmp oeq double %2, 0.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 999, i32* %1
  br label %55

; <label>:5                                       ; preds = %0
  %6 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  %7 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  %8 = fmul double %6, %7
  %9 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 0), align 8
  %10 = fmul double 4.000000e+00, %9
  %11 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 2), align 8
  %12 = fmul double %10, %11
  %13 = fsub double %8, %12
  store double %13, double* %d, align 8
  %14 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 0), align 8
  %15 = fmul double 2.000000e+00, %14
  store double %15, double* %w1, align 8
  %16 = load double* %d, align 8
  %17 = call double @qurt_fabs(double %16)
  %18 = call double @qurt_sqrt(double %17)
  store double %18, double* %w2, align 8
  %19 = load double* %d, align 8
  %20 = fcmp ogt double %19, 0.000000e+00
  br i1 %20, label %21, label %34

; <label>:21                                      ; preds = %5
  store i32 1, i32* @flag, align 4
  %22 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  %23 = fsub double -0.000000e+00, %22
  %24 = load double* %w2, align 8
  %25 = fadd double %23, %24
  %26 = load double* %w1, align 8
  %27 = fdiv double %25, %26
  store double %27, double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 0), align 8
  store double 0.000000e+00, double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 1), align 8
  %28 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  %29 = fsub double -0.000000e+00, %28
  %30 = load double* %w2, align 8
  %31 = fsub double %29, %30
  %32 = load double* %w1, align 8
  %33 = fdiv double %31, %32
  store double %33, double* getelementptr inbounds ([2 x double]* @x2, i32 0, i64 0), align 8
  store double 0.000000e+00, double* getelementptr inbounds ([2 x double]* @x2, i32 0, i64 1), align 8
  store i32 0, i32* %1
  br label %55

; <label>:34                                      ; preds = %5
  %35 = load double* %d, align 8
  %36 = fcmp oeq double %35, 0.000000e+00
  br i1 %36, label %37, label %43

; <label>:37                                      ; preds = %34
  store i32 0, i32* @flag, align 4
  %38 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  %39 = fsub double -0.000000e+00, %38
  %40 = load double* %w1, align 8
  %41 = fdiv double %39, %40
  store double %41, double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 0), align 8
  store double 0.000000e+00, double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 1), align 8
  %42 = load double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 0), align 8
  store double %42, double* getelementptr inbounds ([2 x double]* @x2, i32 0, i64 0), align 8
  store double 0.000000e+00, double* getelementptr inbounds ([2 x double]* @x2, i32 0, i64 1), align 8
  store i32 0, i32* %1
  br label %55

; <label>:43                                      ; preds = %34
  store i32 -1, i32* @flag, align 4
  %44 = load double* %w1, align 8
  %45 = load double* %w2, align 8
  %46 = fdiv double %45, %44
  store double %46, double* %w2, align 8
  %47 = load double* getelementptr inbounds ([3 x double]* @a, i32 0, i64 1), align 8
  %48 = fsub double -0.000000e+00, %47
  %49 = load double* %w1, align 8
  %50 = fdiv double %48, %49
  store double %50, double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 0), align 8
  %51 = load double* %w2, align 8
  store double %51, double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 1), align 8
  %52 = load double* getelementptr inbounds ([2 x double]* @x1, i32 0, i64 0), align 8
  store double %52, double* getelementptr inbounds ([2 x double]* @x2, i32 0, i64 0), align 8
  %53 = load double* %w2, align 8
  %54 = fsub double -0.000000e+00, %53
  store double %54, double* getelementptr inbounds ([2 x double]* @x2, i32 0, i64 1), align 8
  store i32 0, i32* %1
  br label %55

; <label>:55                                      ; preds = %43, %37, %21, %4
  %56 = load i32* %1
  ret i32 %56
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
