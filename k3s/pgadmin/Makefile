apply:
	kubectl apply -f 00-namespace.yml  \
	              -f 01-cert.yml       \
	              -f 01-storage.yml    \
				  -f 02-deployment.yml

apply-ingress:
	kubectl apply -f 03-ingress.yml

delete:
	kubectl delete namespace pgadmin
	kubectl delete pv pgadmin-volume

logs:
	kubectl logs -n pgadmin service/pgadmin -f

get:
	kubectl get all -n pgadmin

update:
	kubectl rollout restart deployment pgadmin -n pgadmin
	kubectl rollout status deployment pgadmin -n pgadmin
	kubectl rollout history deployment pgadmin -n pgadmin