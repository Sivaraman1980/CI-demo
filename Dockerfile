FROM docker.io/fedora
RUN echo "hello from jenkin" > /root/myfile1.txt
RUN mkdir /ibm
