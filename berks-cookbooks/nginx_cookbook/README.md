# nginx_cookbook

This cookbook is use to compile and install the nginx from source.

# Build Docker container
	docker build -t chef_demo .
	
# Run the container
	docker run -it -d -v /mnt/ngnix_cookbook:/var/chef/cookbooks/nginx_cookbook chef_demo
	
# Login to the Container
	docker exec -it <container_id> bash

# Run the recipe
To Install all the dependent cookboook from supermarket
	cd nginx_cookbook
	berks install
	berks vendor
	chef-solo -c solo_config/solo.rb -o "recipe[nginx_cookbook]"
	
To use local mode, need to berks vendor and then point Chef Solo at that vendored directory. Chef does not know how to read from Berkshelf or the Berkshelf shelf.
	
	cookbook_path [
               '/var/chef/cookbooks',
               '/var/chef/cookbooks/nginx_cookbook/berks-cookbooks'
              ]