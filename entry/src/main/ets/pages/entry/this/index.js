// 启用严格模式，window会变成undefined
'use strict'

console.log("场景一：普通函数和箭头函数中的this");
console.log("普通函数中的this");
function show() {
    // this只是一个占位符，在函数中，this指向调用该函数的对象
    console.log(this)
}

// 这里的window被省略了。相当于window.show()
show()

console.log("箭头函数中的this");
const user = {
    id: 1,
    name: '张三',
    message: function () {
        // 这里的this指向了user
        console.log(this)
    },
    message2: () => {
        // 这里的this指向了window
        console.log("message2", this)
    },
    message3: function () {
        setTimeout(() => {
            // 这里的this指向了user
            console.log("setTimeout", this)
        }, 1000)
        return () => {
            // 这里的this指向了user
            console.log(this)
        }
    },
    message4: () => {
        return function () {
            // 这里的this指向了window
            console.log("message4", this)
        }
    },
}

user.message()
user.message2()
user.message3()()
user.message4()()

console.log("场景二：面向对象中的this");
class Student {
    constructor(id, name) {
        // 1、this 指向实例对象
        this.id = id
        this.name = name
        this.message()
    }

    message() {
        // this指向了user
        console.log("message", this)
        // 2、在JavaScript中，掉用对象的其他方法，this不可以省略
        this.show()
    }

    show() {
        console.log("show")
    }

    message2 = ()=>{
        // this指向了user
        console.log("message2", this);
    }
}

// 补充关于对象输出的部分：

const stu = new Student(1, '张三')
console.log(stu);
// 这里调用了toString方法。相当于console.log(stu.toString());
console.log("stu = " + stu);
// 这里输出的是String类型的json字符串
console.log(JSON.stringify(stu));
stu.message2()


/**
 * 场景三：事件函数的绑定中的this
 */
console.log("场景三");
const btn1 = document.getElementById("btn")

// function click() {
//     // 这里的this指向了btn
//     // window.click 不为空
//     console.log(this, window.click)
// }
// btn1.onclick = click

btn1.onclick = function () {
    // 这里的this指向了btn
    console.log(this)
}

const btn2 = document.getElementById("btn2")

// 注意：这里不能重名，无论哪个在前面都会报错。
// 2种报错的内容：
// 1、Uncaught TypeError: Assignment to constant variable.
// 2、Uncaught ReferenceError: Cannot access 'click' before initialization

// click = () => {
//     // 这里的this指向了window。
//     // window.click 不为空
//     console.log(this, this.click, "click")
// }
// btn2.onclick = click

// const click2 = ()=> {
//     // 这里的this指向了window
//     // window.click2 为空
//     console.log(this, this.click2, "const click")
// }
// btn2.onclick = click2

btn2.onclick = () => {
    // 这里的this指向了window
    console.log(this)
}