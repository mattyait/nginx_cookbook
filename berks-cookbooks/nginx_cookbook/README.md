# nginx_cookbook

TODO: Enter the cookbook description here.

# Build Docker container
	docker build -t chef_demo .
# Run the container
	docker run -it -d -v /mnt/ngnix_cookbook:/var/chef/cookbooks/nginx_cookbook chef_demo
# Run the recipe
	docker exec -it <container_id> bash
	chef-solo -c solo_config/solo.rb -o "recipe[nginx_cookbook]"

To Install all the dependent cookboook from supermarket
	berks install
	
To use local mode, need to berks vendor and then point Chef Zero at that vendored directory. Chef does not know how to read from Berkshelf or the Berkshelf shelf.