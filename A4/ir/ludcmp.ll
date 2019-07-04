; ModuleID = 'ludcmp.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [50 x [50 x double]] zeroinitializer, align 16
@b = common global [50 x double] zeroinitializer, align 16
@x = common global [50 x double] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %n = alloca i32, align 4
  %chkerr = alloca i32, align 4
  %eps = alloca double, align 8
  %w = alloca double, align 8
  store i32 0, i32* %1
  store i32 5, i32* %n, align 4
  store double 1.000000e-06, double* %eps, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %54, %0
  %3 = load i32* %i, align 4
  %4 = load i32* %n, align 4
  %5 = icmp sle i32 %3, %4
  br i1 %5, label %6, label %57

; <label>:6                                       ; preds = %2
  store double 0.000000e+00, double* %w, align 8
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %46, %6
  %8 = load i32* %j, align 4
  %9 = load i32* %n, align 4
  %10 = icmp sle i32 %8, %9
  br i1 %10, label %11, label %49

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  %14 = load i32* %j, align 4
  %15 = add nsw i32 %14, 1
  %16 = add nsw i32 %13, %15
  %17 = sitofp i32 %16 to double
  %18 = load i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %21
  %23 = getelementptr inbounds [50 x double]* %22, i32 0, i64 %19
  store double %17, double* %23, align 8
  %24 = load i32* %i, align 4
  %25 = load i32* %j, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %11
  %28 = load i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %31
  %33 = getelementptr inbounds [50 x double]* %32, i32 0, i64 %29
  %34 = load double* %33, align 8
  %35 = fmul double %34, 1.000000e+01
  store double %35, double* %33, align 8
  br label %36

; <label>:36                                      ; preds = %27, %11
  %37 = load i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %40
  %42 = getelementptr inbounds [50 x double]* %41, i32 0, i64 %38
  %43 = load double* %42, align 8
  %44 = load double* %w, align 8
  %45 = fadd double %44, %43
  store double %45, double* %w, align 8
  br label %46

; <label>:46                                      ; preds = %36
  %47 = load i32* %j, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %j, align 4
  br label %7

; <label>:49                                      ; preds = %7
  %50 = load double* %w, align 8
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [50 x double]* @b, i32 0, i64 %52
  store double %50, double* %53, align 8
  br label %54

; <label>:54                                      ; preds = %49
  %55 = load i32* %i, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %i, align 4
  br label %2

; <label>:57                                      ; preds = %2
  %58 = load i32* %n, align 4
  %59 = load double* %eps, align 8
  %60 = call i32 @ludcmp(i32 %58, double %59)
  store i32 %60, i32* %chkerr, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @ludcmp(i32 %n, double %eps) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %w = alloca double, align 8
  %y = alloca [100 x double], align 16
  store i32 %n, i32* %2, align 4
  store double %eps, double* %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp sgt i32 %4, 99
  br i1 %5, label %9, label %6

; <label>:6                                       ; preds = %0
  %7 = load double* %3, align 8
  %8 = fcmp ole double %7, 0.000000e+00
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6, %0
  store i32 999, i32* %1
  br label %257

; <label>:10                                      ; preds = %6
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %145, %10
  %12 = load i32* %i, align 4
  %13 = load i32* %2, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %148

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %19
  %21 = getelementptr inbounds [50 x double]* %20, i32 0, i64 %17
  %22 = load double* %21, align 8
  %23 = call double @fabs(double %22)
  %24 = load double* %3, align 8
  %25 = fcmp ole double %23, %24
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %15
  store i32 1, i32* %1
  br label %257

; <label>:27                                      ; preds = %15
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %j, align 4
  br label %30

; <label>:30                                      ; preds = %87, %27
  %31 = load i32* %j, align 4
  %32 = load i32* %2, align 4
  %33 = icmp sle i32 %31, %32
  br i1 %33, label %34, label %90

; <label>:34                                      ; preds = %30
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32* %j, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %38
  %40 = getelementptr inbounds [50 x double]* %39, i32 0, i64 %36
  %41 = load double* %40, align 8
  store double %41, double* %w, align 8
  %42 = load i32* %i, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %71

; <label>:44                                      ; preds = %34
  store i32 0, i32* %k, align 4
  br label %45

; <label>:45                                      ; preds = %67, %44
  %46 = load i32* %k, align 4
  %47 = load i32* %i, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %70

; <label>:49                                      ; preds = %45
  %50 = load i32* %k, align 4
  %51 = sext i32 %50 to i64
  %52 = load i32* %j, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %53
  %55 = getelementptr inbounds [50 x double]* %54, i32 0, i64 %51
  %56 = load double* %55, align 8
  %57 = load i32* %i, align 4
  %58 = sext i32 %57 to i64
  %59 = load i32* %k, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %60
  %62 = getelementptr inbounds [50 x double]* %61, i32 0, i64 %58
  %63 = load double* %62, align 8
  %64 = fmul double %56, %63
  %65 = load double* %w, align 8
  %66 = fsub double %65, %64
  store double %66, double* %w, align 8
  br label %67

; <label>:67                                      ; preds = %49
  %68 = load i32* %k, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %k, align 4
  br label %45

; <label>:70                                      ; preds = %45
  br label %71

; <label>:71                                      ; preds = %70, %34
  %72 = load double* %w, align 8
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load i32* %i, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %76
  %78 = getelementptr inbounds [50 x double]* %77, i32 0, i64 %74
  %79 = load double* %78, align 8
  %80 = fdiv double %72, %79
  %81 = load i32* %i, align 4
  %82 = sext i32 %81 to i64
  %83 = load i32* %j, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %84
  %86 = getelementptr inbounds [50 x double]* %85, i32 0, i64 %82
  store double %80, double* %86, align 8
  br label %87

; <label>:87                                      ; preds = %71
  %88 = load i32* %j, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %j, align 4
  br label %30

; <label>:90                                      ; preds = %30
  %91 = load i32* %i, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %j, align 4
  br label %93

; <label>:93                                      ; preds = %141, %90
  %94 = load i32* %j, align 4
  %95 = load i32* %2, align 4
  %96 = icmp sle i32 %94, %95
  br i1 %96, label %97, label %144

; <label>:97                                      ; preds = %93
  %98 = load i32* %j, align 4
  %99 = sext i32 %98 to i64
  %100 = load i32* %i, align 4
  %101 = add nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %102
  %104 = getelementptr inbounds [50 x double]* %103, i32 0, i64 %99
  %105 = load double* %104, align 8
  store double %105, double* %w, align 8
  store i32 0, i32* %k, align 4
  br label %106

; <label>:106                                     ; preds = %129, %97
  %107 = load i32* %k, align 4
  %108 = load i32* %i, align 4
  %109 = icmp sle i32 %107, %108
  br i1 %109, label %110, label %132

; <label>:110                                     ; preds = %106
  %111 = load i32* %k, align 4
  %112 = sext i32 %111 to i64
  %113 = load i32* %i, align 4
  %114 = add nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %115
  %117 = getelementptr inbounds [50 x double]* %116, i32 0, i64 %112
  %118 = load double* %117, align 8
  %119 = load i32* %j, align 4
  %120 = sext i32 %119 to i64
  %121 = load i32* %k, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %122
  %124 = getelementptr inbounds [50 x double]* %123, i32 0, i64 %120
  %125 = load double* %124, align 8
  %126 = fmul double %118, %125
  %127 = load double* %w, align 8
  %128 = fsub double %127, %126
  store double %128, double* %w, align 8
  br label %129

; <label>:129                                     ; preds = %110
  %130 = load i32* %k, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, i32* %k, align 4
  br label %106

; <label>:132                                     ; preds = %106
  %133 = load double* %w, align 8
  %134 = load i32* %j, align 4
  %135 = sext i32 %134 to i64
  %136 = load i32* %i, align 4
  %137 = add nsw i32 %136, 1
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %138
  %140 = getelementptr inbounds [50 x double]* %139, i32 0, i64 %135
  store double %133, double* %140, align 8
  br label %141

; <label>:141                                     ; preds = %132
  %142 = load i32* %j, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %j, align 4
  br label %93

; <label>:144                                     ; preds = %93
  br label %145

; <label>:145                                     ; preds = %144
  %146 = load i32* %i, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, i32* %i, align 4
  br label %11

; <label>:148                                     ; preds = %11
  %149 = load double* getelementptr inbounds ([50 x double]* @b, i32 0, i64 0), align 8
  %150 = getelementptr inbounds [100 x double]* %y, i32 0, i64 0
  store double %149, double* %150, align 8
  store i32 1, i32* %i, align 4
  br label %151

; <label>:151                                     ; preds = %187, %148
  %152 = load i32* %i, align 4
  %153 = load i32* %2, align 4
  %154 = icmp sle i32 %152, %153
  br i1 %154, label %155, label %190

; <label>:155                                     ; preds = %151
  %156 = load i32* %i, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [50 x double]* @b, i32 0, i64 %157
  %159 = load double* %158, align 8
  store double %159, double* %w, align 8
  store i32 0, i32* %j, align 4
  br label %160

; <label>:160                                     ; preds = %179, %155
  %161 = load i32* %j, align 4
  %162 = load i32* %i, align 4
  %163 = icmp slt i32 %161, %162
  br i1 %163, label %164, label %182

; <label>:164                                     ; preds = %160
  %165 = load i32* %j, align 4
  %166 = sext i32 %165 to i64
  %167 = load i32* %i, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %168
  %170 = getelementptr inbounds [50 x double]* %169, i32 0, i64 %166
  %171 = load double* %170, align 8
  %172 = load i32* %j, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [100 x double]* %y, i32 0, i64 %173
  %175 = load double* %174, align 8
  %176 = fmul double %171, %175
  %177 = load double* %w, align 8
  %178 = fsub double %177, %176
  store double %178, double* %w, align 8
  br label %179

; <label>:179                                     ; preds = %164
  %180 = load i32* %j, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %j, align 4
  br label %160

; <label>:182                                     ; preds = %160
  %183 = load double* %w, align 8
  %184 = load i32* %i, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [100 x double]* %y, i32 0, i64 %185
  store double %183, double* %186, align 8
  br label %187

; <label>:187                                     ; preds = %182
  %188 = load i32* %i, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %i, align 4
  br label %151

; <label>:190                                     ; preds = %151
  %191 = load i32* %2, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [100 x double]* %y, i32 0, i64 %192
  %194 = load double* %193, align 8
  %195 = load i32* %2, align 4
  %196 = sext i32 %195 to i64
  %197 = load i32* %2, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %198
  %200 = getelementptr inbounds [50 x double]* %199, i32 0, i64 %196
  %201 = load double* %200, align 8
  %202 = fdiv double %194, %201
  %203 = load i32* %2, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %204
  store double %202, double* %205, align 8
  %206 = load i32* %2, align 4
  %207 = sub nsw i32 %206, 1
  store i32 %207, i32* %i, align 4
  br label %208

; <label>:208                                     ; preds = %253, %190
  %209 = load i32* %i, align 4
  %210 = icmp sge i32 %209, 0
  br i1 %210, label %211, label %256

; <label>:211                                     ; preds = %208
  %212 = load i32* %i, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [100 x double]* %y, i32 0, i64 %213
  %215 = load double* %214, align 8
  store double %215, double* %w, align 8
  %216 = load i32* %i, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %j, align 4
  br label %218

; <label>:218                                     ; preds = %237, %211
  %219 = load i32* %j, align 4
  %220 = load i32* %2, align 4
  %221 = icmp sle i32 %219, %220
  br i1 %221, label %222, label %240

; <label>:222                                     ; preds = %218
  %223 = load i32* %j, align 4
  %224 = sext i32 %223 to i64
  %225 = load i32* %i, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %226
  %228 = getelementptr inbounds [50 x double]* %227, i32 0, i64 %224
  %229 = load double* %228, align 8
  %230 = load i32* %j, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %231
  %233 = load double* %232, align 8
  %234 = fmul double %229, %233
  %235 = load double* %w, align 8
  %236 = fsub double %235, %234
  store double %236, double* %w, align 8
  br label %237

; <label>:237                                     ; preds = %222
  %238 = load i32* %j, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %j, align 4
  br label %218

; <label>:240                                     ; preds = %218
  %241 = load double* %w, align 8
  %242 = load i32* %i, align 4
  %243 = sext i32 %242 to i64
  %244 = load i32* %i, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [50 x [50 x double]]* @a, i32 0, i64 %245
  %247 = getelementptr inbounds [50 x double]* %246, i32 0, i64 %243
  %248 = load double* %247, align 8
  %249 = fdiv double %241, %248
  %250 = load i32* %i, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [50 x double]* @x, i32 0, i64 %251
  store double %249, double* %252, align 8
  br label %253

; <label>:253                                     ; preds = %240
  %254 = load i32* %i, align 4
  %255 = add nsw i32 %254, -1
  store i32 %255, i32* %i, align 4
  br label %208

; <label>:256                                     ; preds = %208
  store i32 0, i32* %1
  br label %257

; <label>:257                                     ; preds = %256, %26, %9
  %258 = load i32* %1
  ret i32 %258
}

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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
