apply:
	kubectl apply -f 00-namespace.yml    \
	              -f 01-role.yml         \
	              -f 01-account.yml      \
				  -f 02-role-binding.yml \
				  -f 03-deployment.yml

delete:
	kubectl delete namespace traefik
	kubectl delete -f 01-role.yml

logs:
	kubectl logs -n traefik service/traefik -f

get:
	kubectl get all -n traefik

update:
	kubectl rollout restart deployment traefik -n traefik
	kubectl rollout status deployment traefik -n traefik
	kubectl rollout history deployment traefik -n traefik