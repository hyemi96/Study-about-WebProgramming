[https://medium.com/@limsungmook/자바스크립트는-왜-프로토타입을-선택했을까-997f985adb42](https://medium.com/@limsungmook/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%8A%94-%EC%99%9C-%ED%94%84%EB%A1%9C%ED%86%A0%ED%83%80%EC%9E%85%EC%9D%84-%EC%84%A0%ED%83%9D%ED%96%88%EC%9D%84%EA%B9%8C-997f985adb42)

자바스크립트  = == === 차이
[https://aboooks.tistory.com/9](https://aboooks.tistory.com/9)

var, let, const 차이 *중요

요즘 var을 안쓰고 let을 쓰는 추세인데.. 그 이유는 밑에 내용을 확인하자.

ES 는 무엇인가
ES 는 ECMAScript 의 약자입니다. 그리고 숫자 6은 여섯번째 ES 라고 생각하면 되겠습니다. 그렇다면 ES, ECMAScript 는 무엇일까요?

위키백과를 보면 ECMAScript 는 Ecma 인터내셔널의 ECMA-262 기술 규격에 정의된 표준화된 스크립트 프로그래밍 언어입니다. 
자바스크립트를 표준화하기 위해서 만들어졌으며 꼭 자바스크립트가 아니더라도 어도비 플래시를 사용하는 소프트웨어에서 사용하는 액션스크립트, 
MS 사의 인터넷 익스플로러에 쓰이는 J스크립트 등 다른 구현체들 역시 포함하고 있습니다.

ES 가 등장하게 된 배경을 살펴보면 1990년대로 거슬러 올라갑니다. 
Netscape 회사는 웹 디자이너들과 파트타입 프로그래머들이 이미지, 플러그인 등의 요소를 쉽게 조합해줄 언어를 필요로 하게 되었고 이를 위해 Brendan Eich 를 영입하게 됩니다. 
Brendan Eich 는 모카라는 새로운 언어를 만들고 이 이름은 라이브스크립트로 다시 자바스크립트로 이름을 바꾸게 됩니다. 
이름을 지은데에는 이 언어가 자바 언어에서 파생되었다는 마케팅적인 이유가 있다고 생각하고 있습니다.

 
자바스크립트가 성공하자 경쟁사인 MS 는 이를 견제하기 위해 J스크립트를 개발하게 됩니다. 
당시 웹브라우저에서 압도적인 점유율을 차지하던 IE 에서 J스크립트를 지원하기 시작하자 두 비슷한 스크립트 언어가 사람들에게 혼란을 야기하게 됩니다. 
따라서 이 둘 뿐 아니라 여러 스크립트 언어들에 대한 표준이 필요하다고 생각했고 ES 가 등장하게 되었습니다.

따라서 ES 는 프로그래밍 언어가 아닌 스크립트 언어들에 대한 표준, 규격입니다.


왜 ES6 인가
그렇다면 우리는 왜 ES6 에 대해 큰 관심을 가지는 것일까요?

ES6가 최신 버전이기 때문에 그럴까요?

아닙니다. 현재 2019년 12월 기준으로 ES10 까지 나왔습니다. 1997년 6월에 1판을 시작으로 불규칙적이게 개정되던 것이 2015년 부터는 매년 6월에 규칙적으로 개정이 되고 있습니다.
특히 이 중 ES6 에서는 ES5 이하 명세에서 문제가 되었던 부분들이 해결되었고 많은 기능들이 추가되었습니다. 이는 가독성과 유지보수성 향상으로 이어졌습니다. 
React 나 Vue 등 유명 라이브러리들도 이에 맞춰 개발 환경을 ES6로 바꾸게 되었습니다.

이러한 이유로 인해 우리는 ES6에 주목하고 관심을 갖게 되었습니다.

#es6 특징 정리

ES6는 아래의 새로운 기능들을 포함하고 있습니다.

const and let
Arrow functions(화살표 함수)
Template Literals(템플릿 리터럴)
Default parameters(기본 매개 변수)
Array and object destructing(배열 및 객체 비구조화)
Import and export(가져오기 및 내보내기)
Promises(프로미스)
Rest parameter and Spread operator(나머지 매개 변수 및 확산 연산자)
Classes(클래스)

ES6 문법
const and let
const는 변수 선언을 위한 ES6의 새로운 키워드입니다. const는 var보다 강력하고 일단 사용되면 변수를 다시 할당할 수 없습니다. 즉, 객체와 함께 사용할 때를 제외하고는 변경 불가능한 변수 입니다.

이 기능은 선택자를 대상으로 하는 데 매우 유용합니다. 예를 들어 이벤트를 실행하는 단일 단추가 있거나 JavaScript에서 HTML 요소를 선택하려면 var 대신 const를 사용하십시오. 이것은 var가 '호이스팅(hoisting)'이기 때문입니다. 변수를 재할당하지 않으려면 항상 상수를 사용하는 것이 좋습니다.

// ES5
var MyBtn = document.getElementById('mybtn');

// ES6
const MyBtn = document.getElementById('mybtn');
위의 코드에서 const는 변경되지 않으며 재할당할 수 없습니다. 새로운 값을 제공하려고 하면 오류가 반환됩니다.

let은 새로운 값을 가질 수도 있고 재할당할 수도 있습니다. 변경 가능한 변수가 생성됩니다.

let name = '철수';

name = '영희';

console.log(name);
// 출력 => 영희
let은 const와 동일하게 모두 블럭 범위라는 점입니다. 즉, 변수는 범위 내에서만 사용할 수 있습니다.

Arrow functions(화살표 함수)
화살표 함수는 정말 멋지고, 코드를 더 읽기 쉽고, 더 체계적이고, 최신 코드처럼 보이게 합니다.

이 방법을 사용하는 대신:

// ES5
function myFunc(name) {
	return '안녕' + name;
}

console.log(myFunc('영희'));

// 출력 => 안녕 영희
다음을 사용합니다.

// ES6 화살표 함수
const myFunc = (name) => {
	return `안녕 ${name}`;
}

console.log(myFunc('영희')); // 출력 => 안녕 영희

// 또는 화살표를 사용하거나 'return' 키워드를 사용하지 않아도 됩니다
const myFunc = (name) => `안녕 ${name}`;

console.log(myFunc('영희')); // 출력 => 안녕 영희
보시다시피 화살표 함수가 더 읽기 쉽고 깔끔해 보입니다! 더 이상 이전 구문을 사용할 필요가 없습니다.

또한, 화살표 함수를 map과 filter, reduce 등 내장 함수와 함께 사용할 수 있습니다.

// ES5
const myArrary = ['진수', '영철', '영희', 5];

let arr1 = myArrary.map(function(item) {
	return item;
});

console.log(arr1); // 출력 => (4) ["진수", "영철", "영희", 5]

// ES6
let arr2 = myArrary.map((item) => item);

console.log(arr2); // 출력 => (4) ["진수", "영철", "영희", 5]
화살표가 있는 map 함수는 ES5의 map보다 더 선명하고 읽기 쉬워 보입니다. ES6를 사용하면 더 짧고 스마트한 코드를 작성할 수 있습니다. filter와 reduce 같은 동일한 함수를 사용할 수 있습니다.

Template Literals(템플릿 리터럴)
템플릿 리터럴 또는 템플릿 문자열은 꽤 멋집니다. 문자열을 연결하기 위해 더하기(+) 연산자를 사용할 필요는 없으며, 백틱(`)을 사용하여 문자열 내에서 변수를 사용할 수도 있습니다.

이전 문법:

// ES5
function myFunc1() {
	return '안녕' + name + '너의 나이는' + age + '살 이다!'; 
}

console.log(myFunc1('영희', 22));
// 출력 => 안녕 영희 너의 나이는 22살 이다!
새로운 ES6 문법 사용:

// ES6
const myFunc = (name, age) => {
	return `안녕 ${name}, 너의 나이는 ${age}살 이다!`; 
};

console.log(myFunc1('영희', 22));
// 출력 => 안녕 영희, 너의 나이는 22살 이다!
정말 간단합니다! 이것은 이전 문법과 ES6의 큰 차이입니다. 문자열로 구성할 때 ES6의 리터럴 문자열은 ES5보다 더 체계적이고 잘 구성되어 있습니다.

Default parameters(기본 매개 변수)
매개 변수를 쓰지 않은 경우 매개 변수가 이미 기본값에 정의되어 있으므로 정의되지 않은 오류가 반환되지 않습니다. 따라서 누락된 매개 변수를 사용하여 함수를 실행할 때 기본 매개 변수 t 값을 사용하고 오류를 반환하지 않습니다!

이 예를 살펴보십시오:

const myFunc = (name, age) => {
	return `안녕 ${name} 너의 나이는 ${age}살 이니?`; 
};

console.log(myFunc1('영희'));
// 출력 => 안녕 영희 너의 나이는 undefined살 이니?
위의 함수는 정의되지 않은 상태로 반환됩니다. 두 번째 매개 변수 age를 지정하는 것을 잊어버렸기 때문입니다.

그러나 기본 매개 변수를 사용하면 정의되지 않은 매개 변수가 반환되지 않고 매개 변수 할당을 잊어버렸을 때 해당 값이 사용됩니다!

const myFunc = (name, age = 22) => {
	return `안녕 ${name} 너의 나이는 ${age}살 이니?`; 
};

console.log(myFunc1('영희'));
// 출력 => 안녕 영희 너의 나이는 22살 이니?
보시다시피 함수는 두 번째 매개 변수를 놓쳤더라도 값을 반환합니다. 이제 기본 파라미터를 사용하여 오류를 미리 처리할 수 있습니다.

Array and object destructing(배열 및 객체 비구조화)
비구조화를 통해 배열 또는 객체의 값을 새 변수에 더 쉽게 할당할 수 있습니다.

이전 문법:

// ES5 문법
const contacts = {
	famillyName: '이',
	name: '영희',
	age: 22
};

let famillyName = contacts.famillyName;
let name = contacts.name;
let myAge = contacts.age;

console.log(famillyName);
console.log(name);
console.log(age);
// 출력
// 이
// 영희
// 22
ES6 문법 사용:

// ES6 문법
const contacts = {
	famillyName: '이',
	name: '영희',
	age: 22
};

let { famillyName, name, age } = contacts;

console.log(famillyName);
console.log(name);
console.log(age);
// 출력
// 이
// 영희
// 22
ES5에서는 각 변수에 각 값을 할당해야합니다. ES6에서는 객체의 속성을 얻기 위해 값을 중괄호 안에 넣습니다.

참고: 속성 이름과 동일하지 않은 변수를 할당하면 undefined가 반환됩니다. 예를 들어, 속성의 이름이 name이고 username 변수에 할당하면 undefined를 반환합니다.

우리는 항상 속성의 이름과 동일하게 변수 이름을 지정해야합니다. 그러나 변수의 이름을 바꾸려면 콜론을 :대신 사용할 수 있습니다.

// ES6 문법
const contacts = {
	famillyName: '이',
	name: '영희',
	age: 22
};

let { famillyName, name: ontherName, age } = contacts;

console.log(ontherName);
// 영희
배열의 경우 객체와 동일한 구문을 사용합니다. 중괄호를 대괄호로 바꾸면됩니다.

const arr = ['광희', '지수', '영철', 20];

let [value1, value2, value3] = arr;

console.log(value1);
console.log(value2);
console.log(value3);
// 출력
// 광희
// 지수
// 영철
Import and export(가져오기 및 내보내기)
JavaScript 응용프로그램에서 import 및 export를 사용하면 성능이 향상됩니다. 이를 통해 별도의 재사용 가능한 구성요소를 작성할 수 있습니다.

JavaScript MVC 프레임워크에 익숙한 경우, 대부분의 경우 import 및 export를 사용하여 구성요소를 처리합니다. 그렇다면 실제로 어떻게 작동할까요?

간단합니다! export를 사용하면 다른 JavaScript 구성 요소에 사용할 모듈을 내보낼 수 있습니다. 우리는 그 모듈을 우리의 컴포넌트에 사용하기 위해 가져오기 import를 사용합니다.

예를 들어, 두 개의 파일이 있습니다. 첫 번째 파일은 detailComponent.js이고 두 번째 파일은 homeComponent.js입니다.

detailComponent.js에서는 detail 함수를 내보낼 예정입니다.

// ES6
export default function detail(name, age) {
	return `안녕 ${name}, 너의 나이는 ${age}살 이다!`;
}
그리고 homeComponent.js에서 이 기능을 사용하려면 import만 사용합니다.

import detail from './detailComponent';

console.log(detail('영희', 20));
// 출력 => 안녕 영희, 너의 나이는 20살 이다!
둘 이상의 모듈을 가져오려는 경우, 중괄호에 넣기만 하면 됩니다.

import { detail, userProfile, getPosts } from './detailComponent';

console.log(detail('영희', 20));
console.log(userProfile);
console.log(getPosts);
정말 멋지지 않습니까?!

Promises(프로미스)
Promise는 ES6의 새로운 특징입니다. 비동기 코드를 쓰는 방법입니다. 예를 들어 API에서 데이터를 가져오거나 실행하는데 시간이 걸리는 함수를 가지고 있을 때 사용할 수 있습니다. Promise는 문제를 더 쉽게 해결할 수 있으므로 첫 번째 Promise를 만들어 봅시다!

const myPromise = () => {
	return new Promise((resolve, reject) => {
		resolve('안녕하세요 Promise가 성공적으로 실행했습니다');
	});
};

cosole.log(myPromise());
// Promise {<resolved>: "안녕하세요 Promise가 성공적으로 실행했습니다"}
콘솔을 기록하면 Promise가 반환됩니다. 따라서 데이터를 가져온 후 함수를 실행하려면 Promise를 사용합니다. Promise는 두 개의 매개 변수를 사용하며 resolve및 reject 예상 오류를 처리 할 수 있습니다.

참고 : fetch 함수는 Promise 자체를 반환합니다!

const url = 'https://jsonplaceholder.typicode.com/posts';
const getData = (url) => {
	return fetch(url);
};

getData(url).then(data => data.json()).then(result => console.log(result));
이제 콘솔을 기록하면 데이터 배열이 반환됩니다.

Rest parameter and Spread operator(나머지 매개 변수 및 확산 연산자)
Rest parameter는 배열의 인수를 가져오고 새 배열을 반환하는데 사용됩니다.

const arr = ['영희', 20, '열성적인 자바스크립트', '안녕', '지수', '어떻게 지내니?'];

// 비구조화를 이용한 값을 얻기
const [ val1, val2, val3, ...rest ] = arr;

const Func = (restOfArr) => {
	return restOfArr.filter((item) => {return item}).join(" ");
};

console.log(Func(rest)); // 안녕 지수 어떻게 지내니?
Spread operator는 Rest parameter와 구문이 동일하지만 Spread operator는 인수뿐만 아니라 배열 자체를 가집니다. for 반복문이나 다른 메서드를 사용하는 대신 Spread operator를 사용하여 배열의 값을 가져올 수 있습니다.

const arr = ['영희', 20, '열성적인 자바스크립트', '안녕', '지수', '어떻게 지내니?'];

const Func = (...anArray) => {
	return anArray;
};

console.log(Func(arr));
// 출력 => ["영희", 20, "열성적인 자바스크립트", "안녕", "지수", "어떻게 지내니?"]
Classes(클래스)
class는 객체 지향 프로그래밍(OOP)의 핵심입니다. 코드를 더욱 안전하게 캡슐화할 수 있습니다. class를 사용하면 코드 구조가 좋아지고 방향을 유지합니다.

class를 만들려면 class 키워드 뒤에 두 개의 중괄호가 있는 class 이름을 사용합니다.

class myClass {
	constructor() {
	
	}
}
이제 new 키워드를 사용하여 class 메서드와 속성에 액세스할 수 있습니다.

class myClass {
	constructor(name, age) {
		this.name = name;
		this.age = age;
	}
}

const user = new myClass('영희', 22);

console.log(user.name); // 영희
console.log(user.age); // 22
다른 class에서 상속하려면 extends 키워드 다음에 상속할 class의 이름을 사용합니다.

class myClass {
	constructor(name, age) {
		this.name = name;
		this.age = age;
	}

	sayHello() {
		console.log(`안녕 ${this.name} 너의 나이는 ${this.age}살이다`);
	}
}

// myClass 메서드 및 속성 상속
class UserProfile extends myClass {
	userName() {
		console.log(this.name);
	}
}

const profile = new UserProfile('영희', 22);

profile.sayHello(); // 안녕 영희 너의 나이는 22살이다.
profile.userName(); // 영희

#크롬에서 자바스크립트 로딩 순서

[https://yceffort.kr/2020/10/javascript-priorities](https://yceffort.kr/2020/10/javascript-priorities)




**es6문법은 추후에 다시 따로 빼서 정리하도록 한다.
