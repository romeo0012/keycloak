# Stáhněte certifikát
# openssl s_client -connect dev-mgmt.prg1paas.t-cloud.eu:443 -showcerts </dev/null | openssl x509 -outform PEM > tcloud.crt
# Import do truststore
# keytool -import -alias tcloud -file tcloud.crt -keystore truststore.jks -storepass changeit
# Spusťte s truststore
# mvn clean package -DskipTests
# java -Djavax.net.ssl.trustStore=truststore.jks -Djavax.net.ssl.trustStorePassword=BezpecneHeslo.123! -jar target/bpm-app.jar
# docker system prune -aq

docker build -t keycloak:latest .
docker tag keycloak:latest ghcr.io/romeo0012/keycloak:latest
export TOKEN=$(cat image-token.txt)
echo $TOKEN | docker login ghcr.io -u romeo0012 --password-stdin
docker push ghcr.io/romeo0012/keycloak:latest

git add -A
git commit --amend --no-edit
git push --force-with-lease origin main