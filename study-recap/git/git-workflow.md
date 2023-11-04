. 시작
. 최신 커밋 히스토리 가져오기
git fetch -p

. 워킹 디렉토리 상태확인 (clean 한지 보기)
git status

. 마스터 브랜치 업데이트
git switch master
git merge origin/master

. 작업 브랜치 생성/이동
git switch -c hm/feature1

. 작업 진행...
. 필요하면 remote에 push
git push -u origin hm/feature1     (처음)
git push                           (2번째 이후)

. 작업 브랜치 코딩 완료!

. 최신 커밋 히스토리 가져오기
(내가 작업하던 중에 리모트 master가 변경되었을 테니까..)
git fetch -p

. 리모트 마스터를 작업 브랜치에 병합
git merge origin/master

. 리모트에 올리기
git push

. pull request 발행

. 리모트 master에 병합되길 기다림
. 팀장이 머지/컨펌 pull request

. 병합 후 정리
. 로컬 마스터 브랜치 업데이트
. 로컬 브랜치들 삭제
git status
git fetch -p
git switch master
git merge origin/master
git branch -d hm/feature1

. 완료
