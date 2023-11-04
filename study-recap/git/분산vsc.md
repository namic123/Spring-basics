origin/master
origin/HEAD

git hub에서 merge하기 (pull request:merge해달라는 요청)


* 로컬 
master에서 새 브랜치를 만들고, 새 브랜치로 옮겨서 하나의 커밋 생성하고
새 브랜치를 remote에 올리고 git push -u origin feature1

* 원격
github에서 새 브랜치를 master에 통합해달라는 pull request 생성
pull request를 컨펌 후 merge 진행하고 remote feature3 브랜치 지운다.

*로컬
원격의 내용 가져오고 (fetch)
로컬 master에 원격 master 내용 통합하고
origin/feature3과 로컬 feature3 지우기