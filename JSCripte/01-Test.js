

/** 
 * Test data
*/


var city = {
    id:"c0",
    name:"Quibike",
    children:[
        {
            id:"t0",
            name:"DEC",
            children:[]
        },
        {
            id:"t1",
            name:"TED",
            children:[]
        }
    ]
}

var city1 = {
    id:"c1",
    name:"Thaimending",
    children:[]
}
var city2 = {
    id:"c2",
    name:"Xiagong",
    children:[
        {
            id:"ct0",
            name:"DEC",
            children:[]
        },
        {
            id:"ct1",
            name:"TED",
            children:[]
        }
    ]
}
var city3 = {
    id:"4.1",
    name:"XianGuang",
    children:[]
}


var priv = {
    id:"p0",
    name:"ajob",
    children:[city]
}
var priv1 = {
    id:"p1",
    name:"ajob",
    children:[city,city3]
}
var priv2 = {
    id:"p2",
    name:"ajob",
    children:[city,city1]
}
var priv3 = {
    id:"p3",
    name:"ajob",
    children:[city,city1,city2,city3]
}



var AllPri = [priv]




var TranseralObject = function(data){
    var fid = ""
    data.forEach(element => {
        fid += element.id +","
        if (element.children.length > 0){
           fid +=TranseralObject(element.children)
        }
    });
    return fid
}

var r1 = TranseralObject(AllPri)
console.log(r1)
console.log('===========')
var r2 = TranseralObject([priv1])

console.log(r2)