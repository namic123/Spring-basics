# truthy와 falsy
* boolean으로 형변환될 때 true 또는 false로 평가되는 값을 의미
* 즉, javascript에서는 꼭 boolean타입(true,false)가 아니더라도 조건문이나 반복문에 사용할 수 있다.

## Falsy 값 -false로 간주될 수 있는 값
* false
* 0 (숫자 0)
* "" (빈 문자열), '', ``
* null
* undefined
* NaN

## Truthy 값
Falsy에 해당하지 않는 모든 값은 truthy로 간주된다.

* true
* 모든 숫자 (0과 NaN 제외)
* 모든 문자열 ("" 제외)
* 모든 객체와 배열 (비어있어도 포함)
* 그 외 대부분의 값

```javascript
if (0) {
  console.log("false!"); // 0은 falsy
}

if (1) {
  console.log("truthy!"); // 1은 truthy
}

const value = "블라블라";
if (value) {
  console.log("truthy!"); // 비어있지 않은 문자열은 truthy
}

const arr = [];
if (arr) {
  console.log("thruthy!"); // 배열 (비어 있더라도)은 truthy
}
```

* truthy, falcy를 활용한 연산


* && (논리 AND)
  * 첫 번째 피연산자가 truthy일 경우, 두 번째 피연산자를 반환.
  * 첫 번째 피연산자가 falsy일 경우, 첫 번째 피연산자를 반환.
```javascript
let a = "hello";
let b = true && a;  // 첫 번째 피연산자(true)가 truthy이므로, 두 번째 피연산자 "hello"가 반환됨.
console.log(b); // 출력: "hello"

let d = 0;
let e = d && 50;  // 첫 번째 피연산자(0)가 falsy이므로, 첫 번째 피연산자 0이 반환됨.
console.log(e); // 출력: 0
```

* || (논리 OR)
  * 첫 번째 피연산자가 truthy일 경우, 첫 번째 피연산자를 반환.
  * 첫 번째 피연산자가 falsy일 경우, 두 번째 피연산자를 반환.
```javascript
let c = false || a; // 'a'가 truthy이면 'c'는 'a'의 값이 되고, 'a'가 falsy이면 'c'는 'a'의 값이 됨.
```

* 활용 예시
```javascript
let d = 100;
let e = d && 50; // 'd'가 truthy (100)이므로 'e'는 두 번째 피연산자인 50이 됨.

let f = 0;
let g = f && 50; // 'f'가 falcy (0)이므로 'g'는 첫 번째 피연산자인 f(0)이 됨.
```