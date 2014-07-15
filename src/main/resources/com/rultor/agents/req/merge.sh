#!/bin/sh

git remote add fork "${fork}"
git remote update
git merge "fork/${fork_branch}"

cd ..
docker_when_possible run --rm -v $(pwd):/main "${vars[@]}" -w=/main ${image} /main/${bin}
${sudo} chown -R $(whoami) .
cd repo

git push origin "${head_branch}"
