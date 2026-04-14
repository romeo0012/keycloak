: <<'COMMENT'
git init
git add .
git commit -m "Initial KEYCLOAK commit"
git branch -M main
git remote add origin https://github.com/romeo0012/keycloak.git
git remote set-url origin https://github.com/romeo0012/keycloak.git
git branch -M main
COMMENT
git add -A
git commit --amend --no-edit
git push --force-with-lease origin main