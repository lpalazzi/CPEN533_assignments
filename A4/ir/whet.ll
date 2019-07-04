; ModuleID = 'whet.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@t = common global double 0.000000e+00, align 8
@t1 = common global double 0.000000e+00, align 8
@t2 = common global double 0.000000e+00, align 8
@n1 = common global i32 0, align 4
@n2 = common global i32 0, align 4
@n3 = common global i32 0, align 4
@n4 = common global i32 0, align 4
@n6 = common global i32 0, align 4
@n7 = common global i32 0, align 4
@n8 = common global i32 0, align 4
@n9 = common global i32 0, align 4
@n10 = common global i32 0, align 4
@n11 = common global i32 0, align 4
@x1 = common global double 0.000000e+00, align 8
@x4 = common global double 0.000000e+00, align 8
@x3 = common global double 0.000000e+00, align 8
@x2 = common global double 0.000000e+00, align 8
@i = common global i32 0, align 4
@e1 = common global [4 x double] zeroinitializer, align 16
@j = common global i32 0, align 4
@k = common global i32 0, align 4
@l = common global i32 0, align 4
@y = common global double 0.000000e+00, align 8
@x = common global double 0.000000e+00, align 8
@z = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store double 4.999750e-01, double* @t, align 8
  store double 5.002500e-01, double* @t1, align 8
  store double 2.000000e+00, double* @t2, align 8
  store i32 0, i32* @n1, align 4
  store i32 120, i32* @n2, align 4
  store i32 140, i32* @n3, align 4
  store i32 3450, i32* @n4, align 4
  store i32 2100, i32* @n6, align 4
  store i32 320, i32* @n7, align 4
  store i32 8990, i32* @n8, align 4
  store i32 6160, i32* @n9, align 4
  store i32 0, i32* @n10, align 4
  store i32 930, i32* @n11, align 4
  store double 1.000000e+00, double* @x1, align 8
  store double -1.000000e+00, double* @x4, align 8
  store double -1.000000e+00, double* @x3, align 8
  store double -1.000000e+00, double* @x2, align 8
  store i32 1, i32* @i, align 4
  br label %2

; <label>:2                                       ; preds = %44, %0
  %3 = load i32* @i, align 4
  %4 = load i32* @n1, align 4
  %5 = icmp sle i32 %3, %4
  br i1 %5, label %6, label %47

; <label>:6                                       ; preds = %2
  %7 = load double* @x1, align 8
  %8 = load double* @x2, align 8
  %9 = fadd double %7, %8
  %10 = load double* @x3, align 8
  %11 = fadd double %9, %10
  %12 = load double* @x4, align 8
  %13 = fsub double %11, %12
  %14 = load double* @t, align 8
  %15 = fmul double %13, %14
  store double %15, double* @x1, align 8
  %16 = load double* @x1, align 8
  %17 = load double* @x2, align 8
  %18 = fadd double %16, %17
  %19 = load double* @x3, align 8
  %20 = fsub double %18, %19
  %21 = load double* @x4, align 8
  %22 = fsub double %20, %21
  %23 = load double* @t, align 8
  %24 = fmul double %22, %23
  store double %24, double* @x2, align 8
  %25 = load double* @x1, align 8
  %26 = load double* @x2, align 8
  %27 = fsub double %25, %26
  %28 = load double* @x3, align 8
  %29 = fadd double %27, %28
  %30 = load double* @x4, align 8
  %31 = fadd double %29, %30
  %32 = load double* @t, align 8
  %33 = fmul double %31, %32
  store double %33, double* @x3, align 8
  %34 = load double* @x1, align 8
  %35 = fsub double -0.000000e+00, %34
  %36 = load double* @x2, align 8
  %37 = fadd double %35, %36
  %38 = load double* @x3, align 8
  %39 = fadd double %37, %38
  %40 = load double* @x4, align 8
  %41 = fadd double %39, %40
  %42 = load double* @t, align 8
  %43 = fmul double %41, %42
  store double %43, double* @x4, align 8
  br label %44

; <label>:44                                      ; preds = %6
  %45 = load i32* @i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* @i, align 4
  br label %2

; <label>:47                                      ; preds = %2
  store double 1.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  store double -1.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 3), align 8
  store double -1.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  store double -1.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  store i32 1, i32* @i, align 4
  br label %48

; <label>:48                                      ; preds = %90, %47
  %49 = load i32* @i, align 4
  %50 = load i32* @n2, align 4
  %51 = icmp sle i32 %49, %50
  br i1 %51, label %52, label %93

; <label>:52                                      ; preds = %48
  %53 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  %54 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  %55 = fadd double %53, %54
  %56 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  %57 = fadd double %55, %56
  %58 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 3), align 8
  %59 = fsub double %57, %58
  %60 = load double* @t, align 8
  %61 = fmul double %59, %60
  store double %61, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  %62 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  %63 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  %64 = fadd double %62, %63
  %65 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  %66 = fsub double %64, %65
  %67 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 3), align 8
  %68 = fadd double %66, %67
  %69 = load double* @t, align 8
  %70 = fmul double %68, %69
  store double %70, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  %71 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  %72 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  %73 = fsub double %71, %72
  %74 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  %75 = fadd double %73, %74
  %76 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 3), align 8
  %77 = fadd double %75, %76
  %78 = load double* @t, align 8
  %79 = fmul double %77, %78
  store double %79, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  %80 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  %81 = fsub double -0.000000e+00, %80
  %82 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  %83 = fadd double %81, %82
  %84 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  %85 = fadd double %83, %84
  %86 = load double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 3), align 8
  %87 = fadd double %85, %86
  %88 = load double* @t, align 8
  %89 = fmul double %87, %88
  store double %89, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 3), align 8
  br label %90

; <label>:90                                      ; preds = %52
  %91 = load i32* @i, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* @i, align 4
  br label %48

; <label>:93                                      ; preds = %48
  store i32 1, i32* @i, align 4
  br label %94

; <label>:94                                      ; preds = %100, %93
  %95 = load i32* @i, align 4
  %96 = load i32* @n3, align 4
  %97 = icmp sle i32 %95, %96
  br i1 %97, label %98, label %103

; <label>:98                                      ; preds = %94
  %99 = call i32 @pa(double* getelementptr inbounds ([4 x double]* @e1, i32 0, i32 0))
  br label %100

; <label>:100                                     ; preds = %98
  %101 = load i32* @i, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* @i, align 4
  br label %94

; <label>:103                                     ; preds = %94
  store i32 1, i32* @j, align 4
  store i32 1, i32* @i, align 4
  br label %104

; <label>:104                                     ; preds = %124, %103
  %105 = load i32* @i, align 4
  %106 = load i32* @n4, align 4
  %107 = icmp sle i32 %105, %106
  br i1 %107, label %108, label %127

; <label>:108                                     ; preds = %104
  %109 = load i32* @j, align 4
  %110 = icmp eq i32 %109, 1
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %108
  store i32 2, i32* @j, align 4
  br label %113

; <label>:112                                     ; preds = %108
  store i32 3, i32* @j, align 4
  br label %113

; <label>:113                                     ; preds = %112, %111
  %114 = load i32* @j, align 4
  %115 = icmp sgt i32 %114, 2
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %113
  store i32 0, i32* @j, align 4
  br label %118

; <label>:117                                     ; preds = %113
  store i32 1, i32* @j, align 4
  br label %118

; <label>:118                                     ; preds = %117, %116
  %119 = load i32* @j, align 4
  %120 = icmp slt i32 %119, 1
  br i1 %120, label %121, label %122

; <label>:121                                     ; preds = %118
  store i32 1, i32* @j, align 4
  br label %123

; <label>:122                                     ; preds = %118
  store i32 0, i32* @j, align 4
  br label %123

; <label>:123                                     ; preds = %122, %121
  br label %124

; <label>:124                                     ; preds = %123
  %125 = load i32* @i, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* @i, align 4
  br label %104

; <label>:127                                     ; preds = %104
  store i32 1, i32* @j, align 4
  store i32 2, i32* @k, align 4
  store i32 3, i32* @l, align 4
  store i32 1, i32* @i, align 4
  br label %128

; <label>:128                                     ; preds = %178, %127
  %129 = load i32* @i, align 4
  %130 = load i32* @n6, align 4
  %131 = icmp sle i32 %129, %130
  br i1 %131, label %132, label %181

; <label>:132                                     ; preds = %128
  %133 = load i32* @j, align 4
  %134 = load i32* @k, align 4
  %135 = load i32* @j, align 4
  %136 = sub nsw i32 %134, %135
  %137 = mul nsw i32 %133, %136
  %138 = load i32* @l, align 4
  %139 = load i32* @k, align 4
  %140 = sub nsw i32 %138, %139
  %141 = mul nsw i32 %137, %140
  store i32 %141, i32* @j, align 4
  %142 = load i32* @l, align 4
  %143 = load i32* @k, align 4
  %144 = mul nsw i32 %142, %143
  %145 = load i32* @l, align 4
  %146 = load i32* @j, align 4
  %147 = sub nsw i32 %145, %146
  %148 = load i32* @k, align 4
  %149 = mul nsw i32 %147, %148
  %150 = sub nsw i32 %144, %149
  store i32 %150, i32* @k, align 4
  %151 = load i32* @l, align 4
  %152 = load i32* @k, align 4
  %153 = sub nsw i32 %151, %152
  %154 = load i32* @k, align 4
  %155 = load i32* @j, align 4
  %156 = add nsw i32 %154, %155
  %157 = mul nsw i32 %153, %156
  store i32 %157, i32* @l, align 4
  %158 = load i32* @j, align 4
  %159 = load i32* @k, align 4
  %160 = add nsw i32 %158, %159
  %161 = load i32* @l, align 4
  %162 = add nsw i32 %160, %161
  %163 = sitofp i32 %162 to double
  %164 = load i32* @l, align 4
  %165 = sub nsw i32 %164, 2
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %166
  store double %163, double* %167, align 8
  %168 = load i32* @j, align 4
  %169 = load i32* @k, align 4
  %170 = mul nsw i32 %168, %169
  %171 = load i32* @l, align 4
  %172 = mul nsw i32 %170, %171
  %173 = sitofp i32 %172 to double
  %174 = load i32* @k, align 4
  %175 = sub nsw i32 %174, 2
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %176
  store double %173, double* %177, align 8
  br label %178

; <label>:178                                     ; preds = %132
  %179 = load i32* @i, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, i32* @i, align 4
  br label %128

; <label>:181                                     ; preds = %128
  store double 5.000000e-01, double* @y, align 8
  store double 5.000000e-01, double* @x, align 8
  store i32 1, i32* @i, align 4
  br label %182

; <label>:182                                     ; preds = %229, %181
  %183 = load i32* @i, align 4
  %184 = load i32* @n7, align 4
  %185 = icmp sle i32 %183, %184
  br i1 %185, label %186, label %232

; <label>:186                                     ; preds = %182
  %187 = load double* @t, align 8
  %188 = load double* @t2, align 8
  %189 = load double* @x, align 8
  %190 = call double @sin(double %189) #2
  %191 = fmul double %188, %190
  %192 = load double* @x, align 8
  %193 = call double @cos(double %192) #2
  %194 = fmul double %191, %193
  %195 = load double* @x, align 8
  %196 = load double* @y, align 8
  %197 = fadd double %195, %196
  %198 = call double @cos(double %197) #2
  %199 = load double* @x, align 8
  %200 = load double* @y, align 8
  %201 = fsub double %199, %200
  %202 = call double @cos(double %201) #2
  %203 = fadd double %198, %202
  %204 = fsub double %203, 1.000000e+00
  %205 = fdiv double %194, %204
  %206 = call double @atan(double %205) #2
  %207 = fmul double %187, %206
  store double %207, double* @x, align 8
  %208 = load double* @t, align 8
  %209 = load double* @t2, align 8
  %210 = load double* @y, align 8
  %211 = call double @sin(double %210) #2
  %212 = fmul double %209, %211
  %213 = load double* @y, align 8
  %214 = call double @cos(double %213) #2
  %215 = fmul double %212, %214
  %216 = load double* @x, align 8
  %217 = load double* @y, align 8
  %218 = fadd double %216, %217
  %219 = call double @cos(double %218) #2
  %220 = load double* @x, align 8
  %221 = load double* @y, align 8
  %222 = fsub double %220, %221
  %223 = call double @cos(double %222) #2
  %224 = fadd double %219, %223
  %225 = fsub double %224, 1.000000e+00
  %226 = fdiv double %215, %225
  %227 = call double @atan(double %226) #2
  %228 = fmul double %208, %227
  store double %228, double* @y, align 8
  br label %229

; <label>:229                                     ; preds = %186
  %230 = load i32* @i, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* @i, align 4
  br label %182

; <label>:232                                     ; preds = %182
  store double 1.000000e+00, double* @z, align 8
  store double 1.000000e+00, double* @y, align 8
  store double 1.000000e+00, double* @x, align 8
  store i32 1, i32* @i, align 4
  br label %233

; <label>:233                                     ; preds = %241, %232
  %234 = load i32* @i, align 4
  %235 = load i32* @n8, align 4
  %236 = icmp sle i32 %234, %235
  br i1 %236, label %237, label %244

; <label>:237                                     ; preds = %233
  %238 = load double* @x, align 8
  %239 = load double* @y, align 8
  %240 = call i32 @p3(double %238, double %239, double* @z)
  br label %241

; <label>:241                                     ; preds = %237
  %242 = load i32* @i, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* @i, align 4
  br label %233

; <label>:244                                     ; preds = %233
  store i32 1, i32* @j, align 4
  store i32 2, i32* @k, align 4
  store i32 3, i32* @l, align 4
  store double 1.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 0), align 8
  store double 2.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 1), align 8
  store double 3.000000e+00, double* getelementptr inbounds ([4 x double]* @e1, i32 0, i64 2), align 8
  store i32 1, i32* @i, align 4
  br label %245

; <label>:245                                     ; preds = %251, %244
  %246 = load i32* @i, align 4
  %247 = load i32* @n9, align 4
  %248 = icmp sle i32 %246, %247
  br i1 %248, label %249, label %254

; <label>:249                                     ; preds = %245
  %250 = call i32 @p0()
  br label %251

; <label>:251                                     ; preds = %249
  %252 = load i32* @i, align 4
  %253 = add nsw i32 %252, 1
  store i32 %253, i32* @i, align 4
  br label %245

; <label>:254                                     ; preds = %245
  store i32 2, i32* @j, align 4
  store i32 3, i32* @k, align 4
  store i32 1, i32* @i, align 4
  br label %255

; <label>:255                                     ; preds = %274, %254
  %256 = load i32* @i, align 4
  %257 = load i32* @n10, align 4
  %258 = icmp sle i32 %256, %257
  br i1 %258, label %259, label %277

; <label>:259                                     ; preds = %255
  %260 = load i32* @j, align 4
  %261 = load i32* @k, align 4
  %262 = add nsw i32 %260, %261
  store i32 %262, i32* @j, align 4
  %263 = load i32* @j, align 4
  %264 = load i32* @k, align 4
  %265 = add nsw i32 %263, %264
  store i32 %265, i32* @k, align 4
  %266 = load i32* @k, align 4
  %267 = load i32* @j, align 4
  %268 = sub nsw i32 %266, %267
  store i32 %268, i32* @j, align 4
  %269 = load i32* @k, align 4
  %270 = load i32* @j, align 4
  %271 = sub nsw i32 %269, %270
  %272 = load i32* @j, align 4
  %273 = sub nsw i32 %271, %272
  store i32 %273, i32* @k, align 4
  br label %274

; <label>:274                                     ; preds = %259
  %275 = load i32* @i, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, i32* @i, align 4
  br label %255

; <label>:277                                     ; preds = %255
  store double 7.500000e-01, double* @x, align 8
  store i32 1, i32* @i, align 4
  br label %278

; <label>:278                                     ; preds = %289, %277
  %279 = load i32* @i, align 4
  %280 = load i32* @n11, align 4
  %281 = icmp sle i32 %279, %280
  br i1 %281, label %282, label %292

; <label>:282                                     ; preds = %278
  %283 = load double* @x, align 8
  %284 = call double @log(double %283) #2
  %285 = load double* @t1, align 8
  %286 = fdiv double %284, %285
  %287 = call double @exp(double %286) #2
  %288 = call double @sqrt(double %287) #2
  store double %288, double* @x, align 8
  br label %289

; <label>:289                                     ; preds = %282
  %290 = load i32* @i, align 4
  %291 = add nsw i32 %290, 1
  store i32 %291, i32* @i, align 4
  br label %278

; <label>:292                                     ; preds = %278
  %293 = load i32* %1
  ret i32 %293
}

; Function Attrs: nounwind
declare double @atan(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @exp(double) #1

; Function Attrs: nounwind
declare double @log(double) #1

; Function Attrs: nounwind uwtable
define i32 @pa(double* %e) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %j = alloca i32, align 4
  store double* %e, double** %2, align 8
  store i32 0, i32* %j, align 4
  br label %3

; <label>:3                                       ; preds = %85, %0
  %4 = load double** %2, align 8
  %5 = getelementptr inbounds double* %4, i64 0
  %6 = load double* %5, align 8
  %7 = load double** %2, align 8
  %8 = getelementptr inbounds double* %7, i64 1
  %9 = load double* %8, align 8
  %10 = fadd double %6, %9
  %11 = load double** %2, align 8
  %12 = getelementptr inbounds double* %11, i64 2
  %13 = load double* %12, align 8
  %14 = fadd double %10, %13
  %15 = load double** %2, align 8
  %16 = getelementptr inbounds double* %15, i64 3
  %17 = load double* %16, align 8
  %18 = fsub double %14, %17
  %19 = load double* @t, align 8
  %20 = fmul double %18, %19
  %21 = load double** %2, align 8
  %22 = getelementptr inbounds double* %21, i64 0
  store double %20, double* %22, align 8
  %23 = load double** %2, align 8
  %24 = getelementptr inbounds double* %23, i64 0
  %25 = load double* %24, align 8
  %26 = load double** %2, align 8
  %27 = getelementptr inbounds double* %26, i64 1
  %28 = load double* %27, align 8
  %29 = fadd double %25, %28
  %30 = load double** %2, align 8
  %31 = getelementptr inbounds double* %30, i64 2
  %32 = load double* %31, align 8
  %33 = fsub double %29, %32
  %34 = load double** %2, align 8
  %35 = getelementptr inbounds double* %34, i64 3
  %36 = load double* %35, align 8
  %37 = fadd double %33, %36
  %38 = load double* @t, align 8
  %39 = fmul double %37, %38
  %40 = load double** %2, align 8
  %41 = getelementptr inbounds double* %40, i64 1
  store double %39, double* %41, align 8
  %42 = load double** %2, align 8
  %43 = getelementptr inbounds double* %42, i64 0
  %44 = load double* %43, align 8
  %45 = load double** %2, align 8
  %46 = getelementptr inbounds double* %45, i64 1
  %47 = load double* %46, align 8
  %48 = fsub double %44, %47
  %49 = load double** %2, align 8
  %50 = getelementptr inbounds double* %49, i64 2
  %51 = load double* %50, align 8
  %52 = fadd double %48, %51
  %53 = load double** %2, align 8
  %54 = getelementptr inbounds double* %53, i64 3
  %55 = load double* %54, align 8
  %56 = fadd double %52, %55
  %57 = load double* @t, align 8
  %58 = fmul double %56, %57
  %59 = load double** %2, align 8
  %60 = getelementptr inbounds double* %59, i64 2
  store double %58, double* %60, align 8
  %61 = load double** %2, align 8
  %62 = getelementptr inbounds double* %61, i64 0
  %63 = load double* %62, align 8
  %64 = fsub double -0.000000e+00, %63
  %65 = load double** %2, align 8
  %66 = getelementptr inbounds double* %65, i64 1
  %67 = load double* %66, align 8
  %68 = fadd double %64, %67
  %69 = load double** %2, align 8
  %70 = getelementptr inbounds double* %69, i64 2
  %71 = load double* %70, align 8
  %72 = fadd double %68, %71
  %73 = load double** %2, align 8
  %74 = getelementptr inbounds double* %73, i64 3
  %75 = load double* %74, align 8
  %76 = fadd double %72, %75
  %77 = load double* @t2, align 8
  %78 = fdiv double %76, %77
  %79 = load double** %2, align 8
  %80 = getelementptr inbounds double* %79, i64 3
  store double %78, double* %80, align 8
  %81 = load i32* %j, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %j, align 4
  %83 = load i32* %j, align 4
  %84 = icmp slt i32 %83, 6
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %3
  br label %3

; <label>:86                                      ; preds = %3
  %87 = load i32* %1
  ret i32 %87
}

; Function Attrs: nounwind uwtable
define i32 @p3(double %x, double %y, double* %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double*, align 8
  store double %x, double* %2, align 8
  store double %y, double* %3, align 8
  store double* %z, double** %4, align 8
  %5 = load double* @t, align 8
  %6 = load double* %2, align 8
  %7 = load double* %3, align 8
  %8 = fadd double %6, %7
  %9 = fmul double %5, %8
  store double %9, double* %2, align 8
  %10 = load double* @t, align 8
  %11 = load double* %2, align 8
  %12 = load double* %3, align 8
  %13 = fadd double %11, %12
  %14 = fmul double %10, %13
  store double %14, double* %3, align 8
  %15 = load double* %2, align 8
  %16 = load double* %3, align 8
  %17 = fadd double %15, %16
  %18 = load double* @t2, align 8
  %19 = fdiv double %17, %18
  %20 = load double** %4, align 8
  store double %19, double* %20, align 8
  %21 = load i32* %1
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define i32 @p0() #0 {
  %1 = alloca i32, align 4
  %2 = load i32* @k, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %3
  %5 = load double* %4, align 8
  %6 = load i32* @j, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %7
  store double %5, double* %8, align 8
  %9 = load i32* @l, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %10
  %12 = load double* %11, align 8
  %13 = load i32* @k, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %14
  store double %12, double* %15, align 8
  %16 = load i32* @j, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %17
  %19 = load double* %18, align 8
  %20 = load i32* @l, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x double]* @e1, i32 0, i64 %21
  store double %19, double* %22, align 8
  %23 = load i32* %1
  ret i32 %23
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
