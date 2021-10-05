FROM java

RUN curl --insecure -Lo apache-jmeter.tgz https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz \
  && tar -xzf apache-jmeter.tgz \
  && chmod +x apache-jmeter-5.4.1/bin/ApacheJMeter.jar 

COPY ./run_load.sh ./
COPY ./teastore_browse_nogui.jmx ./


CMD ["/bin/bash", "run_load.sh"]
