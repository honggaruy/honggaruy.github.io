bundle update && bundle install
./generateData.js

# johngrib 수정사항 반영 commit id - afbc84c3bdb14b4d7f478f4f6f69b527b1ce4a8e
if [[ $1 = "docker" ]]; then
	docker-compose up
elif [[ $1 = "watch" ]]; then
	bundle exec jekyll server --incremental --trace
fi
