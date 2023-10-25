<%--
  Created by IntelliJ IDEA.
  User: 박재성
  Date: 2023-10-24
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div>
    <button onclick="ajax1()">button1</button>
    <script>
        function ajax1(){
            axios.get("/main38/sub1");
        }
    </script>
</div>
<div>
    <button onclick="ajax2()">button2</button>
    <script>
        function ajax2(){
            axios.get("/main38/sub2")
                .then(function (response){
                    console.log("응답 받은 후 해야하는 일");
                    console.log(response.data);
                    console.log(response.status);
                    console.log(response.statusText);
                    console.log(response.headers);
                    console.log(response.config);
                });
        }
    </script>
</div>
<div>
    <button onclick="ajax3()">button3</button>
    <script>
        function ajax3(){
            axios.get("/main38/sub3")
                .then(function (res){
                    console.log(res.data);
                    console.log(res.data.age);
                    console.log(res.data.name);
                });
        }
    </script>
</div>
<div>
    <button onclick="ajax4()">button4</button>
    <script>
        function ajax4(){
            // ajax 요청
            // get / main38/sub4
            // seoul
            //3000
            // son
            // 1999-03-03
            const data = response.data;
           axios.get("/main38/sub4")
                .then(function (data){
                    console.log(data.city);
                    console.log(data.price);
                    console.log(data.list[0]);
                    console.log(data.birth);
                })
        }
    </script>
</div>
<div>
    <input type="text" id="input1">
    <button onclick="ajax5()">button5</button>
    <script>
        function ajax5(){
            const pid = document.querySelector("#input1").value;
            axios.get("/main38/sub5?id="+pid)
                .then(function (response){
                    const product= response.data;
                    console.log(product.ProductID);
                    console.log(product.ProductName);
                    console.log(product.Price);
                    console.log(product.Unit);

                })
        }
    </script>
</div>
<div>
    <button onclick="ajax6()">button6</button>
    <script>
        function ajax6(){
            axios.get("/main38/sub2")
                .then(function (){
                    console.log("응답 완료 후 실행");
                })  // promise 객체를 반환
                .then(function (){  // 반환된 promise 객체를 통해 연속적으로 추가작업을 수행할 수 있음.
                    console.log("그 다음 실행");
                })  // promise 객체를 반환
                .then(function (){
                    console.log("또, 그 다음 실행");
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax7()">button7</button>
    <script>
        function ajax7(){
            axios.get("/main38/sub2")
                .then(function (){
                    console.log("첫 함수")
                    return "abcd";
                })  // promise 객체를 반환
                .then(function (param){  // 직전 함수의 리턴 값이 파라미터로 들어옴
                    console.log("두번째 함수")
                    console.log(param)  // "abcd"
                    return 1234;
                })  // promise 객체를 반환
                .then(function (param){
                    console.log(param) // 1234
                })

        }
    </script>
</div>
<div>
    <button onclick="ajax8()">button8</button>
    <script>
        function ajax8(){
            axios.get("/main38/sub2")
                .then(function (response){  // 서버의 응답 값이 파라미터로 들어옴
                    console.log("첫번째 함수")
                    return response.data;   // hello world
                })  // promise 객체를 반환
                .then(function (param){  // 직전 함수의 리턴 값이 파라미터로 들어옴
                    console.log("두번째 함수")
                    console.log(param)  // hello world
                    return 1234;
                })  // promise 객체를 반환
                .then(function (param){ // 직전 함수의 리턴 값이 파라미터로 들어옴
                    console.log(param) // 1234
                })
        }
    </script>
</div>
<div>
    <button onclick="ajax9()">button9</button>
    <script>
        function ajax9(){
            axios.get("/main38/sub2")
                .then(response =>  response.data) // arrow function, 리턴 키워드 생략 가능, 파라미터 1개이므로 괄호 생략 가능
                .then(data=> console.log(data))
        }
    </script>
</div>
<div>
    <button onclick="ajax10()">button10</button>
    <script>
        function ajax10(){
            axios.get("/main38/sub4")
                .then(response => response.data)
                .then(data => console.log(data.list[1]))    // lee
        }
    </script>
</div>
<div>
    <button onclick="ajax11()">button11</button>
    <script>
        function ajax11() {
            axios.get("/main38/sub4")
                .then(response => response.data)
                .then(({price, birth, list, city}) => console.log(price)); // 3000
        }
    </script>
</div>
<div>
    <button onclick="ajax12()">button12</button>
    <script>
        function ajax12() {
            axios.get("/main38/sub4")
                .then(({data}) => console.log(data.price));

        }
    </script>
</div>

<div>
    <button onclick="ajax13()">button13</button>
    <script>
        function ajax13() {
            axios.get("/main38/sub4")
                .then(response => response.data)
                .then(({price, city, country = "korea"}) => {
                    console.log(price); // 3000
                    console.log(city); // seoul
                    console.log(country); // korea
                })
        }
    </script>
</div>
<script>
    // 구조분해할당
    // Destructuring assignment
    let a = {
        name: "son",
        age: 30
    };

    console.log(a.name);
    console.log(a.age);

    let myName = a.name;
    let myAge = a.age;

    console.log(myName);
    console.log(myAge);

    let {name, age} = a; // destructuring assignment
    console.log(name); // son
    console.log(age); // 30

    let b = {
        city: "seoul",
        country: "korea"
    };

    // console.log(b.city);
    // console.log(b.country);

    let {city, country} = b; // destructuring assignment
    console.log(city);
    console.log(country);

    let c = {
        email: "abc@gmail.com",
        price: 300
    };
    // let {email, price} = c;
    let {email} = c; // destructuring assignment

    let d = {
        name2: "lee",
        address: "paris",
        age: 77
    };
    let {name2, address} = d; // destructuring assignment

    let e = {
        city2: "seoul",
        country2: "korea"
    };

    let {city2, country2, category} = e;
    console.log(city2); // seoul
    console.log(country2); // korea
    console.log(category); // undefined

    let f = {
        name3: "kim",
        city3: "busan"
    };

    let {name3, city3 = "인천", address3 = "신촌"} = f; // 없을 때 기본값 할당
    console.log(name3);
    console.log(city3);
    console.log(address3);

    let g = [30, 40, 50];

    let [h, i, j] = g; // destructuring assignment
    console.log(h);
    console.log(i);
    console.log(j);

    let [k, l] = g;
    console.log(k);
    console.log(l);

    let [m, ...n] = g;
    console.log(m); // 30
    console.log(n); // [40, 50]

    let [...o] = g;
    console.log(o); // [30, 40, 50]
</script>
</body>
</html>
