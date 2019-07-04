; ModuleID = 'lms.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mu = global float 0x3F847AE140000000, align 4
@lms_rand.next = internal global i64 1, align 8
@main.d = internal global [201 x float] zeroinitializer, align 16
@main.b = internal global [21 x float] zeroinitializer, align 16
@lms.px = internal global [51 x float] zeroinitializer, align 16
@lms.sigma = internal global float 2.000000e+00, align 4
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@gaussian.ready = internal global i32 0, align 4
@gaussian.gstore = internal global float 0.000000e+00, align 4
@gaussian.rconst1 = internal global float 0x3F10000000000000, align 4
@gaussian.rconst2 = internal global float 1.638400e+04, align 4

; Function Attrs: nounwind uwtable
define i32 @lms_rand() #0 {
  %1 = load i64* @lms_rand.next, align 8
  %2 = mul i64 %1, 1103515245
  %3 = add i64 %2, 12345
  store i64 %3, i64* @lms_rand.next, align 8
  %4 = load i64* @lms_rand.next, align 8
  %5 = udiv i64 %4, 65536
  %6 = trunc i64 %5 to i32
  %7 = urem i32 %6, 32768
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %signal_amp = alloca float, align 4
  %noise_amp = alloca float, align 4
  %arg = alloca float, align 4
  %x = alloca float, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call float @lms_sqrt(double 2.000000e+00)
  store float %2, float* %signal_amp, align 4
  %3 = call float @lms_sqrt(double 1.200000e+01)
  %4 = fpext float %3 to double
  %5 = fmul double 2.000000e-01, %4
  %6 = fptrunc double %5 to float
  store float %6, float* %noise_amp, align 4
  store float 0x3FD41B2F80000000, float* %arg, align 4
  store i32 0, i32* %k, align 4
  br label %7

; <label>:7                                       ; preds = %26, %0
  %8 = load i32* %k, align 4
  %9 = icmp slt i32 %8, 201
  br i1 %9, label %10, label %29

; <label>:10                                      ; preds = %7
  %11 = load float* %signal_amp, align 4
  %12 = load float* %arg, align 4
  %13 = load i32* %k, align 4
  %14 = sitofp i32 %13 to float
  %15 = fmul float %12, %14
  %16 = fpext float %15 to double
  %17 = call float @lms_sin(double %16)
  %18 = fmul float %11, %17
  %19 = load float* %noise_amp, align 4
  %20 = call float @gaussian()
  %21 = fmul float %19, %20
  %22 = fadd float %18, %21
  %23 = load i32* %k, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [201 x float]* @main.d, i32 0, i64 %24
  store float %22, float* %25, align 4
  br label %26

; <label>:26                                      ; preds = %10
  %27 = load i32* %k, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %k, align 4
  br label %7

; <label>:29                                      ; preds = %7
  %30 = load float* @mu, align 4
  %31 = fpext float %30 to double
  %32 = fmul double 2.000000e+00, %31
  %33 = fdiv double %32, 2.100000e+01
  %34 = fptrunc double %33 to float
  store float %34, float* @mu, align 4
  store float 0.000000e+00, float* %x, align 4
  store i32 0, i32* %k, align 4
  br label %35

; <label>:35                                      ; preds = %50, %29
  %36 = load i32* %k, align 4
  %37 = icmp slt i32 %36, 201
  br i1 %37, label %38, label %53

; <label>:38                                      ; preds = %35
  %39 = load float* %x, align 4
  %40 = load i32* %k, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [201 x float]* @main.d, i32 0, i64 %41
  %43 = load float* %42, align 4
  %44 = load float* @mu, align 4
  %45 = call float @lms(float %39, float %43, float* getelementptr inbounds ([21 x float]* @main.b, i32 0, i32 0), i32 20, float %44, float 0x3F847AE140000000)
  %46 = load i32* %k, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [201 x float]* @main.d, i32 0, i64 %47
  %49 = load float* %48, align 4
  store float %49, float* %x, align 4
  br label %50

; <label>:50                                      ; preds = %38
  %51 = load i32* %k, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %k, align 4
  br label %35

; <label>:53                                      ; preds = %35
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal float @lms_sqrt(double) #0 {
  %2 = alloca float, align 4
  %x = alloca float, align 4
  %dx = alloca float, align 4
  %diff = alloca double, align 8
  %min_tol = alloca double, align 8
  %i = alloca i32, align 4
  %flag = alloca i32, align 4
  %val = fptrunc double %0 to float
  store float %val, float* %2, align 4
  %3 = load float* %2, align 4
  %4 = fdiv float %3, 1.000000e+01
  store float %4, float* %x, align 4
  store double 1.000000e-05, double* %min_tol, align 8
  store i32 0, i32* %flag, align 4
  %5 = load float* %2, align 4
  %6 = fcmp oeq float %5, 0.000000e+00
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %1
  store float 0.000000e+00, float* %x, align 4
  br label %50

; <label>:8                                       ; preds = %1
  store i32 1, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %46, %8
  %10 = load i32* %i, align 4
  %11 = icmp slt i32 %10, 20
  br i1 %11, label %12, label %49

; <label>:12                                      ; preds = %9
  %13 = load i32* %flag, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %44, label %15

; <label>:15                                      ; preds = %12
  %16 = load float* %2, align 4
  %17 = load float* %x, align 4
  %18 = load float* %x, align 4
  %19 = fmul float %17, %18
  %20 = fsub float %16, %19
  %21 = fpext float %20 to double
  %22 = load float* %x, align 4
  %23 = fpext float %22 to double
  %24 = fmul double 2.000000e+00, %23
  %25 = fdiv double %21, %24
  %26 = fptrunc double %25 to float
  store float %26, float* %dx, align 4
  %27 = load float* %x, align 4
  %28 = load float* %dx, align 4
  %29 = fadd float %27, %28
  store float %29, float* %x, align 4
  %30 = load float* %2, align 4
  %31 = load float* %x, align 4
  %32 = load float* %x, align 4
  %33 = fmul float %31, %32
  %34 = fsub float %30, %33
  %35 = fpext float %34 to double
  store double %35, double* %diff, align 8
  %36 = load double* %diff, align 8
  %37 = fptrunc double %36 to float
  %38 = call float @lms_fabs(float %37)
  %39 = fpext float %38 to double
  %40 = load double* %min_tol, align 8
  %41 = fcmp ole double %39, %40
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %15
  store i32 1, i32* %flag, align 4
  br label %43

; <label>:43                                      ; preds = %42, %15
  br label %45

; <label>:44                                      ; preds = %12
  br label %45

; <label>:45                                      ; preds = %44, %43
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %9

; <label>:49                                      ; preds = %9
  br label %50

; <label>:50                                      ; preds = %49, %7
  %51 = load float* %x, align 4
  ret float %51
}

; Function Attrs: nounwind uwtable
define internal float @lms_sin(double) #0 {
  %2 = alloca float, align 4
  %app = alloca float, align 4
  %diff = alloca float, align 4
  %inc = alloca i32, align 4
  %rad = fptrunc double %0 to float
  store float %rad, float* %2, align 4
  store i32 1, i32* %inc, align 4
  br label %3

; <label>:3                                       ; preds = %7, %1
  %4 = load float* %2, align 4
  %5 = fpext float %4 to double
  %6 = fcmp ogt double %5, 0x401921FB54442D18
  br i1 %6, label %7, label %12

; <label>:7                                       ; preds = %3
  %8 = load float* %2, align 4
  %9 = fpext float %8 to double
  %10 = fsub double %9, 0x401921FB54442D18
  %11 = fptrunc double %10 to float
  store float %11, float* %2, align 4
  br label %3

; <label>:12                                      ; preds = %3
  br label %13

; <label>:13                                      ; preds = %17, %12
  %14 = load float* %2, align 4
  %15 = fpext float %14 to double
  %16 = fcmp olt double %15, 0xC01921FB54442D18
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %13
  %18 = load float* %2, align 4
  %19 = fpext float %18 to double
  %20 = fadd double %19, 0x401921FB54442D18
  %21 = fptrunc double %20 to float
  store float %21, float* %2, align 4
  br label %13

; <label>:22                                      ; preds = %13
  %23 = load float* %2, align 4
  store float %23, float* %diff, align 4
  store float %23, float* %app, align 4
  %24 = load float* %diff, align 4
  %25 = load float* %2, align 4
  %26 = load float* %2, align 4
  %27 = fmul float %25, %26
  %28 = fsub float -0.000000e+00, %27
  %29 = fmul float %24, %28
  %30 = fpext float %29 to double
  %31 = load i32* %inc, align 4
  %32 = sitofp i32 %31 to double
  %33 = fmul double 2.000000e+00, %32
  %34 = load i32* %inc, align 4
  %35 = sitofp i32 %34 to double
  %36 = fmul double 2.000000e+00, %35
  %37 = fadd double %36, 1.000000e+00
  %38 = fmul double %33, %37
  %39 = fdiv double %30, %38
  %40 = fptrunc double %39 to float
  store float %40, float* %diff, align 4
  %41 = load float* %app, align 4
  %42 = load float* %diff, align 4
  %43 = fadd float %41, %42
  store float %43, float* %app, align 4
  %44 = load i32* %inc, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %inc, align 4
  br label %46

; <label>:46                                      ; preds = %51, %22
  %47 = load float* %diff, align 4
  %48 = call float @lms_fabs(float %47)
  %49 = fpext float %48 to double
  %50 = fcmp oge double %49, 1.000000e-05
  br i1 %50, label %51, label %74

; <label>:51                                      ; preds = %46
  %52 = load float* %diff, align 4
  %53 = load float* %2, align 4
  %54 = load float* %2, align 4
  %55 = fmul float %53, %54
  %56 = fsub float -0.000000e+00, %55
  %57 = fmul float %52, %56
  %58 = fpext float %57 to double
  %59 = load i32* %inc, align 4
  %60 = sitofp i32 %59 to double
  %61 = fmul double 2.000000e+00, %60
  %62 = load i32* %inc, align 4
  %63 = sitofp i32 %62 to double
  %64 = fmul double 2.000000e+00, %63
  %65 = fadd double %64, 1.000000e+00
  %66 = fmul double %61, %65
  %67 = fdiv double %58, %66
  %68 = fptrunc double %67 to float
  store float %68, float* %diff, align 4
  %69 = load float* %app, align 4
  %70 = load float* %diff, align 4
  %71 = fadd float %69, %70
  store float %71, float* %app, align 4
  %72 = load i32* %inc, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %inc, align 4
  br label %46

; <label>:74                                      ; preds = %46
  %75 = load float* %app, align 4
  ret float %75
}

; Function Attrs: nounwind uwtable
define internal float @gaussian() #0 {
  %v1 = alloca float, align 4
  %v2 = alloca float, align 4
  %r = alloca float, align 4
  %fac = alloca float, align 4
  %gaus = alloca float, align 4
  %1 = load i32* @gaussian.ready, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %65

; <label>:3                                       ; preds = %0
  %4 = call i32 @lms_rand()
  %5 = sitofp i32 %4 to float
  %6 = load float* @gaussian.rconst2, align 4
  %7 = fsub float %5, %6
  store float %7, float* %v1, align 4
  %8 = call i32 @lms_rand()
  %9 = sitofp i32 %8 to float
  %10 = load float* @gaussian.rconst2, align 4
  %11 = fsub float %9, %10
  store float %11, float* %v2, align 4
  %12 = load float* @gaussian.rconst1, align 4
  %13 = load float* %v1, align 4
  %14 = fmul float %13, %12
  store float %14, float* %v1, align 4
  %15 = load float* @gaussian.rconst1, align 4
  %16 = load float* %v2, align 4
  %17 = fmul float %16, %15
  store float %17, float* %v2, align 4
  %18 = load float* %v1, align 4
  %19 = load float* %v1, align 4
  %20 = fmul float %18, %19
  %21 = load float* %v2, align 4
  %22 = load float* %v2, align 4
  %23 = fmul float %21, %22
  %24 = fadd float %20, %23
  store float %24, float* %r, align 4
  br label %25

; <label>:25                                      ; preds = %28, %3
  %26 = load float* %r, align 4
  %27 = fcmp ogt float %26, 1.000000e+00
  br i1 %27, label %28, label %50

; <label>:28                                      ; preds = %25
  %29 = call i32 @lms_rand()
  %30 = sitofp i32 %29 to float
  %31 = load float* @gaussian.rconst2, align 4
  %32 = fsub float %30, %31
  store float %32, float* %v1, align 4
  %33 = call i32 @lms_rand()
  %34 = sitofp i32 %33 to float
  %35 = load float* @gaussian.rconst2, align 4
  %36 = fsub float %34, %35
  store float %36, float* %v2, align 4
  %37 = load float* @gaussian.rconst1, align 4
  %38 = load float* %v1, align 4
  %39 = fmul float %38, %37
  store float %39, float* %v1, align 4
  %40 = load float* @gaussian.rconst1, align 4
  %41 = load float* %v2, align 4
  %42 = fmul float %41, %40
  store float %42, float* %v2, align 4
  %43 = load float* %v1, align 4
  %44 = load float* %v1, align 4
  %45 = fmul float %43, %44
  %46 = load float* %v2, align 4
  %47 = load float* %v2, align 4
  %48 = fmul float %46, %47
  %49 = fadd float %45, %48
  store float %49, float* %r, align 4
  br label %25

; <label>:50                                      ; preds = %25
  %51 = load float* %r, align 4
  %52 = fpext float %51 to double
  %53 = call float @lms_log(double %52)
  %54 = fmul float -2.000000e+00, %53
  %55 = load float* %r, align 4
  %56 = fdiv float %54, %55
  %57 = fpext float %56 to double
  %58 = call float @lms_sqrt(double %57)
  store float %58, float* %fac, align 4
  %59 = load float* %v1, align 4
  %60 = load float* %fac, align 4
  %61 = fmul float %59, %60
  store float %61, float* @gaussian.gstore, align 4
  %62 = load float* %v2, align 4
  %63 = load float* %fac, align 4
  %64 = fmul float %62, %63
  store float %64, float* %gaus, align 4
  store i32 1, i32* @gaussian.ready, align 4
  br label %67

; <label>:65                                      ; preds = %0
  store i32 0, i32* @gaussian.ready, align 4
  %66 = load float* @gaussian.gstore, align 4
  store float %66, float* %gaus, align 4
  br label %67

; <label>:67                                      ; preds = %65, %50
  %68 = load float* %gaus, align 4
  ret float %68
}

; Function Attrs: nounwind uwtable
define float @lms(float %x, float %d, float* %b, i32 %l, float %mu, float %alpha) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %ll = alloca i32, align 4
  %e = alloca float, align 4
  %mu_e = alloca float, align 4
  %y = alloca float, align 4
  store float %x, float* %1, align 4
  store float %d, float* %2, align 4
  store float* %b, float** %3, align 8
  store i32 %l, i32* %4, align 4
  store float %mu, float* %5, align 4
  store float %alpha, float* %6, align 4
  %7 = load float* %1, align 4
  store float %7, float* getelementptr inbounds ([51 x float]* @lms.px, i32 0, i64 0), align 4
  %8 = load float** %3, align 8
  %9 = getelementptr inbounds float* %8, i64 0
  %10 = load float* %9, align 4
  %11 = load float* getelementptr inbounds ([51 x float]* @lms.px, i32 0, i64 0), align 4
  %12 = fmul float %10, %11
  store float %12, float* %y, align 4
  store i32 1, i32* %ll, align 4
  br label %13

; <label>:13                                      ; preds = %30, %0
  %14 = load i32* %ll, align 4
  %15 = load i32* %4, align 4
  %16 = icmp sle i32 %14, %15
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %13
  %18 = load float* %y, align 4
  %19 = load i32* %ll, align 4
  %20 = sext i32 %19 to i64
  %21 = load float** %3, align 8
  %22 = getelementptr inbounds float* %21, i64 %20
  %23 = load float* %22, align 4
  %24 = load i32* %ll, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [51 x float]* @lms.px, i32 0, i64 %25
  %27 = load float* %26, align 4
  %28 = fmul float %23, %27
  %29 = fadd float %18, %28
  store float %29, float* %y, align 4
  br label %30

; <label>:30                                      ; preds = %17
  %31 = load i32* %ll, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %ll, align 4
  br label %13

; <label>:33                                      ; preds = %13
  %34 = load float* %2, align 4
  %35 = load float* %y, align 4
  %36 = fsub float %34, %35
  store float %36, float* %e, align 4
  %37 = load float* %6, align 4
  %38 = load float* getelementptr inbounds ([51 x float]* @lms.px, i32 0, i64 0), align 4
  %39 = load float* getelementptr inbounds ([51 x float]* @lms.px, i32 0, i64 0), align 4
  %40 = fmul float %38, %39
  %41 = fmul float %37, %40
  %42 = load float* %6, align 4
  %43 = fsub float 1.000000e+00, %42
  %44 = load float* @lms.sigma, align 4
  %45 = fmul float %43, %44
  %46 = fadd float %41, %45
  store float %46, float* @lms.sigma, align 4
  %47 = load float* %5, align 4
  %48 = load float* %e, align 4
  %49 = fmul float %47, %48
  %50 = load float* @lms.sigma, align 4
  %51 = fdiv float %49, %50
  store float %51, float* %mu_e, align 4
  store i32 0, i32* %ll, align 4
  br label %52

; <label>:52                                      ; preds = %73, %33
  %53 = load i32* %ll, align 4
  %54 = load i32* %4, align 4
  %55 = icmp sle i32 %53, %54
  br i1 %55, label %56, label %76

; <label>:56                                      ; preds = %52
  %57 = load i32* %ll, align 4
  %58 = sext i32 %57 to i64
  %59 = load float** %3, align 8
  %60 = getelementptr inbounds float* %59, i64 %58
  %61 = load float* %60, align 4
  %62 = load float* %mu_e, align 4
  %63 = load i32* %ll, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [51 x float]* @lms.px, i32 0, i64 %64
  %66 = load float* %65, align 4
  %67 = fmul float %62, %66
  %68 = fadd float %61, %67
  %69 = load i32* %ll, align 4
  %70 = sext i32 %69 to i64
  %71 = load float** %3, align 8
  %72 = getelementptr inbounds float* %71, i64 %70
  store float %68, float* %72, align 4
  br label %73

; <label>:73                                      ; preds = %56
  %74 = load i32* %ll, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %ll, align 4
  br label %52

; <label>:76                                      ; preds = %52
  %77 = load i32* %4, align 4
  store i32 %77, i32* %ll, align 4
  br label %78

; <label>:78                                      ; preds = %90, %76
  %79 = load i32* %ll, align 4
  %80 = icmp sge i32 %79, 1
  br i1 %80, label %81, label %93

; <label>:81                                      ; preds = %78
  %82 = load i32* %ll, align 4
  %83 = sub nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [51 x float]* @lms.px, i32 0, i64 %84
  %86 = load float* %85, align 4
  %87 = load i32* %ll, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [51 x float]* @lms.px, i32 0, i64 %88
  store float %86, float* %89, align 4
  br label %90

; <label>:90                                      ; preds = %81
  %91 = load i32* %ll, align 4
  %92 = add nsw i32 %91, -1
  store i32 %92, i32* %ll, align 4
  br label %78

; <label>:93                                      ; preds = %78
  %94 = load float* %y, align 4
  %95 = fpext float %94 to double
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %95)
  %97 = load float* %y, align 4
  ret float %97
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal float @lms_log(double) #0 {
  %2 = alloca float, align 4
  %r = fptrunc double %0 to float
  store float %r, float* %2, align 4
  ret float 4.500000e+00
}

; Function Attrs: nounwind uwtable
define internal float @lms_fabs(float %n) #0 {
  %1 = alloca float, align 4
  %f = alloca float, align 4
  store float %n, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fcmp oge float %2, 0.000000e+00
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load float* %1, align 4
  store float %5, float* %f, align 4
  br label %9

; <label>:6                                       ; preds = %0
  %7 = load float* %1, align 4
  %8 = fsub float -0.000000e+00, %7
  store float %8, float* %f, align 4
  br label %9

; <label>:9                                       ; preds = %6, %4
  %10 = load float* %f, align 4
  ret float %10
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
