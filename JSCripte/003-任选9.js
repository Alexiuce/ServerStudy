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

// 复式(r)投注计算 (n 中选 m) 公式:  (单场复式)
/**
 * 1. 先计算所选场次的非复式 数量 (c);  
 * 2. 计算不包含复式场次的 数量 (e) :  c * ((n-m)/n)
 * 3. 计算结果 result = r * (c - e)
 */

function duplexComb(r,n,m){
    let c = combination(n,m)
    let e = c * (n - m) / n
    return r * c - (r - 1) * e
 }

// let result = duplexComb(5,10,9)
// console.log(result)

/**
 * 
 * @param {*} selectCount  选择的个数
 * @param {*} targetArray  可供选择的数组
 */
function combationList(selectCount,targetArray){
    let total = targetArray.length;
    if (selectCount == total){return targetArray}
    

    console.log(total)
}

// combationList(3,[1,2,4])


// 位运算

let t1 = 0x6;
for( i = 0; i< 4; i++){
    
    console.log((t1 >> i) & 0x1)
    console.log('-------')
}