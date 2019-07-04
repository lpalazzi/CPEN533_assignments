; ModuleID = 'qsort-exam.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@arr = global [20 x float] [float 5.000000e+00, float 4.000000e+00, float 0x40249999A0000000, float 0x3FF19999A0000000, float 0x4016CCCCC0000000, float 1.000000e+02, float 2.310000e+02, float 1.110000e+02, float 4.950000e+01, float 9.900000e+01, float 1.000000e+01, float 1.500000e+02, float 0x406BC70A40000000, float 1.010000e+02, float 7.700000e+01, float 4.400000e+01, float 3.500000e+01, float 0x40348A3D80000000, float 0x4058FF5C20000000, float 0x40563851E0000000], align 16
@istack = common global [100 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @sort(i64 %n) #0 {
  %1 = alloca i64, align 8
  %i = alloca i64, align 8
  %ir = alloca i64, align 8
  %j = alloca i64, align 8
  %k = alloca i64, align 8
  %l = alloca i64, align 8
  %jstack = alloca i32, align 4
  %flag = alloca i32, align 4
  %a = alloca float, align 4
  %temp = alloca float, align 4
  store i64 %n, i64* %1, align 8
  %2 = load i64* %1, align 8
  store i64 %2, i64* %ir, align 8
  store i64 1, i64* %l, align 8
  store i32 0, i32* %jstack, align 4
  store i32 0, i32* %flag, align 4
  br label %3

; <label>:3                                       ; preds = %248, %0
  %4 = load i64* %ir, align 8
  %5 = load i64* %l, align 8
  %6 = sub i64 %4, %5
  %7 = icmp ult i64 %6, 7
  br i1 %7, label %8, label %67

; <label>:8                                       ; preds = %3
  %9 = load i64* %l, align 8
  %10 = add i64 %9, 1
  store i64 %10, i64* %j, align 8
  br label %11

; <label>:11                                      ; preds = %47, %8
  %12 = load i64* %j, align 8
  %13 = load i64* %ir, align 8
  %14 = icmp ule i64 %12, %13
  br i1 %14, label %15, label %50

; <label>:15                                      ; preds = %11
  %16 = load i64* %j, align 8
  %17 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %16
  %18 = load float* %17, align 4
  store float %18, float* %a, align 4
  %19 = load i64* %j, align 8
  %20 = sub i64 %19, 1
  store i64 %20, i64* %i, align 8
  br label %21

; <label>:21                                      ; preds = %39, %15
  %22 = load i64* %i, align 8
  %23 = load i64* %l, align 8
  %24 = icmp uge i64 %22, %23
  br i1 %24, label %25, label %42

; <label>:25                                      ; preds = %21
  %26 = load i64* %i, align 8
  %27 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %26
  %28 = load float* %27, align 4
  %29 = load float* %a, align 4
  %30 = fcmp ole float %28, %29
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %25
  br label %42

; <label>:32                                      ; preds = %25
  %33 = load i64* %i, align 8
  %34 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %33
  %35 = load float* %34, align 4
  %36 = load i64* %i, align 8
  %37 = add i64 %36, 1
  %38 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %37
  store float %35, float* %38, align 4
  br label %39

; <label>:39                                      ; preds = %32
  %40 = load i64* %i, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %i, align 8
  br label %21

; <label>:42                                      ; preds = %31, %21
  %43 = load float* %a, align 4
  %44 = load i64* %i, align 8
  %45 = add i64 %44, 1
  %46 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %45
  store float %43, float* %46, align 4
  br label %47

; <label>:47                                      ; preds = %42
  %48 = load i64* %j, align 8
  %49 = add i64 %48, 1
  store i64 %49, i64* %j, align 8
  br label %11

; <label>:50                                      ; preds = %11
  %51 = load i32* %jstack, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  br label %249

; <label>:54                                      ; preds = %50
  %55 = load i32* %jstack, align 4
  %56 = add nsw i32 %55, -1
  store i32 %56, i32* %jstack, align 4
  %57 = sext i32 %55 to i64
  %58 = getelementptr inbounds [100 x i32]* @istack, i32 0, i64 %57
  %59 = load i32* %58, align 4
  %60 = sext i32 %59 to i64
  store i64 %60, i64* %ir, align 8
  %61 = load i32* %jstack, align 4
  %62 = add nsw i32 %61, -1
  store i32 %62, i32* %jstack, align 4
  %63 = sext i32 %61 to i64
  %64 = getelementptr inbounds [100 x i32]* @istack, i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = sext i32 %65 to i64
  store i64 %66, i64* %l, align 8
  br label %248

; <label>:67                                      ; preds = %3
  %68 = load i64* %l, align 8
  %69 = load i64* %ir, align 8
  %70 = add i64 %68, %69
  %71 = lshr i64 %70, 1
  store i64 %71, i64* %k, align 8
  %72 = load i64* %k, align 8
  %73 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %72
  %74 = load float* %73, align 4
  store float %74, float* %temp, align 4
  %75 = load i64* %l, align 8
  %76 = add i64 %75, 1
  %77 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %76
  %78 = load float* %77, align 4
  %79 = load i64* %k, align 8
  %80 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %79
  store float %78, float* %80, align 4
  %81 = load float* %temp, align 4
  %82 = load i64* %l, align 8
  %83 = add i64 %82, 1
  %84 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %83
  store float %81, float* %84, align 4
  %85 = load i64* %l, align 8
  %86 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %85
  %87 = load float* %86, align 4
  %88 = load i64* %ir, align 8
  %89 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %88
  %90 = load float* %89, align 4
  %91 = fcmp ogt float %87, %90
  br i1 %91, label %92, label %104

; <label>:92                                      ; preds = %67
  %93 = load i64* %l, align 8
  %94 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %93
  %95 = load float* %94, align 4
  store float %95, float* %temp, align 4
  %96 = load i64* %ir, align 8
  %97 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %96
  %98 = load float* %97, align 4
  %99 = load i64* %l, align 8
  %100 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %99
  store float %98, float* %100, align 4
  %101 = load float* %temp, align 4
  %102 = load i64* %ir, align 8
  %103 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %102
  store float %101, float* %103, align 4
  br label %104

; <label>:104                                     ; preds = %92, %67
  %105 = load i64* %l, align 8
  %106 = add i64 %105, 1
  %107 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %106
  %108 = load float* %107, align 4
  %109 = load i64* %ir, align 8
  %110 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %109
  %111 = load float* %110, align 4
  %112 = fcmp ogt float %108, %111
  br i1 %112, label %113, label %127

; <label>:113                                     ; preds = %104
  %114 = load i64* %l, align 8
  %115 = add i64 %114, 1
  %116 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %115
  %117 = load float* %116, align 4
  store float %117, float* %temp, align 4
  %118 = load i64* %ir, align 8
  %119 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %118
  %120 = load float* %119, align 4
  %121 = load i64* %l, align 8
  %122 = add i64 %121, 1
  %123 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %122
  store float %120, float* %123, align 4
  %124 = load float* %temp, align 4
  %125 = load i64* %ir, align 8
  %126 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %125
  store float %124, float* %126, align 4
  br label %127

; <label>:127                                     ; preds = %113, %104
  %128 = load i64* %l, align 8
  %129 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %128
  %130 = load float* %129, align 4
  %131 = load i64* %l, align 8
  %132 = add i64 %131, 1
  %133 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %132
  %134 = load float* %133, align 4
  %135 = fcmp ogt float %130, %134
  br i1 %135, label %136, label %150

; <label>:136                                     ; preds = %127
  %137 = load i64* %l, align 8
  %138 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %137
  %139 = load float* %138, align 4
  store float %139, float* %temp, align 4
  %140 = load i64* %l, align 8
  %141 = add i64 %140, 1
  %142 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %141
  %143 = load float* %142, align 4
  %144 = load i64* %l, align 8
  %145 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %144
  store float %143, float* %145, align 4
  %146 = load float* %temp, align 4
  %147 = load i64* %l, align 8
  %148 = add i64 %147, 1
  %149 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %148
  store float %146, float* %149, align 4
  br label %150

; <label>:150                                     ; preds = %136, %127
  %151 = load i64* %l, align 8
  %152 = add i64 %151, 1
  store i64 %152, i64* %i, align 8
  %153 = load i64* %ir, align 8
  store i64 %153, i64* %j, align 8
  %154 = load i64* %l, align 8
  %155 = add i64 %154, 1
  %156 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %155
  %157 = load float* %156, align 4
  store float %157, float* %a, align 4
  br label %158

; <label>:158                                     ; preds = %187, %150
  %159 = load i64* %i, align 8
  %160 = add i64 %159, 1
  store i64 %160, i64* %i, align 8
  br label %161

; <label>:161                                     ; preds = %167, %158
  %162 = load i64* %i, align 8
  %163 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %162
  %164 = load float* %163, align 4
  %165 = load float* %a, align 4
  %166 = fcmp olt float %164, %165
  br i1 %166, label %167, label %170

; <label>:167                                     ; preds = %161
  %168 = load i64* %i, align 8
  %169 = add i64 %168, 1
  store i64 %169, i64* %i, align 8
  br label %161

; <label>:170                                     ; preds = %161
  %171 = load i64* %j, align 8
  %172 = add i64 %171, -1
  store i64 %172, i64* %j, align 8
  br label %173

; <label>:173                                     ; preds = %179, %170
  %174 = load i64* %j, align 8
  %175 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %174
  %176 = load float* %175, align 4
  %177 = load float* %a, align 4
  %178 = fcmp ogt float %176, %177
  br i1 %178, label %179, label %182

; <label>:179                                     ; preds = %173
  %180 = load i64* %j, align 8
  %181 = add i64 %180, -1
  store i64 %181, i64* %j, align 8
  br label %173

; <label>:182                                     ; preds = %173
  %183 = load i64* %j, align 8
  %184 = load i64* %i, align 8
  %185 = icmp ult i64 %183, %184
  br i1 %185, label %186, label %187

; <label>:186                                     ; preds = %182
  br label %199

; <label>:187                                     ; preds = %182
  %188 = load i64* %i, align 8
  %189 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %188
  %190 = load float* %189, align 4
  store float %190, float* %temp, align 4
  %191 = load i64* %j, align 8
  %192 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %191
  %193 = load float* %192, align 4
  %194 = load i64* %i, align 8
  %195 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %194
  store float %193, float* %195, align 4
  %196 = load float* %temp, align 4
  %197 = load i64* %j, align 8
  %198 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %197
  store float %196, float* %198, align 4
  br label %158

; <label>:199                                     ; preds = %186
  %200 = load i64* %j, align 8
  %201 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %200
  %202 = load float* %201, align 4
  %203 = load i64* %l, align 8
  %204 = add i64 %203, 1
  %205 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %204
  store float %202, float* %205, align 4
  %206 = load float* %a, align 4
  %207 = load i64* %j, align 8
  %208 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %207
  store float %206, float* %208, align 4
  %209 = load i32* %jstack, align 4
  %210 = add nsw i32 %209, 2
  store i32 %210, i32* %jstack, align 4
  %211 = load i64* %ir, align 8
  %212 = load i64* %i, align 8
  %213 = sub i64 %211, %212
  %214 = add i64 %213, 1
  %215 = load i64* %j, align 8
  %216 = load i64* %l, align 8
  %217 = sub i64 %215, %216
  %218 = icmp uge i64 %214, %217
  br i1 %218, label %219, label %233

; <label>:219                                     ; preds = %199
  %220 = load i64* %ir, align 8
  %221 = trunc i64 %220 to i32
  %222 = load i32* %jstack, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [100 x i32]* @istack, i32 0, i64 %223
  store i32 %221, i32* %224, align 4
  %225 = load i64* %i, align 8
  %226 = trunc i64 %225 to i32
  %227 = load i32* %jstack, align 4
  %228 = sub nsw i32 %227, 1
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [100 x i32]* @istack, i32 0, i64 %229
  store i32 %226, i32* %230, align 4
  %231 = load i64* %j, align 8
  %232 = sub i64 %231, 1
  store i64 %232, i64* %ir, align 8
  br label %247

; <label>:233                                     ; preds = %199
  %234 = load i64* %j, align 8
  %235 = sub i64 %234, 1
  %236 = trunc i64 %235 to i32
  %237 = load i32* %jstack, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [100 x i32]* @istack, i32 0, i64 %238
  store i32 %236, i32* %239, align 4
  %240 = load i64* %l, align 8
  %241 = trunc i64 %240 to i32
  %242 = load i32* %jstack, align 4
  %243 = sub nsw i32 %242, 1
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [100 x i32]* @istack, i32 0, i64 %244
  store i32 %241, i32* %245, align 4
  %246 = load i64* %i, align 8
  store i64 %246, i64* %l, align 8
  br label %247

; <label>:247                                     ; preds = %233, %219
  br label %248

; <label>:248                                     ; preds = %247, %54
  br label %3

; <label>:249                                     ; preds = %53
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %loop = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %loop, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32* %loop, align 4
  %4 = icmp slt i32 %3, 20
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32* %loop, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %7
  %9 = load float* %8, align 4
  %10 = fpext float %9 to double
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %10)
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32* %loop, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %loop, align 4
  br label %2

; <label>:15                                      ; preds = %2
  call void @sort(i64 20)
  store i32 0, i32* %loop, align 4
  br label %16

; <label>:16                                      ; preds = %26, %15
  %17 = load i32* %loop, align 4
  %18 = icmp slt i32 %17, 20
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %16
  %20 = load i32* %loop, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %21
  %23 = load float* %22, align 4
  %24 = fpext float %23 to double
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %24)
  br label %26

; <label>:26                                      ; preds = %19
  %27 = load i32* %loop, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %loop, align 4
  br label %16

; <label>:29                                      ; preds = %16
  %30 = load i32* %1
  ret i32 %30
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
