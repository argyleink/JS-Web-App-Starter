Vagrant.configure("2") do |config|

  config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"
  config.ssh.forward_agent = true

  config.vm.network :private_network, ip: "1.3.3.7"
  config.vm.network :forwarded_port, guest: 80, host: 3030

  # set sync folder for static files
  config.vm.synced_folder "startup_data/",  "/var/db/"
  config.vm.synced_folder "server/",        "/var/server/"
  config.vm.synced_folder "dist/",          "/var/www/"
  config.vm.synced_folder "api/",           "/var/api/"

  # run chef cookbooks
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.add_recipe :apt
    chef.add_recipe 'nginx'
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'nodejs'
    chef.json = {
      :nginx => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "www-data",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024",
        :sendfile           => "off"
      },
      :mysql => {
        :server_root_password   => "password",
        :server_repl_password   => "password",
        :server_debian_password => "password",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      }
    }
  end

  config.vm.provision "shell", path: "post-provision.sh"
end
