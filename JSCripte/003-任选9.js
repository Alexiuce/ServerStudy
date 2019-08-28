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

/* let t1 = 0x6;
for( i = 0; i< 4; i++){
    
    console.log((t1 >> i) & 0x1) 
}
console.log('-------') */



/* 二进制辅助法 计算组合
1.m 选 n， 初始化m个数，它们都是0，前n个都变成1，表示最小的二进制。
2.如何找到下一个较大的数呢？因为我们这里的二进制是从左往右，所以，当发现一个1,0时，我们把它改成0,1的时候，这个数就变大了！
3.根据策略2的话(0,1,1,0,0)– 6下一个二进制数应该是(0,1,0,1,0)– 10，但是比(0,1,1,0,0)要大的下一个数应该是(1,0,0,1,0)– 9。所以
我们要把1,0换成0,1的时候，还要把0,1中0的前面所有1都移到最前面，这样才是最小的数，大家理解下这句。因为我们的二进制是从左往右的。
*/
function combationBinary(count, from){

    var result = []
    var array = []
    for(i = 0; i < from; i++){
        let v = i < count ? 1 : 0
        array.push(v)
    }
   result.push(Array.from(array))
   
    for(i = 0; i < from; ++i){
       
        if (array[i] == 1 && array[i+1] == 0){
            // 交换 1 和 0;
            let tmp = array[i]
            array[i] = array[i + 1]
            array[i + 1] = tmp
            // 移动所有i 前面的1 到最左边;
            var flag = 0;
            for(j = 0; j < i; j++){
                if (array[j] == 1 ){
                    let temp = array[flag]
                    array[flag] = array[j]
                    array[j] = temp
                    flag += 1
                }
            }
            result.push(Array.from(array))
            i = -1

        }
    }
    console.log('所有组合:')
    console.log(result)
    console.log(`组合总数: ${result.length}`)
}

combationBinary(2,5)

/*  复式 组合 计算注数 
例如, 1,2,3,4,5  返回一注;
     12,2,3,4,5 返回2注;
     12,23,3,4,5 返回4注;

    解题思路: 使用二维数组
    二维数组: [[1,2],2,3,4,5]
             [[1,2,3][1,2],3,4,5];
             |
             |
             变换成一个二维数组和一个一维数组
             [[1,2,3],[1,2]]
             [3,4,5]
            |
            |
            获取最长数组, 按最长数组进行遍历,每次要将短数组循环初始设置为0;
            |
            |
            |
            1. 如上数组, 进行 5 选 2 后 进行复式计算注数
            |
            |
            |
            |
            猜测: 0. 先计算 5选2 的组合数   == n;
                  1. 计算包含复式组合的组合个数 == m
                  2. 根据复式组合的个数 计算复式带来的变化注数 == l,
                  3. 如果有多组复式选项, 则根据步骤2 计算每个复式项带来的额外注数;
                  4. 合并计算结果 : result = n  + (m - 1) * l  

*/

function complex(){
    

      

    
}

