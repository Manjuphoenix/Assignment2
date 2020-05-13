FROM centos

RUN wget -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install jenkins-2.234-1.1.noarch -y
RUN yum install java-11-openjdk.x86_64 -y
RUN yum install git -y
RUN yum install net-tools -y
RUN yum install wget -y
RUN yum install python3 -y
RUN yum insall httpd -y
RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
ENV USER jenkins

CMD /usr/sbin/httpd -DFOREGROUND
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
RUN yum install wget -y

EXPOSE 8080
