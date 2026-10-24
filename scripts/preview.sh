#!/usr/bin/env bash
# 로컬 미리보기. 시스템 루비(2.6)와 홈브루 루비(4.0)로는 Chirpy 7.5 가 안 돌아서 rbenv 3.3.4 를 쓴다.
# 예약 글(미래 날짜)과 초안까지 보이게 띄운다. 포트 4001 (기술 블로그 4000 과 겹치지 않게)
set -euo pipefail
cd "$(dirname "$0")/.."
export PATH="$HOME/.rbenv/versions/3.3.4/bin:$PATH"
export BUNDLE_PATH=vendor/bundle
bundle check >/dev/null 2>&1 || bundle install
exec bundle exec jekyll serve --host 127.0.0.1 --port "${PORT:-4001}" --livereload --livereload-port 35730 --future --drafts --unpublished
