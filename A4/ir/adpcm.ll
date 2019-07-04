; ModuleID = 'adpcm.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@h = global [24 x i32] [i32 12, i32 -44, i32 -44, i32 212, i32 48, i32 -624, i32 128, i32 1448, i32 -840, i32 -3220, i32 3804, i32 15504, i32 15504, i32 3804, i32 -3220, i32 -840, i32 1448, i32 128, i32 -624, i32 48, i32 212, i32 -44, i32 -44, i32 12], align 16
@qq4_code4_table = global [16 x i32] [i32 0, i32 -20456, i32 -12896, i32 -8968, i32 -6288, i32 -4240, i32 -2584, i32 -1200, i32 20456, i32 12896, i32 8968, i32 6288, i32 4240, i32 2584, i32 1200, i32 0], align 16
@qq5_code5_table = global [32 x i32] [i32 -280, i32 -280, i32 -23352, i32 -17560, i32 -14120, i32 -11664, i32 -9752, i32 -8184, i32 -6864, i32 -5712, i32 -4696, i32 -3784, i32 -2960, i32 -2208, i32 -1520, i32 -880, i32 23352, i32 17560, i32 14120, i32 11664, i32 9752, i32 8184, i32 6864, i32 5712, i32 4696, i32 3784, i32 2960, i32 2208, i32 1520, i32 880, i32 280, i32 -280], align 16
@qq6_code6_table = global [64 x i32] [i32 -136, i32 -136, i32 -136, i32 -136, i32 -24808, i32 -21904, i32 -19008, i32 -16704, i32 -14984, i32 -13512, i32 -12280, i32 -11192, i32 -10232, i32 -9360, i32 -8576, i32 -7856, i32 -7192, i32 -6576, i32 -6000, i32 -5456, i32 -4944, i32 -4464, i32 -4008, i32 -3576, i32 -3168, i32 -2776, i32 -2400, i32 -2032, i32 -1688, i32 -1360, i32 -1040, i32 -728, i32 24808, i32 21904, i32 19008, i32 16704, i32 14984, i32 13512, i32 12280, i32 11192, i32 10232, i32 9360, i32 8576, i32 7856, i32 7192, i32 6576, i32 6000, i32 5456, i32 4944, i32 4464, i32 4008, i32 3576, i32 3168, i32 2776, i32 2400, i32 2032, i32 1688, i32 1360, i32 1040, i32 728, i32 432, i32 136, i32 -432, i32 -136], align 16
@wl_code_table = global [16 x i32] [i32 -60, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 -60], align 16
@wl_table = global [8 x i32] [i32 -60, i32 -30, i32 58, i32 172, i32 334, i32 538, i32 1198, i32 3042], align 16
@ilb_table = global [32 x i32] [i32 2048, i32 2093, i32 2139, i32 2186, i32 2233, i32 2282, i32 2332, i32 2383, i32 2435, i32 2489, i32 2543, i32 2599, i32 2656, i32 2714, i32 2774, i32 2834, i32 2896, i32 2960, i32 3025, i32 3091, i32 3158, i32 3228, i32 3298, i32 3371, i32 3444, i32 3520, i32 3597, i32 3676, i32 3756, i32 3838, i32 3922, i32 4008], align 16
@decis_levl = global [30 x i32] [i32 280, i32 576, i32 880, i32 1200, i32 1520, i32 1864, i32 2208, i32 2584, i32 2960, i32 3376, i32 3784, i32 4240, i32 4696, i32 5200, i32 5712, i32 6288, i32 6864, i32 7520, i32 8184, i32 8968, i32 9752, i32 10712, i32 11664, i32 12896, i32 14120, i32 15840, i32 17560, i32 20456, i32 23352, i32 32767], align 16
@quant26bt_pos = global [31 x i32] [i32 61, i32 60, i32 59, i32 58, i32 57, i32 56, i32 55, i32 54, i32 53, i32 52, i32 51, i32 50, i32 49, i32 48, i32 47, i32 46, i32 45, i32 44, i32 43, i32 42, i32 41, i32 40, i32 39, i32 38, i32 37, i32 36, i32 35, i32 34, i32 33, i32 32, i32 32], align 16
@quant26bt_neg = global [31 x i32] [i32 63, i32 62, i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 4], align 16
@qq2_code2_table = global [4 x i32] [i32 -7408, i32 -1616, i32 7408, i32 1616], align 16
@wh_code_table = global [4 x i32] [i32 798, i32 -214, i32 798, i32 -214], align 16
@tqmf = common global [24 x i32] zeroinitializer, align 16
@xl = common global i32 0, align 4
@xh = common global i32 0, align 4
@delay_bpl = common global [6 x i32] zeroinitializer, align 16
@delay_dltx = common global [6 x i32] zeroinitializer, align 16
@szl = common global i32 0, align 4
@rlt1 = common global i32 0, align 4
@al1 = common global i32 0, align 4
@rlt2 = common global i32 0, align 4
@al2 = common global i32 0, align 4
@spl = common global i32 0, align 4
@sl = common global i32 0, align 4
@el = common global i32 0, align 4
@detl = common global i32 0, align 4
@il = common global i32 0, align 4
@dlt = common global i32 0, align 4
@nbl = common global i32 0, align 4
@plt = common global i32 0, align 4
@plt1 = common global i32 0, align 4
@plt2 = common global i32 0, align 4
@rlt = common global i32 0, align 4
@delay_bph = common global [6 x i32] zeroinitializer, align 16
@delay_dhx = common global [6 x i32] zeroinitializer, align 16
@szh = common global i32 0, align 4
@rh1 = common global i32 0, align 4
@ah1 = common global i32 0, align 4
@rh2 = common global i32 0, align 4
@ah2 = common global i32 0, align 4
@sph = common global i32 0, align 4
@sh = common global i32 0, align 4
@eh = common global i32 0, align 4
@ih = common global i32 0, align 4
@deth = common global i32 0, align 4
@dh = common global i32 0, align 4
@nbh = common global i32 0, align 4
@ph = common global i32 0, align 4
@ph1 = common global i32 0, align 4
@ph2 = common global i32 0, align 4
@yh = common global i32 0, align 4
@ilr = common global i32 0, align 4
@dec_del_bpl = common global [6 x i32] zeroinitializer, align 16
@dec_del_dltx = common global [6 x i32] zeroinitializer, align 16
@dec_szl = common global i32 0, align 4
@dec_rlt1 = common global i32 0, align 4
@dec_al1 = common global i32 0, align 4
@dec_rlt2 = common global i32 0, align 4
@dec_al2 = common global i32 0, align 4
@dec_spl = common global i32 0, align 4
@dec_sl = common global i32 0, align 4
@dec_detl = common global i32 0, align 4
@dec_dlt = common global i32 0, align 4
@dl = common global i32 0, align 4
@rl = common global i32 0, align 4
@dec_nbl = common global i32 0, align 4
@dec_plt = common global i32 0, align 4
@dec_plt1 = common global i32 0, align 4
@dec_plt2 = common global i32 0, align 4
@dec_rlt = common global i32 0, align 4
@dec_del_bph = common global [6 x i32] zeroinitializer, align 16
@dec_del_dhx = common global [6 x i32] zeroinitializer, align 16
@dec_szh = common global i32 0, align 4
@dec_rh1 = common global i32 0, align 4
@dec_ah1 = common global i32 0, align 4
@dec_rh2 = common global i32 0, align 4
@dec_ah2 = common global i32 0, align 4
@dec_sph = common global i32 0, align 4
@dec_sh = common global i32 0, align 4
@dec_deth = common global i32 0, align 4
@dec_dh = common global i32 0, align 4
@dec_nbh = common global i32 0, align 4
@dec_ph = common global i32 0, align 4
@dec_ph1 = common global i32 0, align 4
@dec_ph2 = common global i32 0, align 4
@rh = common global i32 0, align 4
@xd = common global i32 0, align 4
@xs = common global i32 0, align 4
@accumc = common global [11 x i32] zeroinitializer, align 16
@accumd = common global [11 x i32] zeroinitializer, align 16
@xout1 = common global i32 0, align 4
@xout2 = common global i32 0, align 4
@main.test_data = internal global [6 x i32] zeroinitializer, align 16
@main.compressed = internal global [3 x i32] zeroinitializer, align 4
@main.result = internal global [6 x i32] zeroinitializer, align 16
@rs = common global i32 0, align 4
@yl = common global i32 0, align 4
@dec_yh = common global i32 0, align 4
@dec_rh = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @my_abs(i32 %n) #0 {
  %1 = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  store i32 %5, i32* %m, align 4
  br label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = sub nsw i32 0, %7
  store i32 %8, i32* %m, align 4
  br label %9

; <label>:9                                       ; preds = %6, %4
  %10 = load i32* %m, align 4
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @my_fabs(i32 %n) #0 {
  %1 = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  store i32 %5, i32* %f, align 4
  br label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = sub nsw i32 0, %7
  store i32 %8, i32* %f, align 4
  br label %9

; <label>:9                                       ; preds = %6, %4
  %10 = load i32* %f, align 4
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @my_sin(i32 %rad) #0 {
  %1 = alloca i32, align 4
  %diff = alloca i32, align 4
  %app = alloca i32, align 4
  %inc = alloca i32, align 4
  store i32 %rad, i32* %1, align 4
  store i32 0, i32* %app, align 4
  store i32 1, i32* %inc, align 4
  br label %2

; <label>:2                                       ; preds = %5, %0
  %3 = load i32* %1, align 4
  %4 = icmp sgt i32 %3, 6282
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %2
  %6 = load i32* %1, align 4
  %7 = sub nsw i32 %6, 6282
  store i32 %7, i32* %1, align 4
  br label %2

; <label>:8                                       ; preds = %2
  br label %9

; <label>:9                                       ; preds = %12, %8
  %10 = load i32* %1, align 4
  %11 = icmp slt i32 %10, -6282
  br i1 %11, label %12, label %15

; <label>:12                                      ; preds = %9
  %13 = load i32* %1, align 4
  %14 = add nsw i32 %13, 6282
  store i32 %14, i32* %1, align 4
  br label %9

; <label>:15                                      ; preds = %9
  %16 = load i32* %1, align 4
  store i32 %16, i32* %diff, align 4
  %17 = load i32* %diff, align 4
  store i32 %17, i32* %app, align 4
  %18 = load i32* %diff, align 4
  %19 = load i32* %1, align 4
  %20 = load i32* %1, align 4
  %21 = mul nsw i32 %19, %20
  %22 = sub nsw i32 0, %21
  %23 = mul nsw i32 %18, %22
  %24 = load i32* %inc, align 4
  %25 = mul nsw i32 2, %24
  %26 = load i32* %inc, align 4
  %27 = mul nsw i32 2, %26
  %28 = add nsw i32 %27, 1
  %29 = mul nsw i32 %25, %28
  %30 = sdiv i32 %23, %29
  store i32 %30, i32* %diff, align 4
  %31 = load i32* %app, align 4
  %32 = load i32* %diff, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, i32* %app, align 4
  %34 = load i32* %inc, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %inc, align 4
  br label %36

; <label>:36                                      ; preds = %40, %15
  %37 = load i32* %diff, align 4
  %38 = call i32 @my_fabs(i32 %37)
  %39 = icmp sge i32 %38, 1
  br i1 %39, label %40, label %59

; <label>:40                                      ; preds = %36
  %41 = load i32* %diff, align 4
  %42 = load i32* %1, align 4
  %43 = load i32* %1, align 4
  %44 = mul nsw i32 %42, %43
  %45 = sub nsw i32 0, %44
  %46 = mul nsw i32 %41, %45
  %47 = load i32* %inc, align 4
  %48 = mul nsw i32 2, %47
  %49 = load i32* %inc, align 4
  %50 = mul nsw i32 2, %49
  %51 = add nsw i32 %50, 1
  %52 = mul nsw i32 %48, %51
  %53 = sdiv i32 %46, %52
  store i32 %53, i32* %diff, align 4
  %54 = load i32* %app, align 4
  %55 = load i32* %diff, align 4
  %56 = add nsw i32 %54, %55
  store i32 %56, i32* %app, align 4
  %57 = load i32* %inc, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %inc, align 4
  br label %36

; <label>:59                                      ; preds = %36
  %60 = load i32* %app, align 4
  ret i32 %60
}

; Function Attrs: nounwind uwtable
define i32 @my_cos(i32 %rad) #0 {
  %1 = alloca i32, align 4
  store i32 %rad, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sub nsw i32 1570, %2
  %4 = call i32 @my_sin(i32 %3)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @encode(i32 %xin1, i32 %xin2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %h_ptr = alloca i32*, align 8
  %tqmf_ptr = alloca i32*, align 8
  %tqmf_ptr1 = alloca i32*, align 8
  %xa = alloca i64, align 8
  %xb = alloca i64, align 8
  %decis = alloca i32, align 4
  store i32 %xin1, i32* %1, align 4
  store i32 %xin2, i32* %2, align 4
  store i32* getelementptr inbounds ([24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8
  store i32* getelementptr inbounds ([24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8
  %3 = load i32** %tqmf_ptr, align 8
  %4 = getelementptr inbounds i32* %3, i32 1
  store i32* %4, i32** %tqmf_ptr, align 8
  %5 = load i32* %3, align 4
  %6 = sext i32 %5 to i64
  %7 = load i32** %h_ptr, align 8
  %8 = getelementptr inbounds i32* %7, i32 1
  store i32* %8, i32** %h_ptr, align 8
  %9 = load i32* %7, align 4
  %10 = sext i32 %9 to i64
  %11 = mul nsw i64 %6, %10
  store i64 %11, i64* %xa, align 8
  %12 = load i32** %tqmf_ptr, align 8
  %13 = getelementptr inbounds i32* %12, i32 1
  store i32* %13, i32** %tqmf_ptr, align 8
  %14 = load i32* %12, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32** %h_ptr, align 8
  %17 = getelementptr inbounds i32* %16, i32 1
  store i32* %17, i32** %h_ptr, align 8
  %18 = load i32* %16, align 4
  %19 = sext i32 %18 to i64
  %20 = mul nsw i64 %15, %19
  store i64 %20, i64* %xb, align 8
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %47, %0
  %22 = load i32* %i, align 4
  %23 = icmp slt i32 %22, 10
  br i1 %23, label %24, label %50

; <label>:24                                      ; preds = %21
  %25 = load i32** %tqmf_ptr, align 8
  %26 = getelementptr inbounds i32* %25, i32 1
  store i32* %26, i32** %tqmf_ptr, align 8
  %27 = load i32* %25, align 4
  %28 = sext i32 %27 to i64
  %29 = load i32** %h_ptr, align 8
  %30 = getelementptr inbounds i32* %29, i32 1
  store i32* %30, i32** %h_ptr, align 8
  %31 = load i32* %29, align 4
  %32 = sext i32 %31 to i64
  %33 = mul nsw i64 %28, %32
  %34 = load i64* %xa, align 8
  %35 = add nsw i64 %34, %33
  store i64 %35, i64* %xa, align 8
  %36 = load i32** %tqmf_ptr, align 8
  %37 = getelementptr inbounds i32* %36, i32 1
  store i32* %37, i32** %tqmf_ptr, align 8
  %38 = load i32* %36, align 4
  %39 = sext i32 %38 to i64
  %40 = load i32** %h_ptr, align 8
  %41 = getelementptr inbounds i32* %40, i32 1
  store i32* %41, i32** %h_ptr, align 8
  %42 = load i32* %40, align 4
  %43 = sext i32 %42 to i64
  %44 = mul nsw i64 %39, %43
  %45 = load i64* %xb, align 8
  %46 = add nsw i64 %45, %44
  store i64 %46, i64* %xb, align 8
  br label %47

; <label>:47                                      ; preds = %24
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %21

; <label>:50                                      ; preds = %21
  %51 = load i32** %tqmf_ptr, align 8
  %52 = getelementptr inbounds i32* %51, i32 1
  store i32* %52, i32** %tqmf_ptr, align 8
  %53 = load i32* %51, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32** %h_ptr, align 8
  %56 = getelementptr inbounds i32* %55, i32 1
  store i32* %56, i32** %h_ptr, align 8
  %57 = load i32* %55, align 4
  %58 = sext i32 %57 to i64
  %59 = mul nsw i64 %54, %58
  %60 = load i64* %xa, align 8
  %61 = add nsw i64 %60, %59
  store i64 %61, i64* %xa, align 8
  %62 = load i32** %tqmf_ptr, align 8
  %63 = load i32* %62, align 4
  %64 = sext i32 %63 to i64
  %65 = load i32** %h_ptr, align 8
  %66 = getelementptr inbounds i32* %65, i32 1
  store i32* %66, i32** %h_ptr, align 8
  %67 = load i32* %65, align 4
  %68 = sext i32 %67 to i64
  %69 = mul nsw i64 %64, %68
  %70 = load i64* %xb, align 8
  %71 = add nsw i64 %70, %69
  store i64 %71, i64* %xb, align 8
  %72 = load i32** %tqmf_ptr, align 8
  %73 = getelementptr inbounds i32* %72, i64 -2
  store i32* %73, i32** %tqmf_ptr1, align 8
  store i32 0, i32* %i, align 4
  br label %74

; <label>:74                                      ; preds = %83, %50
  %75 = load i32* %i, align 4
  %76 = icmp slt i32 %75, 22
  br i1 %76, label %77, label %86

; <label>:77                                      ; preds = %74
  %78 = load i32** %tqmf_ptr1, align 8
  %79 = getelementptr inbounds i32* %78, i32 -1
  store i32* %79, i32** %tqmf_ptr1, align 8
  %80 = load i32* %78, align 4
  %81 = load i32** %tqmf_ptr, align 8
  %82 = getelementptr inbounds i32* %81, i32 -1
  store i32* %82, i32** %tqmf_ptr, align 8
  store i32 %80, i32* %81, align 4
  br label %83

; <label>:83                                      ; preds = %77
  %84 = load i32* %i, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %i, align 4
  br label %74

; <label>:86                                      ; preds = %74
  %87 = load i32* %1, align 4
  %88 = load i32** %tqmf_ptr, align 8
  %89 = getelementptr inbounds i32* %88, i32 -1
  store i32* %89, i32** %tqmf_ptr, align 8
  store i32 %87, i32* %88, align 4
  %90 = load i32* %2, align 4
  %91 = load i32** %tqmf_ptr, align 8
  store i32 %90, i32* %91, align 4
  %92 = load i64* %xa, align 8
  %93 = load i64* %xb, align 8
  %94 = add nsw i64 %92, %93
  %95 = ashr i64 %94, 15
  %96 = trunc i64 %95 to i32
  store i32 %96, i32* @xl, align 4
  %97 = load i64* %xa, align 8
  %98 = load i64* %xb, align 8
  %99 = sub nsw i64 %97, %98
  %100 = ashr i64 %99, 15
  %101 = trunc i64 %100 to i32
  store i32 %101, i32* @xh, align 4
  %102 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i32 0, i32 0))
  store i32 %102, i32* @szl, align 4
  %103 = load i32* @rlt1, align 4
  %104 = load i32* @al1, align 4
  %105 = load i32* @rlt2, align 4
  %106 = load i32* @al2, align 4
  %107 = call i32 @filtep(i32 %103, i32 %104, i32 %105, i32 %106)
  store i32 %107, i32* @spl, align 4
  %108 = load i32* @szl, align 4
  %109 = load i32* @spl, align 4
  %110 = add nsw i32 %108, %109
  store i32 %110, i32* @sl, align 4
  %111 = load i32* @xl, align 4
  %112 = load i32* @sl, align 4
  %113 = sub nsw i32 %111, %112
  store i32 %113, i32* @el, align 4
  %114 = load i32* @el, align 4
  %115 = load i32* @detl, align 4
  %116 = call i32 @quantl(i32 %114, i32 %115)
  store i32 %116, i32* @il, align 4
  %117 = load i32* @detl, align 4
  %118 = sext i32 %117 to i64
  %119 = load i32* @il, align 4
  %120 = ashr i32 %119, 2
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [16 x i32]* @qq4_code4_table, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = mul nsw i64 %118, %124
  %126 = ashr i64 %125, 15
  %127 = trunc i64 %126 to i32
  store i32 %127, i32* @dlt, align 4
  %128 = load i32* @il, align 4
  %129 = load i32* @nbl, align 4
  %130 = call i32 @logscl(i32 %128, i32 %129)
  store i32 %130, i32* @nbl, align 4
  %131 = load i32* @nbl, align 4
  %132 = call i32 @scalel(i32 %131, i32 8)
  store i32 %132, i32* @detl, align 4
  %133 = load i32* @dlt, align 4
  %134 = load i32* @szl, align 4
  %135 = add nsw i32 %133, %134
  store i32 %135, i32* @plt, align 4
  %136 = load i32* @dlt, align 4
  call void @upzero(i32 %136, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i32 0, i32 0))
  %137 = load i32* @al1, align 4
  %138 = load i32* @al2, align 4
  %139 = load i32* @plt, align 4
  %140 = load i32* @plt1, align 4
  %141 = load i32* @plt2, align 4
  %142 = call i32 @uppol2(i32 %137, i32 %138, i32 %139, i32 %140, i32 %141)
  store i32 %142, i32* @al2, align 4
  %143 = load i32* @al1, align 4
  %144 = load i32* @al2, align 4
  %145 = load i32* @plt, align 4
  %146 = load i32* @plt1, align 4
  %147 = call i32 @uppol1(i32 %143, i32 %144, i32 %145, i32 %146)
  store i32 %147, i32* @al1, align 4
  %148 = load i32* @sl, align 4
  %149 = load i32* @dlt, align 4
  %150 = add nsw i32 %148, %149
  store i32 %150, i32* @rlt, align 4
  %151 = load i32* @rlt1, align 4
  store i32 %151, i32* @rlt2, align 4
  %152 = load i32* @rlt, align 4
  store i32 %152, i32* @rlt1, align 4
  %153 = load i32* @plt1, align 4
  store i32 %153, i32* @plt2, align 4
  %154 = load i32* @plt, align 4
  store i32 %154, i32* @plt1, align 4
  %155 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i32 0, i32 0))
  store i32 %155, i32* @szh, align 4
  %156 = load i32* @rh1, align 4
  %157 = load i32* @ah1, align 4
  %158 = load i32* @rh2, align 4
  %159 = load i32* @ah2, align 4
  %160 = call i32 @filtep(i32 %156, i32 %157, i32 %158, i32 %159)
  store i32 %160, i32* @sph, align 4
  %161 = load i32* @sph, align 4
  %162 = load i32* @szh, align 4
  %163 = add nsw i32 %161, %162
  store i32 %163, i32* @sh, align 4
  %164 = load i32* @xh, align 4
  %165 = load i32* @sh, align 4
  %166 = sub nsw i32 %164, %165
  store i32 %166, i32* @eh, align 4
  %167 = load i32* @eh, align 4
  %168 = icmp sge i32 %167, 0
  br i1 %168, label %169, label %170

; <label>:169                                     ; preds = %86
  store i32 3, i32* @ih, align 4
  br label %171

; <label>:170                                     ; preds = %86
  store i32 1, i32* @ih, align 4
  br label %171

; <label>:171                                     ; preds = %170, %169
  %172 = load i32* @deth, align 4
  %173 = sext i32 %172 to i64
  %174 = mul nsw i64 564, %173
  %175 = ashr i64 %174, 12
  %176 = trunc i64 %175 to i32
  store i32 %176, i32* %decis, align 4
  %177 = load i32* @eh, align 4
  %178 = call i32 @my_abs(i32 %177)
  %179 = load i32* %decis, align 4
  %180 = icmp sgt i32 %178, %179
  br i1 %180, label %181, label %184

; <label>:181                                     ; preds = %171
  %182 = load i32* @ih, align 4
  %183 = add nsw i32 %182, -1
  store i32 %183, i32* @ih, align 4
  br label %184

; <label>:184                                     ; preds = %181, %171
  %185 = load i32* @deth, align 4
  %186 = sext i32 %185 to i64
  %187 = load i32* @ih, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [4 x i32]* @qq2_code2_table, i32 0, i64 %188
  %190 = load i32* %189, align 4
  %191 = sext i32 %190 to i64
  %192 = mul nsw i64 %186, %191
  %193 = ashr i64 %192, 15
  %194 = trunc i64 %193 to i32
  store i32 %194, i32* @dh, align 4
  %195 = load i32* @ih, align 4
  %196 = load i32* @nbh, align 4
  %197 = call i32 @logsch(i32 %195, i32 %196)
  store i32 %197, i32* @nbh, align 4
  %198 = load i32* @nbh, align 4
  %199 = call i32 @scalel(i32 %198, i32 10)
  store i32 %199, i32* @deth, align 4
  %200 = load i32* @dh, align 4
  %201 = load i32* @szh, align 4
  %202 = add nsw i32 %200, %201
  store i32 %202, i32* @ph, align 4
  %203 = load i32* @dh, align 4
  call void @upzero(i32 %203, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @delay_bph, i32 0, i32 0))
  %204 = load i32* @ah1, align 4
  %205 = load i32* @ah2, align 4
  %206 = load i32* @ph, align 4
  %207 = load i32* @ph1, align 4
  %208 = load i32* @ph2, align 4
  %209 = call i32 @uppol2(i32 %204, i32 %205, i32 %206, i32 %207, i32 %208)
  store i32 %209, i32* @ah2, align 4
  %210 = load i32* @ah1, align 4
  %211 = load i32* @ah2, align 4
  %212 = load i32* @ph, align 4
  %213 = load i32* @ph1, align 4
  %214 = call i32 @uppol1(i32 %210, i32 %211, i32 %212, i32 %213)
  store i32 %214, i32* @ah1, align 4
  %215 = load i32* @sh, align 4
  %216 = load i32* @dh, align 4
  %217 = add nsw i32 %215, %216
  store i32 %217, i32* @yh, align 4
  %218 = load i32* @rh1, align 4
  store i32 %218, i32* @rh2, align 4
  %219 = load i32* @yh, align 4
  store i32 %219, i32* @rh1, align 4
  %220 = load i32* @ph1, align 4
  store i32 %220, i32* @ph2, align 4
  %221 = load i32* @ph, align 4
  store i32 %221, i32* @ph1, align 4
  %222 = load i32* @il, align 4
  %223 = load i32* @ih, align 4
  %224 = shl i32 %223, 6
  %225 = or i32 %222, %224
  ret i32 %225
}

; Function Attrs: nounwind uwtable
define i32 @filtez(i32* %bpl, i32* %dlt) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %i = alloca i32, align 4
  %zl = alloca i64, align 8
  store i32* %bpl, i32** %1, align 8
  store i32* %dlt, i32** %2, align 8
  %3 = load i32** %1, align 8
  %4 = getelementptr inbounds i32* %3, i32 1
  store i32* %4, i32** %1, align 8
  %5 = load i32* %3, align 4
  %6 = sext i32 %5 to i64
  %7 = load i32** %2, align 8
  %8 = getelementptr inbounds i32* %7, i32 1
  store i32* %8, i32** %2, align 8
  %9 = load i32* %7, align 4
  %10 = sext i32 %9 to i64
  %11 = mul nsw i64 %6, %10
  store i64 %11, i64* %zl, align 8
  store i32 1, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %27, %0
  %13 = load i32* %i, align 4
  %14 = icmp slt i32 %13, 6
  br i1 %14, label %15, label %30

; <label>:15                                      ; preds = %12
  %16 = load i32** %1, align 8
  %17 = getelementptr inbounds i32* %16, i32 1
  store i32* %17, i32** %1, align 8
  %18 = load i32* %16, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32** %2, align 8
  %21 = getelementptr inbounds i32* %20, i32 1
  store i32* %21, i32** %2, align 8
  %22 = load i32* %20, align 4
  %23 = sext i32 %22 to i64
  %24 = mul nsw i64 %19, %23
  %25 = load i64* %zl, align 8
  %26 = add nsw i64 %25, %24
  store i64 %26, i64* %zl, align 8
  br label %27

; <label>:27                                      ; preds = %15
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %12

; <label>:30                                      ; preds = %12
  %31 = load i64* %zl, align 8
  %32 = ashr i64 %31, 14
  %33 = trunc i64 %32 to i32
  ret i32 %33
}

; Function Attrs: nounwind uwtable
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %pl = alloca i64, align 8
  %pl2 = alloca i64, align 8
  store i32 %rlt1, i32* %1, align 4
  store i32 %al1, i32* %2, align 4
  store i32 %rlt2, i32* %3, align 4
  store i32 %al2, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = mul nsw i32 2, %5
  %7 = sext i32 %6 to i64
  store i64 %7, i64* %pl, align 8
  %8 = load i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = load i64* %pl, align 8
  %11 = mul nsw i64 %9, %10
  store i64 %11, i64* %pl, align 8
  %12 = load i32* %3, align 4
  %13 = mul nsw i32 2, %12
  %14 = sext i32 %13 to i64
  store i64 %14, i64* %pl2, align 8
  %15 = load i32* %4, align 4
  %16 = sext i32 %15 to i64
  %17 = load i64* %pl2, align 8
  %18 = mul nsw i64 %16, %17
  %19 = load i64* %pl, align 8
  %20 = add nsw i64 %19, %18
  store i64 %20, i64* %pl, align 8
  %21 = load i64* %pl, align 8
  %22 = ashr i64 %21, 15
  %23 = trunc i64 %22 to i32
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @quantl(i32 %el, i32 %detl) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %ril = alloca i32, align 4
  %mil = alloca i32, align 4
  %wd = alloca i64, align 8
  %decis = alloca i64, align 8
  store i32 %el, i32* %1, align 4
  store i32 %detl, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = call i32 @my_abs(i32 %3)
  %5 = sext i32 %4 to i64
  store i64 %5, i64* %wd, align 8
  store i32 0, i32* %mil, align 4
  br label %6

; <label>:6                                       ; preds = %24, %0
  %7 = load i32* %mil, align 4
  %8 = icmp slt i32 %7, 30
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %6
  %10 = load i32* %mil, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [30 x i32]* @decis_levl, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32* %2, align 4
  %16 = sext i32 %15 to i64
  %17 = mul nsw i64 %14, %16
  %18 = ashr i64 %17, 15
  store i64 %18, i64* %decis, align 8
  %19 = load i64* %wd, align 8
  %20 = load i64* %decis, align 8
  %21 = icmp sle i64 %19, %20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %9
  br label %27

; <label>:23                                      ; preds = %9
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32* %mil, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %mil, align 4
  br label %6

; <label>:27                                      ; preds = %22, %6
  %28 = load i32* %1, align 4
  %29 = icmp sge i32 %28, 0
  br i1 %29, label %30, label %35

; <label>:30                                      ; preds = %27
  %31 = load i32* %mil, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [31 x i32]* @quant26bt_pos, i32 0, i64 %32
  %34 = load i32* %33, align 4
  store i32 %34, i32* %ril, align 4
  br label %40

; <label>:35                                      ; preds = %27
  %36 = load i32* %mil, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [31 x i32]* @quant26bt_neg, i32 0, i64 %37
  %39 = load i32* %38, align 4
  store i32 %39, i32* %ril, align 4
  br label %40

; <label>:40                                      ; preds = %35, %30
  %41 = load i32* %ril, align 4
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define i32 @logscl(i32 %il, i32 %nbl) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %wd = alloca i64, align 8
  store i32 %il, i32* %1, align 4
  store i32 %nbl, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = mul nsw i64 %4, 127
  %6 = ashr i64 %5, 7
  store i64 %6, i64* %wd, align 8
  %7 = load i64* %wd, align 8
  %8 = trunc i64 %7 to i32
  %9 = load i32* %1, align 4
  %10 = ashr i32 %9, 2
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [16 x i32]* @wl_code_table, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %8, %13
  store i32 %14, i32* %2, align 4
  %15 = load i32* %2, align 4
  %16 = icmp slt i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  store i32 0, i32* %2, align 4
  br label %18

; <label>:18                                      ; preds = %17, %0
  %19 = load i32* %2, align 4
  %20 = icmp sgt i32 %19, 18432
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  store i32 18432, i32* %2, align 4
  br label %22

; <label>:22                                      ; preds = %21, %18
  %23 = load i32* %2, align 4
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @scalel(i32 %nbl, i32 %shift_constant) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %wd1 = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %nbl, i32* %1, align 4
  store i32 %shift_constant, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = ashr i32 %3, 6
  %5 = and i32 %4, 31
  store i32 %5, i32* %wd1, align 4
  %6 = load i32* %1, align 4
  %7 = ashr i32 %6, 11
  store i32 %7, i32* %wd2, align 4
  %8 = load i32* %wd1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [32 x i32]* @ilb_table, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = load i32* %2, align 4
  %13 = add nsw i32 %12, 1
  %14 = load i32* %wd2, align 4
  %15 = sub nsw i32 %13, %14
  %16 = ashr i32 %11, %15
  store i32 %16, i32* %wd3, align 4
  %17 = load i32* %wd3, align 4
  %18 = shl i32 %17, 3
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %i = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %dlt, i32* %1, align 4
  store i32* %dlti, i32** %2, align 8
  store i32* %bli, i32** %3, align 8
  %4 = load i32* %1, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %28

; <label>:6                                       ; preds = %0
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %24, %6
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 6
  br i1 %9, label %10, label %27

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = load i32** %3, align 8
  %14 = getelementptr inbounds i32* %13, i64 %12
  %15 = load i32* %14, align 4
  %16 = sext i32 %15 to i64
  %17 = mul nsw i64 255, %16
  %18 = ashr i64 %17, 8
  %19 = trunc i64 %18 to i32
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32** %3, align 8
  %23 = getelementptr inbounds i32* %22, i64 %21
  store i32 %19, i32* %23, align 4
  br label %24

; <label>:24                                      ; preds = %10
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %7

; <label>:27                                      ; preds = %7
  br label %66

; <label>:28                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %29

; <label>:29                                      ; preds = %62, %28
  %30 = load i32* %i, align 4
  %31 = icmp slt i32 %30, 6
  br i1 %31, label %32, label %65

; <label>:32                                      ; preds = %29
  %33 = load i32* %1, align 4
  %34 = sext i32 %33 to i64
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32** %2, align 8
  %38 = getelementptr inbounds i32* %37, i64 %36
  %39 = load i32* %38, align 4
  %40 = sext i32 %39 to i64
  %41 = mul nsw i64 %34, %40
  %42 = icmp sge i64 %41, 0
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %32
  store i32 128, i32* %wd2, align 4
  br label %45

; <label>:44                                      ; preds = %32
  store i32 -128, i32* %wd2, align 4
  br label %45

; <label>:45                                      ; preds = %44, %43
  %46 = load i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = load i32** %3, align 8
  %49 = getelementptr inbounds i32* %48, i64 %47
  %50 = load i32* %49, align 4
  %51 = sext i32 %50 to i64
  %52 = mul nsw i64 255, %51
  %53 = ashr i64 %52, 8
  %54 = trunc i64 %53 to i32
  store i32 %54, i32* %wd3, align 4
  %55 = load i32* %wd2, align 4
  %56 = load i32* %wd3, align 4
  %57 = add nsw i32 %55, %56
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load i32** %3, align 8
  %61 = getelementptr inbounds i32* %60, i64 %59
  store i32 %57, i32* %61, align 4
  br label %62

; <label>:62                                      ; preds = %45
  %63 = load i32* %i, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %i, align 4
  br label %29

; <label>:65                                      ; preds = %29
  br label %66

; <label>:66                                      ; preds = %65, %27
  %67 = load i32** %2, align 8
  %68 = getelementptr inbounds i32* %67, i64 4
  %69 = load i32* %68, align 4
  %70 = load i32** %2, align 8
  %71 = getelementptr inbounds i32* %70, i64 5
  store i32 %69, i32* %71, align 4
  %72 = load i32** %2, align 8
  %73 = getelementptr inbounds i32* %72, i64 3
  %74 = load i32* %73, align 4
  %75 = load i32** %2, align 8
  %76 = getelementptr inbounds i32* %75, i64 4
  store i32 %74, i32* %76, align 4
  %77 = load i32** %2, align 8
  %78 = getelementptr inbounds i32* %77, i64 2
  %79 = load i32* %78, align 4
  %80 = load i32** %2, align 8
  %81 = getelementptr inbounds i32* %80, i64 3
  store i32 %79, i32* %81, align 4
  %82 = load i32** %2, align 8
  %83 = getelementptr inbounds i32* %82, i64 0
  %84 = load i32* %83, align 4
  %85 = load i32** %2, align 8
  %86 = getelementptr inbounds i32* %85, i64 1
  store i32 %84, i32* %86, align 4
  %87 = load i32* %1, align 4
  %88 = load i32** %2, align 8
  %89 = getelementptr inbounds i32* %88, i64 0
  store i32 %87, i32* %89, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %wd2 = alloca i64, align 8
  %wd4 = alloca i64, align 8
  %apl2 = alloca i32, align 4
  store i32 %al1, i32* %1, align 4
  store i32 %al2, i32* %2, align 4
  store i32 %plt, i32* %3, align 4
  store i32 %plt1, i32* %4, align 4
  store i32 %plt2, i32* %5, align 4
  %6 = load i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = mul nsw i64 4, %7
  store i64 %8, i64* %wd2, align 8
  %9 = load i32* %3, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %4, align 4
  %12 = sext i32 %11 to i64
  %13 = mul nsw i64 %10, %12
  %14 = icmp sge i64 %13, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %0
  %16 = load i64* %wd2, align 8
  %17 = sub nsw i64 0, %16
  store i64 %17, i64* %wd2, align 8
  br label %18

; <label>:18                                      ; preds = %15, %0
  %19 = load i64* %wd2, align 8
  %20 = ashr i64 %19, 7
  store i64 %20, i64* %wd2, align 8
  %21 = load i32* %3, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32* %5, align 4
  %24 = sext i32 %23 to i64
  %25 = mul nsw i64 %22, %24
  %26 = icmp sge i64 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %18
  %28 = load i64* %wd2, align 8
  %29 = add nsw i64 %28, 128
  store i64 %29, i64* %wd4, align 8
  br label %33

; <label>:30                                      ; preds = %18
  %31 = load i64* %wd2, align 8
  %32 = sub nsw i64 %31, 128
  store i64 %32, i64* %wd4, align 8
  br label %33

; <label>:33                                      ; preds = %30, %27
  %34 = load i64* %wd4, align 8
  %35 = load i32* %2, align 4
  %36 = sext i32 %35 to i64
  %37 = mul nsw i64 127, %36
  %38 = ashr i64 %37, 7
  %39 = add nsw i64 %34, %38
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* %apl2, align 4
  %41 = load i32* %apl2, align 4
  %42 = icmp sgt i32 %41, 12288
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %33
  store i32 12288, i32* %apl2, align 4
  br label %44

; <label>:44                                      ; preds = %43, %33
  %45 = load i32* %apl2, align 4
  %46 = icmp slt i32 %45, -12288
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %44
  store i32 -12288, i32* %apl2, align 4
  br label %48

; <label>:48                                      ; preds = %47, %44
  %49 = load i32* %apl2, align 4
  ret i32 %49
}

; Function Attrs: nounwind uwtable
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %wd2 = alloca i64, align 8
  %wd3 = alloca i32, align 4
  %apl1 = alloca i32, align 4
  store i32 %al1, i32* %1, align 4
  store i32 %apl2, i32* %2, align 4
  store i32 %plt, i32* %3, align 4
  store i32 %plt1, i32* %4, align 4
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = mul nsw i64 %6, 255
  %8 = ashr i64 %7, 8
  store i64 %8, i64* %wd2, align 8
  %9 = load i32* %3, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32* %4, align 4
  %12 = sext i32 %11 to i64
  %13 = mul nsw i64 %10, %12
  %14 = icmp sge i64 %13, 0
  br i1 %14, label %15, label %19

; <label>:15                                      ; preds = %0
  %16 = load i64* %wd2, align 8
  %17 = trunc i64 %16 to i32
  %18 = add nsw i32 %17, 192
  store i32 %18, i32* %apl1, align 4
  br label %23

; <label>:19                                      ; preds = %0
  %20 = load i64* %wd2, align 8
  %21 = trunc i64 %20 to i32
  %22 = sub nsw i32 %21, 192
  store i32 %22, i32* %apl1, align 4
  br label %23

; <label>:23                                      ; preds = %19, %15
  %24 = load i32* %2, align 4
  %25 = sub nsw i32 15360, %24
  store i32 %25, i32* %wd3, align 4
  %26 = load i32* %apl1, align 4
  %27 = load i32* %wd3, align 4
  %28 = icmp sgt i32 %26, %27
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %23
  %30 = load i32* %wd3, align 4
  store i32 %30, i32* %apl1, align 4
  br label %31

; <label>:31                                      ; preds = %29, %23
  %32 = load i32* %apl1, align 4
  %33 = load i32* %wd3, align 4
  %34 = sub nsw i32 0, %33
  %35 = icmp slt i32 %32, %34
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %31
  %37 = load i32* %wd3, align 4
  %38 = sub nsw i32 0, %37
  store i32 %38, i32* %apl1, align 4
  br label %39

; <label>:39                                      ; preds = %36, %31
  %40 = load i32* %apl1, align 4
  ret i32 %40
}

; Function Attrs: nounwind uwtable
define i32 @logsch(i32 %ih, i32 %nbh) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %wd = alloca i32, align 4
  store i32 %ih, i32* %1, align 4
  store i32 %nbh, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = mul nsw i64 %4, 127
  %6 = ashr i64 %5, 7
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %wd, align 4
  %8 = load i32* %wd, align 4
  %9 = load i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [4 x i32]* @wh_code_table, i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = add nsw i32 %8, %12
  store i32 %13, i32* %2, align 4
  %14 = load i32* %2, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  store i32 0, i32* %2, align 4
  br label %17

; <label>:17                                      ; preds = %16, %0
  %18 = load i32* %2, align 4
  %19 = icmp sgt i32 %18, 22528
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  store i32 22528, i32* %2, align 4
  br label %21

; <label>:21                                      ; preds = %20, %17
  %22 = load i32* %2, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define void @decode(i32 %input) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %xa1 = alloca i64, align 8
  %xa2 = alloca i64, align 8
  %h_ptr = alloca i32*, align 8
  %ac_ptr = alloca i32*, align 8
  %ac_ptr1 = alloca i32*, align 8
  %ad_ptr = alloca i32*, align 8
  %ad_ptr1 = alloca i32*, align 8
  store i32 %input, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 63
  store i32 %3, i32* @ilr, align 4
  %4 = load i32* %1, align 4
  %5 = ashr i32 %4, 6
  store i32 %5, i32* @ih, align 4
  %6 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i32 0, i32 0))
  store i32 %6, i32* @dec_szl, align 4
  %7 = load i32* @dec_rlt1, align 4
  %8 = load i32* @dec_al1, align 4
  %9 = load i32* @dec_rlt2, align 4
  %10 = load i32* @dec_al2, align 4
  %11 = call i32 @filtep(i32 %7, i32 %8, i32 %9, i32 %10)
  store i32 %11, i32* @dec_spl, align 4
  %12 = load i32* @dec_spl, align 4
  %13 = load i32* @dec_szl, align 4
  %14 = add nsw i32 %12, %13
  store i32 %14, i32* @dec_sl, align 4
  %15 = load i32* @dec_detl, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32* @ilr, align 4
  %18 = ashr i32 %17, 2
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [16 x i32]* @qq4_code4_table, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = mul nsw i64 %16, %22
  %24 = ashr i64 %23, 15
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* @dec_dlt, align 4
  %26 = load i32* @dec_detl, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32* @il, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [64 x i32]* @qq6_code6_table, i32 0, i64 %29
  %31 = load i32* %30, align 4
  %32 = sext i32 %31 to i64
  %33 = mul nsw i64 %27, %32
  %34 = ashr i64 %33, 15
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* @dl, align 4
  %36 = load i32* @dl, align 4
  %37 = load i32* @dec_sl, align 4
  %38 = add nsw i32 %36, %37
  store i32 %38, i32* @rl, align 4
  %39 = load i32* @ilr, align 4
  %40 = load i32* @dec_nbl, align 4
  %41 = call i32 @logscl(i32 %39, i32 %40)
  store i32 %41, i32* @dec_nbl, align 4
  %42 = load i32* @dec_nbl, align 4
  %43 = call i32 @scalel(i32 %42, i32 8)
  store i32 %43, i32* @dec_detl, align 4
  %44 = load i32* @dec_dlt, align 4
  %45 = load i32* @dec_szl, align 4
  %46 = add nsw i32 %44, %45
  store i32 %46, i32* @dec_plt, align 4
  %47 = load i32* @dec_dlt, align 4
  call void @upzero(i32 %47, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i32 0, i32 0))
  %48 = load i32* @dec_al1, align 4
  %49 = load i32* @dec_al2, align 4
  %50 = load i32* @dec_plt, align 4
  %51 = load i32* @dec_plt1, align 4
  %52 = load i32* @dec_plt2, align 4
  %53 = call i32 @uppol2(i32 %48, i32 %49, i32 %50, i32 %51, i32 %52)
  store i32 %53, i32* @dec_al2, align 4
  %54 = load i32* @dec_al1, align 4
  %55 = load i32* @dec_al2, align 4
  %56 = load i32* @dec_plt, align 4
  %57 = load i32* @dec_plt1, align 4
  %58 = call i32 @uppol1(i32 %54, i32 %55, i32 %56, i32 %57)
  store i32 %58, i32* @dec_al1, align 4
  %59 = load i32* @dec_sl, align 4
  %60 = load i32* @dec_dlt, align 4
  %61 = add nsw i32 %59, %60
  store i32 %61, i32* @dec_rlt, align 4
  %62 = load i32* @dec_rlt1, align 4
  store i32 %62, i32* @dec_rlt2, align 4
  %63 = load i32* @dec_rlt, align 4
  store i32 %63, i32* @dec_rlt1, align 4
  %64 = load i32* @dec_plt1, align 4
  store i32 %64, i32* @dec_plt2, align 4
  %65 = load i32* @dec_plt, align 4
  store i32 %65, i32* @dec_plt1, align 4
  %66 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i32 0, i32 0))
  store i32 %66, i32* @dec_szh, align 4
  %67 = load i32* @dec_rh1, align 4
  %68 = load i32* @dec_ah1, align 4
  %69 = load i32* @dec_rh2, align 4
  %70 = load i32* @dec_ah2, align 4
  %71 = call i32 @filtep(i32 %67, i32 %68, i32 %69, i32 %70)
  store i32 %71, i32* @dec_sph, align 4
  %72 = load i32* @dec_sph, align 4
  %73 = load i32* @dec_szh, align 4
  %74 = add nsw i32 %72, %73
  store i32 %74, i32* @dec_sh, align 4
  %75 = load i32* @dec_deth, align 4
  %76 = sext i32 %75 to i64
  %77 = load i32* @ih, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [4 x i32]* @qq2_code2_table, i32 0, i64 %78
  %80 = load i32* %79, align 4
  %81 = sext i32 %80 to i64
  %82 = mul nsw i64 %76, %81
  %83 = ashr i64 %82, 15
  %84 = trunc i64 %83 to i32
  store i32 %84, i32* @dec_dh, align 4
  %85 = load i32* @ih, align 4
  %86 = load i32* @dec_nbh, align 4
  %87 = call i32 @logsch(i32 %85, i32 %86)
  store i32 %87, i32* @dec_nbh, align 4
  %88 = load i32* @dec_nbh, align 4
  %89 = call i32 @scalel(i32 %88, i32 10)
  store i32 %89, i32* @dec_deth, align 4
  %90 = load i32* @dec_dh, align 4
  %91 = load i32* @dec_szh, align 4
  %92 = add nsw i32 %90, %91
  store i32 %92, i32* @dec_ph, align 4
  %93 = load i32* @dec_dh, align 4
  call void @upzero(i32 %93, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i32 0, i32 0))
  %94 = load i32* @dec_ah1, align 4
  %95 = load i32* @dec_ah2, align 4
  %96 = load i32* @dec_ph, align 4
  %97 = load i32* @dec_ph1, align 4
  %98 = load i32* @dec_ph2, align 4
  %99 = call i32 @uppol2(i32 %94, i32 %95, i32 %96, i32 %97, i32 %98)
  store i32 %99, i32* @dec_ah2, align 4
  %100 = load i32* @dec_ah1, align 4
  %101 = load i32* @dec_ah2, align 4
  %102 = load i32* @dec_ph, align 4
  %103 = load i32* @dec_ph1, align 4
  %104 = call i32 @uppol1(i32 %100, i32 %101, i32 %102, i32 %103)
  store i32 %104, i32* @dec_ah1, align 4
  %105 = load i32* @dec_sh, align 4
  %106 = load i32* @dec_dh, align 4
  %107 = add nsw i32 %105, %106
  store i32 %107, i32* @rh, align 4
  %108 = load i32* @dec_rh1, align 4
  store i32 %108, i32* @dec_rh2, align 4
  %109 = load i32* @rh, align 4
  store i32 %109, i32* @dec_rh1, align 4
  %110 = load i32* @dec_ph1, align 4
  store i32 %110, i32* @dec_ph2, align 4
  %111 = load i32* @dec_ph, align 4
  store i32 %111, i32* @dec_ph1, align 4
  %112 = load i32* @rl, align 4
  %113 = load i32* @rh, align 4
  %114 = sub nsw i32 %112, %113
  store i32 %114, i32* @xd, align 4
  %115 = load i32* @rl, align 4
  %116 = load i32* @rh, align 4
  %117 = add nsw i32 %115, %116
  store i32 %117, i32* @xs, align 4
  store i32* getelementptr inbounds ([24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8
  store i32* getelementptr inbounds ([11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8
  store i32* getelementptr inbounds ([11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8
  %118 = load i32* @xd, align 4
  %119 = sext i32 %118 to i64
  %120 = load i32** %h_ptr, align 8
  %121 = getelementptr inbounds i32* %120, i32 1
  store i32* %121, i32** %h_ptr, align 8
  %122 = load i32* %120, align 4
  %123 = sext i32 %122 to i64
  %124 = mul nsw i64 %119, %123
  store i64 %124, i64* %xa1, align 8
  %125 = load i32* @xs, align 4
  %126 = sext i32 %125 to i64
  %127 = load i32** %h_ptr, align 8
  %128 = getelementptr inbounds i32* %127, i32 1
  store i32* %128, i32** %h_ptr, align 8
  %129 = load i32* %127, align 4
  %130 = sext i32 %129 to i64
  %131 = mul nsw i64 %126, %130
  store i64 %131, i64* %xa2, align 8
  store i32 0, i32* %i, align 4
  br label %132

; <label>:132                                     ; preds = %158, %0
  %133 = load i32* %i, align 4
  %134 = icmp slt i32 %133, 10
  br i1 %134, label %135, label %161

; <label>:135                                     ; preds = %132
  %136 = load i32** %ac_ptr, align 8
  %137 = getelementptr inbounds i32* %136, i32 1
  store i32* %137, i32** %ac_ptr, align 8
  %138 = load i32* %136, align 4
  %139 = sext i32 %138 to i64
  %140 = load i32** %h_ptr, align 8
  %141 = getelementptr inbounds i32* %140, i32 1
  store i32* %141, i32** %h_ptr, align 8
  %142 = load i32* %140, align 4
  %143 = sext i32 %142 to i64
  %144 = mul nsw i64 %139, %143
  %145 = load i64* %xa1, align 8
  %146 = add nsw i64 %145, %144
  store i64 %146, i64* %xa1, align 8
  %147 = load i32** %ad_ptr, align 8
  %148 = getelementptr inbounds i32* %147, i32 1
  store i32* %148, i32** %ad_ptr, align 8
  %149 = load i32* %147, align 4
  %150 = sext i32 %149 to i64
  %151 = load i32** %h_ptr, align 8
  %152 = getelementptr inbounds i32* %151, i32 1
  store i32* %152, i32** %h_ptr, align 8
  %153 = load i32* %151, align 4
  %154 = sext i32 %153 to i64
  %155 = mul nsw i64 %150, %154
  %156 = load i64* %xa2, align 8
  %157 = add nsw i64 %156, %155
  store i64 %157, i64* %xa2, align 8
  br label %158

; <label>:158                                     ; preds = %135
  %159 = load i32* %i, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* %i, align 4
  br label %132

; <label>:161                                     ; preds = %132
  %162 = load i32** %ac_ptr, align 8
  %163 = load i32* %162, align 4
  %164 = sext i32 %163 to i64
  %165 = load i32** %h_ptr, align 8
  %166 = getelementptr inbounds i32* %165, i32 1
  store i32* %166, i32** %h_ptr, align 8
  %167 = load i32* %165, align 4
  %168 = sext i32 %167 to i64
  %169 = mul nsw i64 %164, %168
  %170 = load i64* %xa1, align 8
  %171 = add nsw i64 %170, %169
  store i64 %171, i64* %xa1, align 8
  %172 = load i32** %ad_ptr, align 8
  %173 = load i32* %172, align 4
  %174 = sext i32 %173 to i64
  %175 = load i32** %h_ptr, align 8
  %176 = getelementptr inbounds i32* %175, i32 1
  store i32* %176, i32** %h_ptr, align 8
  %177 = load i32* %175, align 4
  %178 = sext i32 %177 to i64
  %179 = mul nsw i64 %174, %178
  %180 = load i64* %xa2, align 8
  %181 = add nsw i64 %180, %179
  store i64 %181, i64* %xa2, align 8
  %182 = load i64* %xa1, align 8
  %183 = ashr i64 %182, 14
  %184 = trunc i64 %183 to i32
  store i32 %184, i32* @xout1, align 4
  %185 = load i64* %xa2, align 8
  %186 = ashr i64 %185, 14
  %187 = trunc i64 %186 to i32
  store i32 %187, i32* @xout2, align 4
  %188 = load i32** %ac_ptr, align 8
  %189 = getelementptr inbounds i32* %188, i64 -1
  store i32* %189, i32** %ac_ptr1, align 8
  %190 = load i32** %ad_ptr, align 8
  %191 = getelementptr inbounds i32* %190, i64 -1
  store i32* %191, i32** %ad_ptr1, align 8
  store i32 0, i32* %i, align 4
  br label %192

; <label>:192                                     ; preds = %206, %161
  %193 = load i32* %i, align 4
  %194 = icmp slt i32 %193, 10
  br i1 %194, label %195, label %209

; <label>:195                                     ; preds = %192
  %196 = load i32** %ac_ptr1, align 8
  %197 = getelementptr inbounds i32* %196, i32 -1
  store i32* %197, i32** %ac_ptr1, align 8
  %198 = load i32* %196, align 4
  %199 = load i32** %ac_ptr, align 8
  %200 = getelementptr inbounds i32* %199, i32 -1
  store i32* %200, i32** %ac_ptr, align 8
  store i32 %198, i32* %199, align 4
  %201 = load i32** %ad_ptr1, align 8
  %202 = getelementptr inbounds i32* %201, i32 -1
  store i32* %202, i32** %ad_ptr1, align 8
  %203 = load i32* %201, align 4
  %204 = load i32** %ad_ptr, align 8
  %205 = getelementptr inbounds i32* %204, i32 -1
  store i32* %205, i32** %ad_ptr, align 8
  store i32 %203, i32* %204, align 4
  br label %206

; <label>:206                                     ; preds = %195
  %207 = load i32* %i, align 4
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* %i, align 4
  br label %192

; <label>:209                                     ; preds = %192
  %210 = load i32* @xd, align 4
  %211 = load i32** %ac_ptr, align 8
  store i32 %210, i32* %211, align 4
  %212 = load i32* @xs, align 4
  %213 = load i32** %ad_ptr, align 8
  store i32 %212, i32* %213, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @reset() #0 {
  %i = alloca i32, align 4
  store i32 32, i32* @dec_detl, align 4
  store i32 32, i32* @detl, align 4
  store i32 8, i32* @dec_deth, align 4
  store i32 8, i32* @deth, align 4
  store i32 0, i32* @rlt2, align 4
  store i32 0, i32* @rlt1, align 4
  store i32 0, i32* @plt2, align 4
  store i32 0, i32* @plt1, align 4
  store i32 0, i32* @al2, align 4
  store i32 0, i32* @al1, align 4
  store i32 0, i32* @nbl, align 4
  store i32 0, i32* @rh2, align 4
  store i32 0, i32* @rh1, align 4
  store i32 0, i32* @ph2, align 4
  store i32 0, i32* @ph1, align 4
  store i32 0, i32* @ah2, align 4
  store i32 0, i32* @ah1, align 4
  store i32 0, i32* @nbh, align 4
  store i32 0, i32* @dec_rlt2, align 4
  store i32 0, i32* @dec_rlt1, align 4
  store i32 0, i32* @dec_plt2, align 4
  store i32 0, i32* @dec_plt1, align 4
  store i32 0, i32* @dec_al2, align 4
  store i32 0, i32* @dec_al1, align 4
  store i32 0, i32* @dec_nbl, align 4
  store i32 0, i32* @dec_rh2, align 4
  store i32 0, i32* @dec_rh1, align 4
  store i32 0, i32* @dec_ph2, align 4
  store i32 0, i32* @dec_ph1, align 4
  store i32 0, i32* @dec_ah2, align 4
  store i32 0, i32* @dec_ah1, align 4
  store i32 0, i32* @dec_nbh, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %17, %0
  %2 = load i32* %i, align 4
  %3 = icmp slt i32 %2, 6
  br i1 %3, label %4, label %20

; <label>:4                                       ; preds = %1
  %5 = load i32* %i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [6 x i32]* @delay_dltx, i32 0, i64 %6
  store i32 0, i32* %7, align 4
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [6 x i32]* @delay_dhx, i32 0, i64 %9
  store i32 0, i32* %10, align 4
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [6 x i32]* @dec_del_dltx, i32 0, i64 %12
  store i32 0, i32* %13, align 4
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [6 x i32]* @dec_del_dhx, i32 0, i64 %15
  store i32 0, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %4
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %1

; <label>:20                                      ; preds = %1
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %37, %20
  %22 = load i32* %i, align 4
  %23 = icmp slt i32 %22, 6
  br i1 %23, label %24, label %40

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [6 x i32]* @delay_bpl, i32 0, i64 %26
  store i32 0, i32* %27, align 4
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [6 x i32]* @delay_bph, i32 0, i64 %29
  store i32 0, i32* %30, align 4
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [6 x i32]* @dec_del_bpl, i32 0, i64 %32
  store i32 0, i32* %33, align 4
  %34 = load i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [6 x i32]* @dec_del_bph, i32 0, i64 %35
  store i32 0, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %24
  %38 = load i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %21

; <label>:40                                      ; preds = %21
  store i32 0, i32* %i, align 4
  br label %41

; <label>:41                                      ; preds = %48, %40
  %42 = load i32* %i, align 4
  %43 = icmp slt i32 %42, 23
  br i1 %43, label %44, label %51

; <label>:44                                      ; preds = %41
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [24 x i32]* @tqmf, i32 0, i64 %46
  store i32 0, i32* %47, align 4
  br label %48

; <label>:48                                      ; preds = %44
  %49 = load i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %41

; <label>:51                                      ; preds = %41
  store i32 0, i32* %i, align 4
  br label %52

; <label>:52                                      ; preds = %62, %51
  %53 = load i32* %i, align 4
  %54 = icmp slt i32 %53, 11
  br i1 %54, label %55, label %65

; <label>:55                                      ; preds = %52
  %56 = load i32* %i, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [11 x i32]* @accumc, i32 0, i64 %57
  store i32 0, i32* %58, align 4
  %59 = load i32* %i, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [11 x i32]* @accumd, i32 0, i64 %60
  store i32 0, i32* %61, align 4
  br label %62

; <label>:62                                      ; preds = %55
  %63 = load i32* %i, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %i, align 4
  br label %52

; <label>:65                                      ; preds = %52
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 0, i32* %1
  call void @reset()
  store i32 10, i32* %j, align 4
  store i32 2000, i32* %f, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %16, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %19

; <label>:5                                       ; preds = %2
  %6 = load i32* %j, align 4
  %7 = load i32* %f, align 4
  %8 = mul nsw i32 %7, 3141
  %9 = load i32* %i, align 4
  %10 = mul nsw i32 %8, %9
  %11 = call i32 @my_cos(i32 %10)
  %12 = mul nsw i32 %6, %11
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [6 x i32]* @main.test_data, i32 0, i64 %14
  store i32 %12, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %5
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %2

; <label>:19                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %38, %19
  %21 = load i32* %i, align 4
  %22 = icmp slt i32 %21, 4
  br i1 %22, label %23, label %41

; <label>:23                                      ; preds = %20
  %24 = load i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [6 x i32]* @main.test_data, i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [6 x i32]* @main.test_data, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = call i32 @encode(i32 %27, i32 %32)
  %34 = load i32* %i, align 4
  %35 = sdiv i32 %34, 2
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x i32]* @main.compressed, i32 0, i64 %36
  store i32 %33, i32* %37, align 4
  br label %38

; <label>:38                                      ; preds = %23
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 2
  store i32 %40, i32* %i, align 4
  br label %20

; <label>:41                                      ; preds = %20
  store i32 0, i32* %i, align 4
  br label %42

; <label>:42                                      ; preds = %60, %41
  %43 = load i32* %i, align 4
  %44 = icmp slt i32 %43, 4
  br i1 %44, label %45, label %63

; <label>:45                                      ; preds = %42
  %46 = load i32* %i, align 4
  %47 = sdiv i32 %46, 2
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [3 x i32]* @main.compressed, i32 0, i64 %48
  %50 = load i32* %49, align 4
  call void @decode(i32 %50)
  %51 = load i32* @xout1, align 4
  %52 = load i32* %i, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [6 x i32]* @main.result, i32 0, i64 %53
  store i32 %51, i32* %54, align 4
  %55 = load i32* @xout2, align 4
  %56 = load i32* %i, align 4
  %57 = add nsw i32 %56, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [6 x i32]* @main.result, i32 0, i64 %58
  store i32 %55, i32* %59, align 4
  br label %60

; <label>:60                                      ; preds = %45
  %61 = load i32* %i, align 4
  %62 = add nsw i32 %61, 2
  store i32 %62, i32* %i, align 4
  br label %42

; <label>:63                                      ; preds = %42
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [6 x i32]* @main.result, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = load i32* %i, align 4
  %69 = add nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [6 x i32]* @main.result, i32 0, i64 %70
  %72 = load i32* %71, align 4
  %73 = add nsw i32 %67, %72
  ret i32 %73
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
