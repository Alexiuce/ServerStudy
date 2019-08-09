

/**
 * 组合算法 : 从totalNumber 中取 pickNumber 个组合结果
 * 返回所有组合的个数; 
 * */
function combination(totalNumber, pickNumber){
    if (pickNumber > totalNumber) throw new Error('所选个数不能超过总体数') 
    if (pickNumber == 0) return 0
    if (pickNumber == totalNumber) return 1

    // 取小值进行计算; 主要是为了减少下面的两个for 循环次数;
    if (pickNumber > totalNumber / 2){ pickNumber = totalNumber - pickNumber}

    //  计算被除数
    var mutilNumber = 1
    for (i = totalNumber; i > totalNumber - pickNumber; --i){
        mutilNumber *= i;
    }
    // 计算除数 
    var subNumber = 1
    for(i = 1; i <= pickNumber; i++){
        subNumber *= i;
    }
    // 返回结果
    return mutilNumber / subNumber
}

// 选四场 
// var r = combination(4,1) /* 四串三 */ + combination(4,2) /* 四串二 */ + combination(4,4) /* 四串一 */
// console.log(r)    // 输出结果: 11 


// 复式(r)投注计算 (n 中选 m) 公式: 
/**
 * 1. 先计算所选场次的非复式 数量 (c);  
 * 2. 计算不包含复式场次的 数量 (e) :  c * ((n-m)/n)
 * 3. 计算结果 result = r * (c - e)
 */

 function duplexComb(r,n,m){
    let c = combination(n,m)
    console.log("非复式数量: " + c)

    let e = c * (n - m) / n
    console.log("不包含复式的场次: " + e)

    return r * c - (r - 1) * e
 }

 //  n = 4, m = 2, r = 2;
let t = duplexComb(3,4,2)
console.log(t)

