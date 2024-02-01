apply:
	kubectl apply -f 00-namespace.yml  \
	              -f 01-cert.yml       \
				  -f 01-config.yml     \
				  -f 01-storage.yml    \
				  -f 02-deployment.yml \
				  -f 02-daemon.yml

apply-ingress:
	kubectl apply -f 03-ingress.yml

delete:
	kubectl delete namespace monitor
	kubectl delete pv monitor-volume

get:
	kubectl get all -n monitor