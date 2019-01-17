FROM chef/chefdk
RUN apt-get update -y
RUN apt-get install awscli -y

#Installing dependent packages for dev env
RUN apt-get update && \
    apt-get install build-essential -y && \
    apt-get install make
    
ADD solo_config/solo.rb /etc/chef/solo.rb
WORKDIR /var/chef/cookbooks
