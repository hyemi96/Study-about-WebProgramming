<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb1MDeh%2Fbtrb1bXhzRh%2FQ12Yck9ram1Rs09pXH7qL0%2Fimg.png" />


## Redis란?
 - Key, Value 구조의 비정형 데이터를 저장하고 관리하기 위한 오픈 소스 기반의 비관계형 데이터 베이스 관리 시스템 (DBMS)입니다.
   데이터베이스, 캐시, 메세지 브로커로 사용되며 인메모리 데이터 구조를 가진 저장소입니다.

- 레디스는 모든 데이터를 메모리에 저장하고 조회한다. 즉 인메모리 데이터베이스 솔루션이다.
- 레디스는 고성능 키-값 저장소로서 문자열, 리스트, 해시, 셋, 정렬된 셋 형식의 데이터를 지원하는 NoSQL이다.
  
## 레디스의 주요 정보와 특징
- 영속성을 지원하는 인메모리 데이터 저장소다.
- 읽기 성능 증대를 위한 서버 측 복제를 지원한다.
- 쓰기 성능 증대를 위한 클라이언트 측 샤딩을 지원한다.
- ANSI C로 작성됐다. 따라서 ANSI C 컴파일러가 동작하는 곳이면 어디든 설치 및 실행이 가능하다.
- 레디스 클라이언트는 대부분의 언어로 포팅되어 있다.
- 네이버 라인, 기트허브, 블리자드, 트윗덱 등 많은 서비스에서 사용되고 있으며 성능적으로 검증된 솔루션이다.
- 문자열, 리스트, 해시, 셋, 정렬된 셋과 같은 다양한 데이터 형을 지원한다. 메모리 저장소임에도 불구하고 많은 데이터형을 지원하므로 다양한 기능을 구현할 수 있다.

## 레디스와 멤캐시드의 차이
- 멤캐시드(www.memcached.org/about) : 본질적으로 고성능 분산 메모리 객체 캐싱 시스템이지만, 원래는 동적 웹 서비스의 DB 부하를 경감시키는 것이 목적이었다.
- 레디스(redis.io/topics/introduction) : 오픈소스이며 향상된 키-값 저장소다. 값으로 문자열, 리스트, 해시, 셋, 정렬된 셋을 포함할 수 있기 때문에 종종 데이터 구조 서버로 지칭된다.
- 멤캐시드는 NoSQL이 아니다.(nosql-database.org에 포함되어 있지도 않음)

## Mac OS 레디스 설치
- Install Redis on macOS
 
## 레디스 설명

* db-engines.com 에서 key, value 저장소 중 가장 순위가 높습니다.


Redis에 대해서 더 자세하게 알아보기 전 캐시 서버(Cache Server)에 대해서,
 
  데이터 베이스가 있는데도 Redis라는 인메모리 데이터 구조 저장소를 사용하는 이유는 무엇일까요?

  데이터 베이스는 데이터를 물리 디스크에 직접 쓰기 때문에 서버에 문제가 발생하여 다운되더라도 데이터가 손실되지 않습니다. 하지만 매번 디스크에 접근해야 하기 때문에 사용자가 많아질수록 부하가 많아져서 느려질 수 있는데요.
  일반적으로 서비스 운영 초반이거나 규모가 작은, 사용자가 많지 않은 서비스의 경우에는 WEB - WAS - DB 의 구조로도 데이터 베이스에 무리가 가지 않습니다.
  하지만 사용자가 늘어난다면 데이터 베이스가 과부하 될 수 있기 때문에 이때 캐시 서버를 도입하여 사용합니다.
  그리고 이 캐시 서버로 이용할 수 있는 것이 바로 Redis 입니다.



## 캐시

캐시는 한번 읽어온 데이터를 임의의 공간에 저장하여 다음에 읽을 때는 빠르게 결괏값을 받을 수 있도록 도와주는 공간입니다.
같은 요청이 여러 번 들어오는 경우 매번 데이터 베이스를 거치는 것이 아니라 캐시 서버에서 첫 번째 요청 이후 저장된 결괏값을 바로 내려주기 때문에 DB의 부하를 줄이고 서비스의 속도도 느려지지 않는 장점이 있습니다.

캐시 서버는 Look aside cache 패턴과 Write Back 패턴이 존재합니다.

 

- Look aside cache
1. 클라이언트가 데이터를 요청

2. 웹서버는 데이터가 존재하는지 Cache 서버에 먼저 확인

3. Cache 서버에 데이터가 있으면 DB에 데이터를 조회하지 않고 Cache 서버에 있는 결과값을 클라이언트에게 바로 반환 (Cache Hit)

4. Cache 서버에 데이터가 없으면 DB에 데이터를 조회하여 Cache 서버에 저장하고 결과값을 클라이언트에게 반환 (Cache Miss)

 

- Write Back 
1. 웹서버는 모든 데이터를 Cache 서버에 저장

2. Cache 서버에 특정 시간 동안 데이터가 저장됨

3. Cache 서버에 있는 데이터를 DB에 저장

4. DB에 저장된 Cache 서버의 데이터를 삭제

 

* insert 쿼리를 한 번씩 500번 날리는 것보다 insert 쿼리 500개를 붙여서 한 번에 날리는 것이 더 효율적이라는 원리입니다.

* 이 방식은 들어오는 데이터들이 저장되기 전에 메모리 공간에 머무르는데 이때 서버에 장애가 발생하여 다운된다면 데이터가 손실될 수 있다는 단점이 있습니다.

 

 

 

## Redis의 특징
 

Key, Value 구조이기 때문에 쿼리를 사용할 필요가 없습니다.
데이터를 디스크에 쓰는 구조가 아니라 메모리에서 데이터를 처리하기 때문에 속도가 빠릅니다.
String, Lists, Sets, Sorted Sets, Hashes 자료 구조를 지원합니다.
    String : 가장 일반적인 key - value 구조의 형태입니다.

    Sets : String의 집합입니다. 여러 개의 값을 하나의 value에 넣을 수 있습니다. 포스트의 태깅 같은 곳에 사용될 수 있습니다.

    Sorted Sets : 중복된 데이터를 담지 않는 Set 구조에 정렬 Sort를 적용한 구조로 랭킹 보드 서버 같은 구현에 사용할 수 있습니다.

    Lists : Array 형식의 데이터 구조입니다. List를 사용하면 처음과 끝에 데이터를 넣고 빼는 건 빠르지만 중간에 데이터를 삽입하거나 삭제하는 것은 어렵습니다.

 

Single Threaded 입니다.
: 한 번에 하나의 명령만 처리할 수 있습니다. 그렇기 때문에 중간에 처리 시간이 긴 명령어가 들어오면 그 뒤에 명령어들은 모두 앞에 있는 명령어가 처리될 때까지 대기가 필요합니다.
(하지만 get, set 명령어의 경우 초당 10만 개 이상 처리할 수 있을 만큼 빠릅니다.)
 

 

Redis 사용에 주의할 점으로는
서버에 장애가 발생했을 경우 그에 대한 운영 플랜이 꼭 필요합니다.
: 인메모리 데이터 저장소의 특성상, 서버에 장애가 발생했을 경우 데이터 유실이 발생할 수 있기 때문입니다.
메모리 관리가 중요합니다.
싱글 스레드의 특성상, 한 번에 하나의 명령만 처리할 수 있습니다. 처리하는데 시간이 오래 걸리는 요청, 명령은 피해야 합니다.
 

 

이 외에도 Master-Slave 형식의 데이터 이중화 구조에 대한 Redis Replication, 분산 처리를 위한 Redis cluster, 장애 복구 시스템 Redis Sentinel, Redis Topology, Redis Sharding, Redis Failover 등의 Redis를 더 효율적으로 사용하기 위한 개념들이 존재합니다. 



*출처 : https://wildeveloperetrain.tistory.com/21


