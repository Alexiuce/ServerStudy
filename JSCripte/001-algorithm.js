

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

 //  n = 4, m = 2, r = 2;
// let t = duplexComb(3,6,2)
// console.log(t)

/** 
 *  复式(r)投注计算 (n 中选 m) 公式:  (两场复式) 
 *  参数: 前场复式数量 oldMutiple   (缩写om) ,相当于 duplexCom方法中的r参数
 *       当前场次的复式数量 currentMutiple  (缩写 cm)
 *       选择的场次总数: number (缩写n)
 *       选择的串法: 也就是从 number 中选择的场数 member ,(缩写m)
 */

function multipleDuplexCome(om,n,m,cm){
        /** 计算本场复式之前的基数 */    
        let beforeBaseCount = duplexComb(om,n,m)
        /** 计算基数中不包含本复式场次的数量 */
        let c = combination(n,m)
        let e = c * (n - m) / n
        let excludeCount = om * e;
        /** 计算复式场次总数 */
        return beforeBaseCount *cm - (cm - 1) * excludeCount;
}

// let test = multipleDuplexCome(2,3,3,2)
// console.log(test)
// console.log("=====================")


/**
 * 计算 n 中选 m 结果中,不包含某场次的数量
 */
function excludeMe(n, m){
    return combination(n,m) * (n - m) / n
}

/**
 *  定义比赛场次数据模型:
 *  sectionID: 比赛编号
 *  hostName: 主队名称
 *  guestName: 客队名称
 *  selectCount: 复式投注数量
 */
const Team = {
　　　　createNew: function(){
　　　　　　var t = {};
　　　　　　t.selectCount = 0;
          t.hostName = ""
          t.guestName = ""
　　　　　　return t;
　　　　}
};
/** 选第一场 */
var t1 = Team.createNew()
t1.selectCount = 1     

/** 选第二场 */
var t2 = Team.createNew()
t2.selectCount = 1

/** 选第三场 */
var t3 = Team.createNew()
t3.selectCount = 1

/** 选第四场 */
var t4 = Team.createNew()
t4.selectCount = 1
/** 选第四场 */
var t5 = Team.createNew()
t5.selectCount = 1

/** 所选的全部比赛场次 */
var allTeams = [t1,t2,t3,t4,t5]

/***
 * 计算复式投注的总注数
 * 参数teams 为数组,包含所有的选择比赛场次: 不能少于两场
 * 参数 m 为,从所有的场次中(teams),选出的场次数量; 即 x 串 m 
 */
function caculateTotalCount(teams, m){
    let n = teams.length;                                  // 所有场次数量
    
    var farray = teams.filter((e) => e.selectCount > 1);  // 获取所有的复式场次
    
    /** 计算基数中不包含本复式场次的数量 */
    let c = combination(n,m);
    let e = c * (n - m) / n;
    console.log(`exclude = ${e}`)
    /** 先计算前两场的复式基数 */
    let one = farray[0];
    let two = farray[1];
    var twoBaseCount = multipleDuplexCome(one.selectCount,n,m,two.selectCount);
    let fc = farray.length;
    if (fc > 2){ /** 计算多于两场后面的复式基数 */
        var multip = one.selectCount * two.selectCount;
        for (i = 2; i <= fc - 1; ++i){
            let other = farray[i];
            twoBaseCount += (other.selectCount -1) * (twoBaseCount - multip * e)
            multip *= other.selectCount;
            console.log(`multip = ${multip}`)
        }
    }
    return twoBaseCount
}
console.log("----------------  示例 --------------")
/** 示例含义: 选了四场球赛,三串一方式, 计算复式投注数: */
let result = caculateTotalCount(allTeams,3)
console.log(`result = ${result}`)

