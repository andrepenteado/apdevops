apply:
	kubectl apply -f 00-namespace.yml  \
	              -f 01-cert.yml       \
	              -f 01-storage.yml    \
				  -f 02-deployment.yml

apply-ingress:
	kubectl apply -f 03-ingress.yml

delete:
	kubectl delete namespace owncloud
	kubectl delete pv owncloud-volume

logs:
	kubectl logs -n owncloud service/owncloud -f

get:
	kubectl get all -n owncloud

update:
	kubectl rollout restart deployment owncloud -n owncloud
	kubectl rollout status deployment owncloud -n owncloud
	kubectl rollout history deployment owncloud -n owncloud