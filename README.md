This is a Sample Go HTTP server that will spit all information of the requests it receives

Port: 8080

Available endpoints:
- /healthz
- /readyz
- /test200
- /test400
- /test401
- /test404


Helm:
helm install helm/harness-blue-green-test --namespace default --set 'ingress.fqdn=example.com' --name harness-blue-green-test
