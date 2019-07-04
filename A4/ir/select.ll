; ModuleID = 'select.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@arr = global [20 x float] [float 5.000000e+00, float 4.000000e+00, float 0x40249999A0000000, float 0x3FF19999A0000000, float 0x4016CCCCC0000000, float 1.000000e+02, float 2.310000e+02, float 1.110000e+02, float 4.950000e+01, float 9.900000e+01, float 1.000000e+01, float 1.500000e+02, float 0x406BC70A40000000, float 1.010000e+02, float 7.700000e+01, float 4.400000e+01, float 3.500000e+01, float 0x40348A3D80000000, float 0x4058FF5C20000000, float 0x408BC70A40000000], align 16

; Function Attrs: nounwind uwtable
define float @select(i64 %k, i64 %n) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %i = alloca i64, align 8
  %ir = alloca i64, align 8
  %j = alloca i64, align 8
  %l = alloca i64, align 8
  %mid = alloca i64, align 8
  %a = alloca float, align 4
  %temp = alloca float, align 4
  %flag = alloca i32, align 4
  %flag2 = alloca i32, align 4
  store i64 %k, i64* %1, align 8
  store i64 %n, i64* %2, align 8
  store i64 1, i64* %l, align 8
  %3 = load i64* %2, align 8
  store i64 %3, i64* %ir, align 8
  store i32 0, i32* %flag2, align 4
  store i32 0, i32* %flag, align 4
  br label %4

; <label>:4                                       ; preds = %205, %0
  %5 = load i32* %flag, align 4
  %6 = icmp ne i32 %5, 0
  %7 = xor i1 %6, true
  br i1 %7, label %8, label %206

; <label>:8                                       ; preds = %4
  %9 = load i64* %ir, align 8
  %10 = load i64* %l, align 8
  %11 = add i64 %10, 1
  %12 = icmp ule i64 %9, %11
  br i1 %12, label %13, label %40

; <label>:13                                      ; preds = %8
  %14 = load i64* %ir, align 8
  %15 = load i64* %l, align 8
  %16 = add i64 %15, 1
  %17 = icmp eq i64 %14, %16
  br i1 %17, label %18, label %39

; <label>:18                                      ; preds = %13
  %19 = load i64* %ir, align 8
  %20 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %19
  %21 = load float* %20, align 4
  %22 = load i64* %l, align 8
  %23 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %22
  %24 = load float* %23, align 4
  %25 = fcmp olt float %21, %24
  br i1 %25, label %26, label %38

; <label>:26                                      ; preds = %18
  %27 = load i64* %l, align 8
  %28 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %27
  %29 = load float* %28, align 4
  store float %29, float* %temp, align 4
  %30 = load i64* %ir, align 8
  %31 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %30
  %32 = load float* %31, align 4
  %33 = load i64* %l, align 8
  %34 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %33
  store float %32, float* %34, align 4
  %35 = load float* %temp, align 4
  %36 = load i64* %ir, align 8
  %37 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %36
  store float %35, float* %37, align 4
  br label %38

; <label>:38                                      ; preds = %26, %18
  br label %39

; <label>:39                                      ; preds = %38, %13
  store i32 1, i32* %flag, align 4
  br label %205

; <label>:40                                      ; preds = %8
  %41 = load i32* %flag, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %204, label %43

; <label>:43                                      ; preds = %40
  %44 = load i64* %l, align 8
  %45 = load i64* %ir, align 8
  %46 = add i64 %44, %45
  %47 = lshr i64 %46, 1
  store i64 %47, i64* %mid, align 8
  %48 = load i64* %mid, align 8
  %49 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %48
  %50 = load float* %49, align 4
  store float %50, float* %temp, align 4
  %51 = load i64* %l, align 8
  %52 = add i64 %51, 1
  %53 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %52
  %54 = load float* %53, align 4
  %55 = load i64* %mid, align 8
  %56 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %55
  store float %54, float* %56, align 4
  %57 = load float* %temp, align 4
  %58 = load i64* %l, align 8
  %59 = add i64 %58, 1
  %60 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %59
  store float %57, float* %60, align 4
  %61 = load i64* %l, align 8
  %62 = add i64 %61, 1
  %63 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %62
  %64 = load float* %63, align 4
  %65 = load i64* %ir, align 8
  %66 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %65
  %67 = load float* %66, align 4
  %68 = fcmp ogt float %64, %67
  br i1 %68, label %69, label %83

; <label>:69                                      ; preds = %43
  %70 = load i64* %l, align 8
  %71 = add i64 %70, 1
  %72 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %71
  %73 = load float* %72, align 4
  store float %73, float* %temp, align 4
  %74 = load i64* %ir, align 8
  %75 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %74
  %76 = load float* %75, align 4
  %77 = load i64* %l, align 8
  %78 = add i64 %77, 1
  %79 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %78
  store float %76, float* %79, align 4
  %80 = load float* %temp, align 4
  %81 = load i64* %ir, align 8
  %82 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %81
  store float %80, float* %82, align 4
  br label %83

; <label>:83                                      ; preds = %69, %43
  %84 = load i64* %l, align 8
  %85 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %84
  %86 = load float* %85, align 4
  %87 = load i64* %ir, align 8
  %88 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %87
  %89 = load float* %88, align 4
  %90 = fcmp ogt float %86, %89
  br i1 %90, label %91, label %103

; <label>:91                                      ; preds = %83
  %92 = load i64* %l, align 8
  %93 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %92
  %94 = load float* %93, align 4
  store float %94, float* %temp, align 4
  %95 = load i64* %ir, align 8
  %96 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %95
  %97 = load float* %96, align 4
  %98 = load i64* %l, align 8
  %99 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %98
  store float %97, float* %99, align 4
  %100 = load float* %temp, align 4
  %101 = load i64* %ir, align 8
  %102 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %101
  store float %100, float* %102, align 4
  br label %103

; <label>:103                                     ; preds = %91, %83
  %104 = load i64* %l, align 8
  %105 = add i64 %104, 1
  %106 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %105
  %107 = load float* %106, align 4
  %108 = load i64* %l, align 8
  %109 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %108
  %110 = load float* %109, align 4
  %111 = fcmp ogt float %107, %110
  br i1 %111, label %112, label %126

; <label>:112                                     ; preds = %103
  %113 = load i64* %l, align 8
  %114 = add i64 %113, 1
  %115 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %114
  %116 = load float* %115, align 4
  store float %116, float* %temp, align 4
  %117 = load i64* %l, align 8
  %118 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %117
  %119 = load float* %118, align 4
  %120 = load i64* %l, align 8
  %121 = add i64 %120, 1
  %122 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %121
  store float %119, float* %122, align 4
  %123 = load float* %temp, align 4
  %124 = load i64* %l, align 8
  %125 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %124
  store float %123, float* %125, align 4
  br label %126

; <label>:126                                     ; preds = %112, %103
  %127 = load i64* %l, align 8
  %128 = add i64 %127, 1
  store i64 %128, i64* %i, align 8
  %129 = load i64* %ir, align 8
  store i64 %129, i64* %j, align 8
  %130 = load i64* %l, align 8
  %131 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %130
  %132 = load float* %131, align 4
  store float %132, float* %a, align 4
  br label %133

; <label>:133                                     ; preds = %173, %126
  %134 = load i32* %flag2, align 4
  %135 = icmp ne i32 %134, 0
  %136 = xor i1 %135, true
  br i1 %136, label %137, label %182

; <label>:137                                     ; preds = %133
  %138 = load i64* %i, align 8
  %139 = add i64 %138, 1
  store i64 %139, i64* %i, align 8
  br label %140

; <label>:140                                     ; preds = %146, %137
  %141 = load i64* %i, align 8
  %142 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %141
  %143 = load float* %142, align 4
  %144 = load float* %a, align 4
  %145 = fcmp olt float %143, %144
  br i1 %145, label %146, label %149

; <label>:146                                     ; preds = %140
  %147 = load i64* %i, align 8
  %148 = add i64 %147, 1
  store i64 %148, i64* %i, align 8
  br label %140

; <label>:149                                     ; preds = %140
  %150 = load i64* %j, align 8
  %151 = add i64 %150, -1
  store i64 %151, i64* %j, align 8
  br label %152

; <label>:152                                     ; preds = %158, %149
  %153 = load i64* %j, align 8
  %154 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %153
  %155 = load float* %154, align 4
  %156 = load float* %a, align 4
  %157 = fcmp ogt float %155, %156
  br i1 %157, label %158, label %161

; <label>:158                                     ; preds = %152
  %159 = load i64* %j, align 8
  %160 = add i64 %159, -1
  store i64 %160, i64* %j, align 8
  br label %152

; <label>:161                                     ; preds = %152
  %162 = load i64* %j, align 8
  %163 = load i64* %i, align 8
  %164 = icmp ult i64 %162, %163
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %161
  store i32 1, i32* %flag2, align 4
  br label %166

; <label>:166                                     ; preds = %165, %161
  %167 = load i32* %flag2, align 4
  %168 = icmp ne i32 %167, 0
  br i1 %168, label %173, label %169

; <label>:169                                     ; preds = %166
  %170 = load i64* %i, align 8
  %171 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %170
  %172 = load float* %171, align 4
  store float %172, float* %temp, align 4
  br label %173

; <label>:173                                     ; preds = %169, %166
  %174 = load i64* %j, align 8
  %175 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %174
  %176 = load float* %175, align 4
  %177 = load i64* %i, align 8
  %178 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %177
  store float %176, float* %178, align 4
  %179 = load float* %temp, align 4
  %180 = load i64* %j, align 8
  %181 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %180
  store float %179, float* %181, align 4
  br label %133

; <label>:182                                     ; preds = %133
  %183 = load i64* %j, align 8
  %184 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %183
  %185 = load float* %184, align 4
  %186 = load i64* %l, align 8
  %187 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %186
  store float %185, float* %187, align 4
  %188 = load float* %a, align 4
  %189 = load i64* %j, align 8
  %190 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %189
  store float %188, float* %190, align 4
  %191 = load i64* %j, align 8
  %192 = load i64* %1, align 8
  %193 = icmp uge i64 %191, %192
  br i1 %193, label %194, label %197

; <label>:194                                     ; preds = %182
  %195 = load i64* %j, align 8
  %196 = sub i64 %195, 1
  store i64 %196, i64* %ir, align 8
  br label %197

; <label>:197                                     ; preds = %194, %182
  %198 = load i64* %j, align 8
  %199 = load i64* %1, align 8
  %200 = icmp ule i64 %198, %199
  br i1 %200, label %201, label %203

; <label>:201                                     ; preds = %197
  %202 = load i64* %i, align 8
  store i64 %202, i64* %l, align 8
  br label %203

; <label>:203                                     ; preds = %201, %197
  br label %204

; <label>:204                                     ; preds = %203, %40
  br label %205

; <label>:205                                     ; preds = %204, %39
  br label %4

; <label>:206                                     ; preds = %4
  %207 = load i64* %1, align 8
  %208 = getelementptr inbounds [20 x float]* @arr, i32 0, i64 %207
  %209 = load float* %208, align 4
  ret float %209
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = call float @select(i64 10, i64 20)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
