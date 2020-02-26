IP=127.0.0.1

createrepo: 
	@echo "Get Package"
	mkdir -p /repos/
	docker build ${PWD} -f GetRepo -t getpackage
	docker run  --volume /repos:/repos getpackage
	docker build ${PWD} -f RepoProxy --build-arg IP=${IP} -t repoproxy
	docker run  --volume /repos:/repos -p 80:80 --name repoproxy -d repoproxy
	@echo -e "[base]\nname=CentOS-$releasever - Base\nbaseurl=http://${IP}/CentOS/$releasever/os/$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7"

update:
	@echo "Update Package"
	docker build ${PWD} -f GetRepo -t getpackage
	docker run  --volume /repos:/repos getpackage
	@echo -e "[base]\nname=CentOS-$releasever - Base\nbaseurl=http://${IP}/CentOS/$releasever/os/$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7"
	

cleanall: clean cleandata

clean:
	@echo "Clean Package"
	docker rm repoproxy getpackage -f
	docker rmi getpackage repoproxy -f

cleandata:
	@echo "Clean Data"
	rm -rf /repos
