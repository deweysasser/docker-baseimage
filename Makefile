IMAGE=deweysasser/baseimage
TESTIMAGE=baseimage-test
TESTNAME=baseimage-test


test: testimage
	-docker rm -f $(TESTNAME)
	docker run -d --name $(TESTNAME) $(TESTIMAGE)
	sleep 4 # Must give container a chance to start up
	docker exec $(TESTNAME) /root/verify

testimage: image
	docker build -t $(TESTIMAGE) test

image:
	docker build -t $(IMAGE) .

run:  testimage
	-docker rm -f $(TESTNAME)
	docker run -t  --name $(TESTNAME) $(TESTIMAGE)
