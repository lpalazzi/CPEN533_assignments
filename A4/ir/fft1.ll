; ModuleID = 'fft1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ai = global [8 x double] zeroinitializer, align 16
@ar = common global [8 x double] zeroinitializer, align 16
@.str = private unnamed_addr constant [9 x i8] c"iter=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"xp2=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"j2=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @main() #0 {
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %flag = alloca i32, align 4
  %chkerr = alloca i32, align 4
  store i32 8, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %16, %0
  %2 = load i32* %i, align 4
  %3 = load i32* %n, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %19

; <label>:5                                       ; preds = %1
  %6 = load i32* %i, align 4
  %7 = sitofp i32 %6 to double
  %8 = fmul double 6.283180e+00, %7
  %9 = load i32* %n, align 4
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %8, %10
  %12 = call double @cos(double %11)
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %14
  store double %12, double* %15, align 8
  br label %16

; <label>:16                                      ; preds = %5
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %1

; <label>:19                                      ; preds = %1
  store i32 0, i32* %flag, align 4
  %20 = load i32* %n, align 4
  %21 = load i32* %flag, align 4
  %22 = call i32 @fft1(i32 %20, i32 %21)
  store i32 %22, i32* %chkerr, align 4
  store i32 1, i32* %flag, align 4
  %23 = load i32* %n, align 4
  %24 = load i32* %flag, align 4
  %25 = call i32 @fft1(i32 %23, i32 %24)
  store i32 %25, i32* %chkerr, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal double @cos(double %rad) #0 {
  %1 = alloca double, align 8
  store double %rad, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fsub double 1.570795e+00, %2
  %4 = call double @sin(double %3) #2
  ret double %4
}

; Function Attrs: nounwind uwtable
define i32 @fft1(i32 %n, i32 %flag) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %it = alloca i32, align 4
  %xp = alloca i32, align 4
  %xp2 = alloca i32, align 4
  %j1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %iter = alloca i32, align 4
  %sign = alloca double, align 8
  %w = alloca double, align 8
  %wr = alloca double, align 8
  %wi = alloca double, align 8
  %dr1 = alloca double, align 8
  %dr2 = alloca double, align 8
  %di1 = alloca double, align 8
  %di2 = alloca double, align 8
  %tr = alloca double, align 8
  %ti = alloca double, align 8
  %arg = alloca double, align 8
  store i32 %n, i32* %2, align 4
  store i32 %flag, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 999, i32* %1
  br label %249

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = sitofp i32 %8 to double
  %10 = call double @log(double %9)
  %11 = call double @log(double 2.000000e+00)
  %12 = fdiv double %10, %11
  %13 = fptosi double %12 to i32
  store i32 %13, i32* %iter, align 4
  store i32 1, i32* %j, align 4
  %14 = load i32* %iter, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %14)
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %23, %7
  %17 = load i32* %i, align 4
  %18 = load i32* %iter, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %16
  %21 = load i32* %j, align 4
  %22 = mul nsw i32 %21, 2
  store i32 %22, i32* %j, align 4
  br label %23

; <label>:23                                      ; preds = %20
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %16

; <label>:26                                      ; preds = %16
  %27 = load i32* %2, align 4
  %28 = load i32* %j, align 4
  %29 = sub nsw i32 %27, %28
  %30 = sitofp i32 %29 to double
  %31 = call double @fabs(double %30)
  %32 = fcmp ogt double %31, 1.000000e-06
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %26
  store i32 1, i32* %1
  br label %249

; <label>:34                                      ; preds = %26
  %35 = load i32* %3, align 4
  %36 = icmp eq i32 %35, 1
  %37 = select i1 %36, double 1.000000e+00, double -1.000000e+00
  store double %37, double* %sign, align 8
  %38 = load i32* %2, align 4
  store i32 %38, i32* %xp2, align 4
  store i32 0, i32* %it, align 4
  br label %39

; <label>:39                                      ; preds = %145, %34
  %40 = load i32* %it, align 4
  %41 = load i32* %iter, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %148

; <label>:43                                      ; preds = %39
  %44 = load i32* %xp2, align 4
  store i32 %44, i32* %xp, align 4
  %45 = load i32* %xp2, align 4
  %46 = sdiv i32 %45, 2
  store i32 %46, i32* %xp2, align 4
  %47 = load i32* %xp2, align 4
  %48 = sitofp i32 %47 to double
  %49 = fdiv double 3.141590e+00, %48
  store double %49, double* %w, align 8
  %50 = load i32* %xp2, align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %50)
  store i32 0, i32* %k, align 4
  br label %52

; <label>:52                                      ; preds = %141, %43
  %53 = load i32* %k, align 4
  %54 = load i32* %xp2, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %144

; <label>:56                                      ; preds = %52
  %57 = load i32* %k, align 4
  %58 = sitofp i32 %57 to double
  %59 = load double* %w, align 8
  %60 = fmul double %58, %59
  store double %60, double* %arg, align 8
  %61 = load double* %arg, align 8
  %62 = call double @cos(double %61)
  store double %62, double* %wr, align 8
  %63 = load double* %sign, align 8
  %64 = load double* %arg, align 8
  %65 = call double @sin(double %64)
  %66 = fmul double %63, %65
  store double %66, double* %wi, align 8
  %67 = load i32* %k, align 4
  %68 = load i32* %xp, align 4
  %69 = sub nsw i32 %67, %68
  store i32 %69, i32* %i, align 4
  %70 = load i32* %xp, align 4
  store i32 %70, i32* %j, align 4
  br label %71

; <label>:71                                      ; preds = %136, %56
  %72 = load i32* %j, align 4
  %73 = load i32* %2, align 4
  %74 = icmp sle i32 %72, %73
  br i1 %74, label %75, label %140

; <label>:75                                      ; preds = %71
  %76 = load i32* %j, align 4
  %77 = load i32* %i, align 4
  %78 = add nsw i32 %76, %77
  store i32 %78, i32* %j1, align 4
  %79 = load i32* %j1, align 4
  %80 = load i32* %xp2, align 4
  %81 = add nsw i32 %79, %80
  store i32 %81, i32* %j2, align 4
  %82 = load i32* %j1, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %83
  %85 = load double* %84, align 8
  store double %85, double* %dr1, align 8
  %86 = load i32* %j2, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %87
  %89 = load double* %88, align 8
  store double %89, double* %dr2, align 8
  %90 = load i32* %j1, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %91
  %93 = load double* %92, align 8
  store double %93, double* %di1, align 8
  %94 = load i32* %j2, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %95
  %97 = load double* %96, align 8
  store double %97, double* %di2, align 8
  %98 = load double* %dr1, align 8
  %99 = load double* %dr2, align 8
  %100 = fsub double %98, %99
  store double %100, double* %tr, align 8
  %101 = load double* %di1, align 8
  %102 = load double* %di2, align 8
  %103 = fsub double %101, %102
  store double %103, double* %ti, align 8
  %104 = load double* %dr1, align 8
  %105 = load double* %dr2, align 8
  %106 = fadd double %104, %105
  %107 = load i32* %j1, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %108
  store double %106, double* %109, align 8
  %110 = load double* %di1, align 8
  %111 = load double* %di2, align 8
  %112 = fadd double %110, %111
  %113 = load i32* %j1, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %114
  store double %112, double* %115, align 8
  %116 = load double* %tr, align 8
  %117 = load double* %wr, align 8
  %118 = fmul double %116, %117
  %119 = load double* %ti, align 8
  %120 = load double* %wi, align 8
  %121 = fmul double %119, %120
  %122 = fsub double %118, %121
  %123 = load i32* %j2, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %124
  store double %122, double* %125, align 8
  %126 = load double* %ti, align 8
  %127 = load double* %wr, align 8
  %128 = fmul double %126, %127
  %129 = load double* %tr, align 8
  %130 = load double* %wi, align 8
  %131 = fmul double %129, %130
  %132 = fadd double %128, %131
  %133 = load i32* %j2, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %134
  store double %132, double* %135, align 8
  br label %136

; <label>:136                                     ; preds = %75
  %137 = load i32* %xp, align 4
  %138 = load i32* %j, align 4
  %139 = add nsw i32 %138, %137
  store i32 %139, i32* %j, align 4
  br label %71

; <label>:140                                     ; preds = %71
  br label %141

; <label>:141                                     ; preds = %140
  %142 = load i32* %k, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %k, align 4
  br label %52

; <label>:144                                     ; preds = %52
  br label %145

; <label>:145                                     ; preds = %144
  %146 = load i32* %it, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %it, align 4
  br label %39

; <label>:148                                     ; preds = %39
  %149 = load i32* %2, align 4
  %150 = sdiv i32 %149, 2
  store i32 %150, i32* %j1, align 4
  %151 = load i32* %2, align 4
  %152 = sub nsw i32 %151, 1
  store i32 %152, i32* %j2, align 4
  store i32 1, i32* %j, align 4
  %153 = load i32* %j2, align 4
  %154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), i32 %153)
  store i32 1, i32* %i, align 4
  br label %155

; <label>:155                                     ; preds = %218, %148
  %156 = load i32* %i, align 4
  %157 = load i32* %j2, align 4
  %158 = icmp sle i32 %156, %157
  br i1 %158, label %159, label %221

; <label>:159                                     ; preds = %155
  %160 = load i32* %i, align 4
  %161 = load i32* %j, align 4
  %162 = icmp slt i32 %160, %161
  br i1 %162, label %163, label %202

; <label>:163                                     ; preds = %159
  %164 = load i32* %j, align 4
  %165 = sub nsw i32 %164, 1
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %166
  %168 = load double* %167, align 8
  store double %168, double* %tr, align 8
  %169 = load i32* %j, align 4
  %170 = sub nsw i32 %169, 1
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %171
  %173 = load double* %172, align 8
  store double %173, double* %ti, align 8
  %174 = load i32* %i, align 4
  %175 = sub nsw i32 %174, 1
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %176
  %178 = load double* %177, align 8
  %179 = load i32* %j, align 4
  %180 = sub nsw i32 %179, 1
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %181
  store double %178, double* %182, align 8
  %183 = load i32* %i, align 4
  %184 = sub nsw i32 %183, 1
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %185
  %187 = load double* %186, align 8
  %188 = load i32* %j, align 4
  %189 = sub nsw i32 %188, 1
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %190
  store double %187, double* %191, align 8
  %192 = load double* %tr, align 8
  %193 = load i32* %i, align 4
  %194 = sub nsw i32 %193, 1
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %195
  store double %192, double* %196, align 8
  %197 = load double* %ti, align 8
  %198 = load i32* %i, align 4
  %199 = sub nsw i32 %198, 1
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %200
  store double %197, double* %201, align 8
  br label %202

; <label>:202                                     ; preds = %163, %159
  %203 = load i32* %j1, align 4
  store i32 %203, i32* %k, align 4
  br label %204

; <label>:204                                     ; preds = %208, %202
  %205 = load i32* %k, align 4
  %206 = load i32* %j, align 4
  %207 = icmp slt i32 %205, %206
  br i1 %207, label %208, label %214

; <label>:208                                     ; preds = %204
  %209 = load i32* %k, align 4
  %210 = load i32* %j, align 4
  %211 = sub nsw i32 %210, %209
  store i32 %211, i32* %j, align 4
  %212 = load i32* %k, align 4
  %213 = sdiv i32 %212, 2
  store i32 %213, i32* %k, align 4
  br label %204

; <label>:214                                     ; preds = %204
  %215 = load i32* %k, align 4
  %216 = load i32* %j, align 4
  %217 = add nsw i32 %216, %215
  store i32 %217, i32* %j, align 4
  br label %218

; <label>:218                                     ; preds = %214
  %219 = load i32* %i, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %i, align 4
  br label %155

; <label>:221                                     ; preds = %155
  %222 = load i32* %3, align 4
  %223 = icmp eq i32 %222, 0
  br i1 %223, label %224, label %225

; <label>:224                                     ; preds = %221
  store i32 0, i32* %1
  br label %249

; <label>:225                                     ; preds = %221
  %226 = load i32* %2, align 4
  %227 = sitofp i32 %226 to double
  store double %227, double* %w, align 8
  store i32 0, i32* %i, align 4
  br label %228

; <label>:228                                     ; preds = %245, %225
  %229 = load i32* %i, align 4
  %230 = load i32* %2, align 4
  %231 = icmp slt i32 %229, %230
  br i1 %231, label %232, label %248

; <label>:232                                     ; preds = %228
  %233 = load double* %w, align 8
  %234 = load i32* %i, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [8 x double]* @ar, i32 0, i64 %235
  %237 = load double* %236, align 8
  %238 = fdiv double %237, %233
  store double %238, double* %236, align 8
  %239 = load double* %w, align 8
  %240 = load i32* %i, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [8 x double]* @ai, i32 0, i64 %241
  %243 = load double* %242, align 8
  %244 = fdiv double %243, %239
  store double %244, double* %242, align 8
  br label %245

; <label>:245                                     ; preds = %232
  %246 = load i32* %i, align 4
  %247 = add nsw i32 %246, 1
  store i32 %247, i32* %i, align 4
  br label %228

; <label>:248                                     ; preds = %228
  store i32 0, i32* %1
  br label %249

; <label>:249                                     ; preds = %248, %224, %33, %6
  %250 = load i32* %1
  ret i32 %250
}

; Function Attrs: nounwind uwtable
define internal double @log(double %n) #0 {
  %1 = alloca double, align 8
  store double %n, double* %1, align 8
  ret double 4.500000e+00
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal double @fabs(double %n) #0 {
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
define internal double @sin(double %rad) #0 {
  %1 = alloca double, align 8
  %app = alloca double, align 8
  %diff = alloca double, align 8
  %inc = alloca i32, align 4
  store double %rad, double* %1, align 8
  store i32 1, i32* %inc, align 4
  br label %2

; <label>:2                                       ; preds = %5, %0
  %3 = load double* %1, align 8
  %4 = fcmp ogt double %3, 6.283180e+00
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %2
  %6 = load double* %1, align 8
  %7 = fsub double %6, 6.283180e+00
  store double %7, double* %1, align 8
  br label %2

; <label>:8                                       ; preds = %2
  br label %9

; <label>:9                                       ; preds = %12, %8
  %10 = load double* %1, align 8
  %11 = fcmp olt double %10, -6.283180e+00
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9
  %13 = load double* %1, align 8
  %14 = fadd double %13, 6.283180e+00
  store double %14, double* %1, align 8
  br label %9

; <label>:15                                      ; preds = %9
  %16 = load double* %1, align 8
  store double %16, double* %diff, align 8
  store double %16, double* %app, align 8
  %17 = load double* %diff, align 8
  %18 = load double* %1, align 8
  %19 = load double* %1, align 8
  %20 = fmul double %18, %19
  %21 = fsub double -0.000000e+00, %20
  %22 = fmul double %17, %21
  %23 = load i32* %inc, align 4
  %24 = sitofp i32 %23 to double
  %25 = fmul double 2.000000e+00, %24
  %26 = load i32* %inc, align 4
  %27 = sitofp i32 %26 to double
  %28 = fmul double 2.000000e+00, %27
  %29 = fadd double %28, 1.000000e+00
  %30 = fmul double %25, %29
  %31 = fdiv double %22, %30
  store double %31, double* %diff, align 8
  %32 = load double* %app, align 8
  %33 = load double* %diff, align 8
  %34 = fadd double %32, %33
  store double %34, double* %app, align 8
  %35 = load i32* %inc, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %inc, align 4
  br label %37

; <label>:37                                      ; preds = %41, %15
  %38 = load double* %diff, align 8
  %39 = call double @fabs(double %38)
  %40 = fcmp oge double %39, 1.000000e-05
  br i1 %40, label %41, label %62

; <label>:41                                      ; preds = %37
  %42 = load double* %diff, align 8
  %43 = load double* %1, align 8
  %44 = load double* %1, align 8
  %45 = fmul double %43, %44
  %46 = fsub double -0.000000e+00, %45
  %47 = fmul double %42, %46
  %48 = load i32* %inc, align 4
  %49 = sitofp i32 %48 to double
  %50 = fmul double 2.000000e+00, %49
  %51 = load i32* %inc, align 4
  %52 = sitofp i32 %51 to double
  %53 = fmul double 2.000000e+00, %52
  %54 = fadd double %53, 1.000000e+00
  %55 = fmul double %50, %54
  %56 = fdiv double %47, %55
  store double %56, double* %diff, align 8
  %57 = load double* %app, align 8
  %58 = load double* %diff, align 8
  %59 = fadd double %57, %58
  store double %59, double* %app, align 8
  %60 = load i32* %inc, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %inc, align 4
  br label %37

; <label>:62                                      ; preds = %37
  %63 = load double* %app, align 8
  ret double %63
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
