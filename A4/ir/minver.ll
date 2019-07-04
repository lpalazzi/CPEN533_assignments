; ModuleID = 'minver.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal global [3 x [3 x double]] [[3 x double] [double 3.000000e+00, double -6.000000e+00, double 7.000000e+00], [3 x double] [double 9.000000e+00, double 0.000000e+00, double -5.000000e+00], [3 x double] [double 5.000000e+00, double -8.000000e+00, double 6.000000e+00]], align 16
@aa = common global [3 x [3 x double]] zeroinitializer, align 16
@a_i = common global [3 x [3 x double]] zeroinitializer, align 16
@b = common global [3 x [3 x double]] zeroinitializer, align 16
@c = common global [3 x [3 x double]] zeroinitializer, align 16
@det = common global double 0.000000e+00, align 8
@e = common global [3 x [3 x double]] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define double @minver_fabs(double %n) #0 {
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
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %eps = alloca double, align 8
  store i32 0, i32* %1
  store double 1.000000e-06, double* %eps, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %27, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %2
  store i32 0, i32* %j, align 4
  br label %6

; <label>:6                                       ; preds = %23, %5
  %7 = load i32* %j, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %26

; <label>:9                                       ; preds = %6
  %10 = load i32* %j, align 4
  %11 = sext i32 %10 to i64
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %13
  %15 = getelementptr inbounds [3 x double]* %14, i32 0, i64 %11
  %16 = load double* %15, align 8
  %17 = load i32* %j, align 4
  %18 = sext i32 %17 to i64
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [3 x [3 x double]]* @aa, i32 0, i64 %20
  %22 = getelementptr inbounds [3 x double]* %21, i32 0, i64 %18
  store double %16, double* %22, align 8
  br label %23

; <label>:23                                      ; preds = %9
  %24 = load i32* %j, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %j, align 4
  br label %6

; <label>:26                                      ; preds = %6
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %2

; <label>:30                                      ; preds = %2
  %31 = load double* %eps, align 8
  %32 = call i32 @minver(i32 3, i32 3, double %31)
  store i32 0, i32* %i, align 4
  br label %33

; <label>:33                                      ; preds = %58, %30
  %34 = load i32* %i, align 4
  %35 = icmp slt i32 %34, 3
  br i1 %35, label %36, label %61

; <label>:36                                      ; preds = %33
  store i32 0, i32* %j, align 4
  br label %37

; <label>:37                                      ; preds = %54, %36
  %38 = load i32* %j, align 4
  %39 = icmp slt i32 %38, 3
  br i1 %39, label %40, label %57

; <label>:40                                      ; preds = %37
  %41 = load i32* %j, align 4
  %42 = sext i32 %41 to i64
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %44
  %46 = getelementptr inbounds [3 x double]* %45, i32 0, i64 %42
  %47 = load double* %46, align 8
  %48 = load i32* %j, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32* %i, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x [3 x double]]* @a_i, i32 0, i64 %51
  %53 = getelementptr inbounds [3 x double]* %52, i32 0, i64 %49
  store double %47, double* %53, align 8
  br label %54

; <label>:54                                      ; preds = %40
  %55 = load i32* %j, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %j, align 4
  br label %37

; <label>:57                                      ; preds = %37
  br label %58

; <label>:58                                      ; preds = %57
  %59 = load i32* %i, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %33

; <label>:61                                      ; preds = %33
  %62 = call i32 @mmul(i32 3, i32 3, i32 3, i32 3)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @minver(i32 %row, i32 %col, double %eps) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %work = alloca [500 x i32], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %r = alloca i32, align 4
  %iw = alloca i32, align 4
  %s = alloca i32, align 4
  %t = alloca i32, align 4
  %u = alloca i32, align 4
  %v = alloca i32, align 4
  %w = alloca double, align 8
  %wmax = alloca double, align 8
  %pivot = alloca double, align 8
  %api = alloca double, align 8
  %w1 = alloca double, align 8
  store i32 %row, i32* %2, align 4
  store i32 %col, i32* %3, align 4
  store double %eps, double* %4, align 8
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %5, 2
  br i1 %6, label %13, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = icmp sgt i32 %8, 500
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %7
  %11 = load double* %4, align 8
  %12 = fcmp ole double %11, 0.000000e+00
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10, %7, %0
  store i32 999, i32* %1
  br label %329

; <label>:14                                      ; preds = %10
  store double 1.000000e+00, double* %w1, align 8
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %24, %14
  %16 = load i32* %i, align 4
  %17 = load i32* %2, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %27

; <label>:19                                      ; preds = %15
  %20 = load i32* %i, align 4
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %22
  store i32 %20, i32* %23, align 4
  br label %24

; <label>:24                                      ; preds = %19
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %15

; <label>:27                                      ; preds = %15
  store i32 0, i32* %k, align 4
  br label %28

; <label>:28                                      ; preds = %244, %27
  %29 = load i32* %k, align 4
  %30 = load i32* %2, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %247

; <label>:32                                      ; preds = %28
  store double 0.000000e+00, double* %wmax, align 8
  %33 = load i32* %k, align 4
  store i32 %33, i32* %i, align 4
  br label %34

; <label>:34                                      ; preds = %54, %32
  %35 = load i32* %i, align 4
  %36 = load i32* %2, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %57

; <label>:38                                      ; preds = %34
  %39 = load i32* %k, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %42
  %44 = getelementptr inbounds [3 x double]* %43, i32 0, i64 %40
  %45 = load double* %44, align 8
  %46 = call double @minver_fabs(double %45)
  store double %46, double* %w, align 8
  %47 = load double* %w, align 8
  %48 = load double* %wmax, align 8
  %49 = fcmp ogt double %47, %48
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %38
  %51 = load double* %w, align 8
  store double %51, double* %wmax, align 8
  %52 = load i32* %i, align 4
  store i32 %52, i32* %r, align 4
  br label %53

; <label>:53                                      ; preds = %50, %38
  br label %54

; <label>:54                                      ; preds = %53
  %55 = load i32* %i, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %i, align 4
  br label %34

; <label>:57                                      ; preds = %34
  %58 = load i32* %k, align 4
  %59 = sext i32 %58 to i64
  %60 = load i32* %r, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %61
  %63 = getelementptr inbounds [3 x double]* %62, i32 0, i64 %59
  %64 = load double* %63, align 8
  store double %64, double* %pivot, align 8
  %65 = load double* %pivot, align 8
  %66 = call double @minver_fabs(double %65)
  store double %66, double* %api, align 8
  %67 = load double* %api, align 8
  %68 = load double* %4, align 8
  %69 = fcmp ole double %67, %68
  br i1 %69, label %70, label %72

; <label>:70                                      ; preds = %57
  %71 = load double* %w1, align 8
  store double %71, double* @det, align 8
  store i32 1, i32* %1
  br label %329

; <label>:72                                      ; preds = %57
  %73 = load double* %pivot, align 8
  %74 = load double* %w1, align 8
  %75 = fmul double %74, %73
  store double %75, double* %w1, align 8
  %76 = load i32* %k, align 4
  %77 = load i32* %3, align 4
  %78 = mul nsw i32 %76, %77
  store i32 %78, i32* %u, align 4
  %79 = load i32* %r, align 4
  %80 = load i32* %3, align 4
  %81 = mul nsw i32 %79, %80
  store i32 %81, i32* %v, align 4
  %82 = load i32* %r, align 4
  %83 = load i32* %k, align 4
  %84 = icmp ne i32 %82, %83
  br i1 %84, label %85, label %145

; <label>:85                                      ; preds = %72
  %86 = load double* %w, align 8
  %87 = fsub double -0.000000e+00, %86
  store double %87, double* %w1, align 8
  %88 = load i32* %k, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %89
  %91 = load i32* %90, align 4
  store i32 %91, i32* %iw, align 4
  %92 = load i32* %r, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %93
  %95 = load i32* %94, align 4
  %96 = load i32* %k, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %97
  store i32 %95, i32* %98, align 4
  %99 = load i32* %iw, align 4
  %100 = load i32* %r, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %101
  store i32 %99, i32* %102, align 4
  store i32 0, i32* %j, align 4
  br label %103

; <label>:103                                     ; preds = %141, %85
  %104 = load i32* %j, align 4
  %105 = load i32* %2, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %144

; <label>:107                                     ; preds = %103
  %108 = load i32* %u, align 4
  %109 = load i32* %j, align 4
  %110 = add nsw i32 %108, %109
  store i32 %110, i32* %s, align 4
  %111 = load i32* %v, align 4
  %112 = load i32* %j, align 4
  %113 = add nsw i32 %111, %112
  store i32 %113, i32* %t, align 4
  %114 = load i32* %j, align 4
  %115 = sext i32 %114 to i64
  %116 = load i32* %k, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %117
  %119 = getelementptr inbounds [3 x double]* %118, i32 0, i64 %115
  %120 = load double* %119, align 8
  store double %120, double* %w, align 8
  %121 = load i32* %j, align 4
  %122 = sext i32 %121 to i64
  %123 = load i32* %r, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %124
  %126 = getelementptr inbounds [3 x double]* %125, i32 0, i64 %122
  %127 = load double* %126, align 8
  %128 = load i32* %j, align 4
  %129 = sext i32 %128 to i64
  %130 = load i32* %k, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %131
  %133 = getelementptr inbounds [3 x double]* %132, i32 0, i64 %129
  store double %127, double* %133, align 8
  %134 = load double* %w, align 8
  %135 = load i32* %j, align 4
  %136 = sext i32 %135 to i64
  %137 = load i32* %r, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %138
  %140 = getelementptr inbounds [3 x double]* %139, i32 0, i64 %136
  store double %134, double* %140, align 8
  br label %141

; <label>:141                                     ; preds = %107
  %142 = load i32* %j, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %j, align 4
  br label %103

; <label>:144                                     ; preds = %103
  br label %145

; <label>:145                                     ; preds = %144, %72
  store i32 0, i32* %i, align 4
  br label %146

; <label>:146                                     ; preds = %160, %145
  %147 = load i32* %i, align 4
  %148 = load i32* %2, align 4
  %149 = icmp slt i32 %147, %148
  br i1 %149, label %150, label %163

; <label>:150                                     ; preds = %146
  %151 = load double* %pivot, align 8
  %152 = load i32* %i, align 4
  %153 = sext i32 %152 to i64
  %154 = load i32* %k, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %155
  %157 = getelementptr inbounds [3 x double]* %156, i32 0, i64 %153
  %158 = load double* %157, align 8
  %159 = fdiv double %158, %151
  store double %159, double* %157, align 8
  br label %160

; <label>:160                                     ; preds = %150
  %161 = load i32* %i, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %i, align 4
  br label %146

; <label>:163                                     ; preds = %146
  store i32 0, i32* %i, align 4
  br label %164

; <label>:164                                     ; preds = %232, %163
  %165 = load i32* %i, align 4
  %166 = load i32* %2, align 4
  %167 = icmp slt i32 %165, %166
  br i1 %167, label %168, label %235

; <label>:168                                     ; preds = %164
  %169 = load i32* %i, align 4
  %170 = load i32* %k, align 4
  %171 = icmp ne i32 %169, %170
  br i1 %171, label %172, label %231

; <label>:172                                     ; preds = %168
  %173 = load i32* %i, align 4
  %174 = load i32* %3, align 4
  %175 = mul nsw i32 %173, %174
  store i32 %175, i32* %v, align 4
  %176 = load i32* %v, align 4
  %177 = load i32* %k, align 4
  %178 = add nsw i32 %176, %177
  store i32 %178, i32* %s, align 4
  %179 = load i32* %k, align 4
  %180 = sext i32 %179 to i64
  %181 = load i32* %i, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %182
  %184 = getelementptr inbounds [3 x double]* %183, i32 0, i64 %180
  %185 = load double* %184, align 8
  store double %185, double* %w, align 8
  %186 = load double* %w, align 8
  %187 = fcmp une double %186, 0.000000e+00
  br i1 %187, label %188, label %230

; <label>:188                                     ; preds = %172
  store i32 0, i32* %j, align 4
  br label %189

; <label>:189                                     ; preds = %216, %188
  %190 = load i32* %j, align 4
  %191 = load i32* %2, align 4
  %192 = icmp slt i32 %190, %191
  br i1 %192, label %193, label %219

; <label>:193                                     ; preds = %189
  %194 = load i32* %j, align 4
  %195 = load i32* %k, align 4
  %196 = icmp ne i32 %194, %195
  br i1 %196, label %197, label %215

; <label>:197                                     ; preds = %193
  %198 = load double* %w, align 8
  %199 = load i32* %j, align 4
  %200 = sext i32 %199 to i64
  %201 = load i32* %k, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %202
  %204 = getelementptr inbounds [3 x double]* %203, i32 0, i64 %200
  %205 = load double* %204, align 8
  %206 = fmul double %198, %205
  %207 = load i32* %j, align 4
  %208 = sext i32 %207 to i64
  %209 = load i32* %i, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %210
  %212 = getelementptr inbounds [3 x double]* %211, i32 0, i64 %208
  %213 = load double* %212, align 8
  %214 = fsub double %213, %206
  store double %214, double* %212, align 8
  br label %215

; <label>:215                                     ; preds = %197, %193
  br label %216

; <label>:216                                     ; preds = %215
  %217 = load i32* %j, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %j, align 4
  br label %189

; <label>:219                                     ; preds = %189
  %220 = load double* %w, align 8
  %221 = fsub double -0.000000e+00, %220
  %222 = load double* %pivot, align 8
  %223 = fdiv double %221, %222
  %224 = load i32* %k, align 4
  %225 = sext i32 %224 to i64
  %226 = load i32* %i, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %227
  %229 = getelementptr inbounds [3 x double]* %228, i32 0, i64 %225
  store double %223, double* %229, align 8
  br label %230

; <label>:230                                     ; preds = %219, %172
  br label %231

; <label>:231                                     ; preds = %230, %168
  br label %232

; <label>:232                                     ; preds = %231
  %233 = load i32* %i, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %i, align 4
  br label %164

; <label>:235                                     ; preds = %164
  %236 = load double* %pivot, align 8
  %237 = fdiv double 1.000000e+00, %236
  %238 = load i32* %k, align 4
  %239 = sext i32 %238 to i64
  %240 = load i32* %k, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %241
  %243 = getelementptr inbounds [3 x double]* %242, i32 0, i64 %239
  store double %237, double* %243, align 8
  br label %244

; <label>:244                                     ; preds = %235
  %245 = load i32* %k, align 4
  %246 = add nsw i32 %245, 1
  store i32 %246, i32* %k, align 4
  br label %28

; <label>:247                                     ; preds = %28
  store i32 0, i32* %i, align 4
  br label %248

; <label>:248                                     ; preds = %324, %247
  %249 = load i32* %i, align 4
  %250 = load i32* %2, align 4
  %251 = icmp slt i32 %249, %250
  br i1 %251, label %252, label %327

; <label>:252                                     ; preds = %248
  br label %253

; <label>:253                                     ; preds = %322, %252
  %254 = load i32* %i, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %255
  %257 = load i32* %256, align 4
  store i32 %257, i32* %k, align 4
  %258 = load i32* %k, align 4
  %259 = load i32* %i, align 4
  %260 = icmp eq i32 %258, %259
  br i1 %260, label %261, label %262

; <label>:261                                     ; preds = %253
  br label %323

; <label>:262                                     ; preds = %253
  %263 = load i32* %k, align 4
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %264
  %266 = load i32* %265, align 4
  store i32 %266, i32* %iw, align 4
  %267 = load i32* %i, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %268
  %270 = load i32* %269, align 4
  %271 = load i32* %k, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %272
  store i32 %270, i32* %273, align 4
  %274 = load i32* %iw, align 4
  %275 = load i32* %i, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [500 x i32]* %work, i32 0, i64 %276
  store i32 %274, i32* %277, align 4
  store i32 0, i32* %j, align 4
  br label %278

; <label>:278                                     ; preds = %319, %262
  %279 = load i32* %j, align 4
  %280 = load i32* %2, align 4
  %281 = icmp slt i32 %279, %280
  br i1 %281, label %282, label %322

; <label>:282                                     ; preds = %278
  %283 = load i32* %j, align 4
  %284 = load i32* %3, align 4
  %285 = mul nsw i32 %283, %284
  store i32 %285, i32* %u, align 4
  %286 = load i32* %u, align 4
  %287 = load i32* %i, align 4
  %288 = add nsw i32 %286, %287
  store i32 %288, i32* %s, align 4
  %289 = load i32* %u, align 4
  %290 = load i32* %k, align 4
  %291 = add nsw i32 %289, %290
  store i32 %291, i32* %t, align 4
  %292 = load i32* %i, align 4
  %293 = sext i32 %292 to i64
  %294 = load i32* %k, align 4
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %295
  %297 = getelementptr inbounds [3 x double]* %296, i32 0, i64 %293
  %298 = load double* %297, align 8
  store double %298, double* %w, align 8
  %299 = load i32* %k, align 4
  %300 = sext i32 %299 to i64
  %301 = load i32* %k, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %302
  %304 = getelementptr inbounds [3 x double]* %303, i32 0, i64 %300
  %305 = load double* %304, align 8
  %306 = load i32* %i, align 4
  %307 = sext i32 %306 to i64
  %308 = load i32* %k, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %309
  %311 = getelementptr inbounds [3 x double]* %310, i32 0, i64 %307
  store double %305, double* %311, align 8
  %312 = load double* %w, align 8
  %313 = load i32* %k, align 4
  %314 = sext i32 %313 to i64
  %315 = load i32* %k, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %316
  %318 = getelementptr inbounds [3 x double]* %317, i32 0, i64 %314
  store double %312, double* %318, align 8
  br label %319

; <label>:319                                     ; preds = %282
  %320 = load i32* %j, align 4
  %321 = add nsw i32 %320, 1
  store i32 %321, i32* %j, align 4
  br label %278

; <label>:322                                     ; preds = %278
  br label %253

; <label>:323                                     ; preds = %261
  br label %324

; <label>:324                                     ; preds = %323
  %325 = load i32* %i, align 4
  %326 = add nsw i32 %325, 1
  store i32 %326, i32* %i, align 4
  br label %248

; <label>:327                                     ; preds = %248
  %328 = load double* %w1, align 8
  store double %328, double* @det, align 8
  store i32 0, i32* %1
  br label %329

; <label>:329                                     ; preds = %327, %70, %13
  %330 = load i32* %1
  ret i32 %330
}

; Function Attrs: nounwind uwtable
define i32 @mmul(i32 %row_a, i32 %col_a, i32 %row_b, i32 %col_b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %row_c = alloca i32, align 4
  %col_c = alloca i32, align 4
  %w = alloca double, align 8
  store i32 %row_a, i32* %2, align 4
  store i32 %col_a, i32* %3, align 4
  store i32 %row_b, i32* %4, align 4
  store i32 %col_b, i32* %5, align 4
  %6 = load i32* %2, align 4
  store i32 %6, i32* %row_c, align 4
  %7 = load i32* %5, align 4
  store i32 %7, i32* %col_c, align 4
  %8 = load i32* %row_c, align 4
  %9 = icmp slt i32 %8, 1
  br i1 %9, label %20, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %4, align 4
  %12 = icmp slt i32 %11, 1
  br i1 %12, label %20, label %13

; <label>:13                                      ; preds = %10
  %14 = load i32* %col_c, align 4
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %20, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32* %3, align 4
  %18 = load i32* %4, align 4
  %19 = icmp ne i32 %17, %18
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16, %13, %10, %0
  store i32 999, i32* %1
  br label %73

; <label>:21                                      ; preds = %16
  store i32 0, i32* %i, align 4
  br label %22

; <label>:22                                      ; preds = %69, %21
  %23 = load i32* %i, align 4
  %24 = load i32* %row_c, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %72

; <label>:26                                      ; preds = %22
  store i32 0, i32* %j, align 4
  br label %27

; <label>:27                                      ; preds = %65, %26
  %28 = load i32* %j, align 4
  %29 = load i32* %col_c, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %68

; <label>:31                                      ; preds = %27
  store double 0.000000e+00, double* %w, align 8
  store i32 0, i32* %k, align 4
  br label %32

; <label>:32                                      ; preds = %54, %31
  %33 = load i32* %k, align 4
  %34 = load i32* %4, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %57

; <label>:36                                      ; preds = %32
  %37 = load i32* %k, align 4
  %38 = sext i32 %37 to i64
  %39 = load i32* %i, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [3 x [3 x double]]* @a, i32 0, i64 %40
  %42 = getelementptr inbounds [3 x double]* %41, i32 0, i64 %38
  %43 = load double* %42, align 8
  %44 = load i32* %j, align 4
  %45 = sext i32 %44 to i64
  %46 = load i32* %k, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [3 x [3 x double]]* @b, i32 0, i64 %47
  %49 = getelementptr inbounds [3 x double]* %48, i32 0, i64 %45
  %50 = load double* %49, align 8
  %51 = fmul double %43, %50
  %52 = load double* %w, align 8
  %53 = fadd double %52, %51
  store double %53, double* %w, align 8
  br label %54

; <label>:54                                      ; preds = %36
  %55 = load i32* %k, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %k, align 4
  br label %32

; <label>:57                                      ; preds = %32
  %58 = load double* %w, align 8
  %59 = load i32* %j, align 4
  %60 = sext i32 %59 to i64
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [3 x [3 x double]]* @c, i32 0, i64 %62
  %64 = getelementptr inbounds [3 x double]* %63, i32 0, i64 %60
  store double %58, double* %64, align 8
  br label %65

; <label>:65                                      ; preds = %57
  %66 = load i32* %j, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %j, align 4
  br label %27

; <label>:68                                      ; preds = %27
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %i, align 4
  br label %22

; <label>:72                                      ; preds = %22
  store i32 0, i32* %1
  br label %73

; <label>:73                                      ; preds = %72, %20
  %74 = load i32* %1
  ret i32 %74
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
