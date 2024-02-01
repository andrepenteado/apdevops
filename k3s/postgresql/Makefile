apply:
	kubectl apply -f 00-namespace.yml  \
	              -f 01-storage.yml    \
				  -f 02-deployment.yml

delete:
	kubectl delete namespace postgresql
	kubectl delete pv postgresql-volume

logs:
	kubectl logs -n postgresql service/postgresql -f

get:
	kubectl get all -n postgresql
	kubectl get pv -n postgresql