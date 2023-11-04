# git이란? 
* Git은 프로그래밍에서 자주 사용되는 버전관리 시스템이다. 'Git'은 '모든 파일'을 지속적으로 추적한다.
* Git은 소스코드를 효과적으로 관리하기 위해 개발된 '분산형 버전 관리 시스템'(Virsion control system(vsc)).
* 본래는 Linux 소스코드를 관리할 목적으로 개발되었다.

# Git의 필요성
* 코드가 많은 경우에는 파일의 히스토리를 알고 있어야한다. 
* 처음에 어떻게 코드를 작성했고, 나중에 무엇을 추가했는지, 변경 내역 등을 알고 있어야 하는데 이럴 때 git을 사용하면 도움이 된다.
* text 파일 이외에도 , excel, image, song 등 다른 파일 형식에도 사용할 수 있다. 
* (git 시스템은 파일을 binmary format (01011010)으로 파일을 인식하기 때문에)
* git은 어떤 파일이든 수정된 내역을 알 수 있다.
* code에 주로 사용되는 도구지만 다른 형식의 파일 변경 내역을 추적하는데에 사용할 수 있다.

## git 설치
- https://git-scm.com/ 
- 운영체제에 따라 git 설치

## git설치 후 최초 설정
- https://git-scm.com/book/ko/v2/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EC%B5%9C%EC%B4%88-%EC%84%A4%EC%A0%95

* 대소문자 구분하지 않는다는 gitbash 명령어
git config --global core.ignorecase false

git이 관리하는 폴더를 git repository라고 함.
ls했을 때 .git으로 확인됨. (확인되지 않은 경우 git이 추적하지 않음.)



master는 버전이나 프로그램에 따라 main이라고도 불리움 git이 관리하는 폴더를 의미
head는 현재 위치를 의미한다.



모든 커밋은 이전 커밋을 가리키고있다.
이전 커밋을 parent 커밋이라고 함.
단, 최초 커밋만 parent가 없음

참고: master에 새 branch를 추가하고 새로 추가한 branch

git commit시에 변경사항은 자세할수록 좋다.

git에는 세가지 영역이 있음
-워킹 디렉토리
- 스테이징 영역
- git repository

https://github.com/git
- git의 소스코드가 저장되어있는 공식문서
- linus tobalz - 리눅스 만든사람, 깃 만든 사람

git 스테이징 영역
- 스테이지는 index라고도 불리움
- 워킹 디렉토리와 로컬 저장소 사이에 위치한 중간 단계
- 이 영역은 커밋 명령어를 실행할 떄 실제로 커밋될 변경사항들을 임시로 저장해두는 영역이다.
- 즉 커밋 전에 스테이지 단계에 올려두고 커밋을 해야됨.
- git add를 하면 해당 커밋을 스테이징 영역에 올려둘 수 있으며, 스테이징 영역에 변경사항이 올라가 있어야만 커밋이 가능하다.
- 사용 이유
  - 선택적 커밋을 위해
  - 커밋 분리
  - 커밋 확인

git add의 상태는 세 가지 상태로 분류됨.
unmodified : 파일이 추적되어 있는 상태이지만, 변경사항이 없는 상태
modified : 파일이 추적되어 있으면서 스테이징 영역에 포함되어 있는 상태 (커밋 바로 전 단계)
staged를 묶어서 tracked(추적된 상태) 상태라고함

add 이전 상태를 untracked(추적되지 않은 상태) 상태라고함.
add를 하면 tracked 상태가 됨.

.gitignore - tracked되지 않게 untracked로 만드는 파일
- 생성하면 숨긴 상태로 되어있음
- 이미 tracked되어 있는 상태의 파일은 .gitignore에 추가해도 untracked가 될 수 없음. 
- tracked 된 파일을 삭제해도 커밋 히스토리에 남아있다.

branch
- commit의 별칭

detached HEAD 상태
- git에서 head 포인터가 특정 브랜치명을 가리키지 않고, 특정 커밋해시를 가리킬 때의 상태를 말한다.


hunk
-git branch conflict 충돌났을 때 해결해야할 공간


git bash 기본 명령어
 
git init
- 현재 폴더를 git이 관리하는 폴더로 만들기

touch 파일명
- 파일 생성

git status
- git repository의 상태를 볼 수 있음. 

git add
- 변경된 파일을 스테이지로

git add -A, git add --all, git .(현재와 하위폴더)
- 모든 변경된 파일을 스테이징 영역으로

git restore --staged 파일명
- 스테이징 영역에 있는 파일을 워킹디렉토리로 다시 내림

git restore 파일명
- 마지막 커밋 단계로 되돌리기

git commit
- 변경 사항 생성

git commit -m "(커밋 내용)"
- 명령어로 바로 커밋하는 방법


  git log
- 변경 사항 히스토리 보기
- 즉 커밋 로그 보기
- 로그를 싱행해보면 숫자와 알파벳 조합의 문자열들이 나열될 것임
- 이것은 커밋 해시(commit hash라고 부름)

git log --all --oneline
- 모든 변경 사항 로그를 보기

git log --all --oneline --graph
- 모든 로그를 그래프로 보기

  git checkout 해시번호 또는 branch명
- 변경 사항 옮기기

  git switch
- checkout이랑 동일
- 최신 명령어
- 변경 사항 옮기는 명령어 

git switch -c 브랜치명
- 브랜치를 만들고 이동까지함.

  git log --oneline
- 로그 한줄 보기 

  git log --all
- 모든 커밋보기

  git log --oneline --all
- 전체 한줄 보기

  git branch (별칭) 커밋해시번호
- 커밋번호에 별칭을 생성

  git branch -d 별칭 또는 커밋해시번호
- branch(별칭)이 초기화됨.

  git commit -am 커밋 내용
- tracked 된 파일 중 add, commit을 함께 사용하는 명령어


git merge 브랜치명
- 브랜치의 변경사항을 현재 브랜치에 반영
- 즉, 현재 master고 feature라는 브랜치를 master에 반영하고 싶으면
- master 위치 상태에서 git merge feature라고 쓰면됨

fast foward란? 

3way merge이란?
- 사용된 커밋이 3개, 즉 부모가 둘이고 본인 포함 3
- master로 이동 한 다음 다른 branch와 merge


git branch
- 현재 가지고 있는 branch 목록보기

git merge --abort
- merge 한거 취소.

explorer . 
-탐색기 열기

git remote
원격 저장소 보기

git remote -v
- 원격 저장소 자세히 보기

r
- 원격 저장소와 로컬저장소를 연결

git push -u origin master
git push -u origin 브랜치명
- 로컬 저장소의 master 커밋을 원격 저장소에 push

git branch [원격 저장소의 url]
- 원격 저장소의 커밋을 clone하고 원격저장소와 로컬저장소를 연결

git fetch
- 원격 저장 저장소의 변경사항을 로컬저장소에 가져오는 명령어
- 그러나 작업 중인 로컬 브랜치에는 병합하지는 않는다. 단지 업데이트만 함.
- 현재 로커저장소를 원격 저장소의 내용을 반영하려면 git merge를 하면 된다.

git pull
- fetch + merge
- git pull은 fetch와 merge를 동시에 지원한다는 점이 편리하지만, 의도치 않은 상황을 만드는 경우도 있으므로
- 분리해서 사용하는 것이 권장된다.


git fetch --prune, git fetch -p
- 원격 저장 저장소의 변경사항을 로컬 저장소에 가져오고, 원격 브랜치를 삭제

git clone [원격 저장소 url] [원격 저장소를 저장할 폴더명]

