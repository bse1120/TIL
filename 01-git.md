
# 🌱 Today I Learned

## 📅 Date
2025-06-25

---

Subject: Git Basic Day 1

## 📘 What I Learned

- ✨ `git init` : Git 저장소 초기화
- ✨ `git add .` : 모든 변경 파일 스테이징
- ✨ `git commit -m "메시지"` : 커밋 저장
- ✨ `git push origin main` : 원격 저장소에 업로드
- ✨ `git status` : 현재 Git 상태 확인

---

## 🧠 Summary

- Git 기본 명령어를 익혔다.
- 잘못된 명령어(`git add -m`)도 발견하여 `git commit -m`으로 수정함.
- 전체 Git 흐름이 조금 더 명확해졌다.

---

## 💬 느낀점

> Git 명령어들이 처음엔 헷갈렸지만, 직접 써보니 구조가 잡히는 느낌!  
> 앞으로는 커밋 메시지도 더 잘 정리해서 써야겠다 ✍️

---

## 🗂️ Reference

- [Git 공식 문서](https://git-scm.com/doc)

## Detail

git init
→ Git 저장소 초기화

git config --global user.name
→ 사용자 이름 설정

git config --global user.email
→ 사용자 이메일 설정

git add <파일명>
→ 특정 파일 변경사항 저장 준비

git add .
→ 모든 변경사항 저장 준비

git commit -m '<메시지>'
→ 저장 준비된 변경사항 커밋(버전 기록)

git remote add origin <URL>
→ 원격 저장소 연결

git push origin main
→ 로컬 내용을 원격 저장소에 업로드

git status
→ 현재 상태 확인