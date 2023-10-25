# 템플릿 리터럴 (Template literals)
* ES6에서 도입된 문자열 표현식
* 백틱(``)을 사용해서 문자열을 감싸고 ${}형식을 사용해서 문자열 안에 표현식을 삽입할 수 있다.

* 일반적으로 사용되는 변수와 문자열의 결합
```javascript
const name = "jay";
const hello = "Hello, " + name + "!";
```

* Template literals 사용
* 백틱 안에 문자열과 ${} 형식의 변수를 넣는다.
```javascript
const name = "John";
const greeting = `Hello, ${name}!`;
```

* 여러 줄 사용하기
```javascript
const multiLineString = `블라블라블라
    블라블라블라 
    블라블라블라`;
```

* 표현식 넣기
```javascript
const x = 10;
const y = 20;
const sum = `x 더하기 y 는? 답: ${x + y}.`;
```

* 중첩으로 사용하기
```javascript
const person = { name: "Jay", age: 28 };
const info = `제 이름은 ${person.name}, 제 나이는 ${`${person.age}살 입니다. `}.`;
```