Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-1110-server-amd64"
  config.vm.network :hostonly, "33.33.33.10"
  config.vm.forward_port 8080, 8080
  config.vm.customize ["modifyvm", :id, "--memory", "1024"] 

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "vagrant_main"
    chef.add_recipe "escidoc"
    #chef.log_level = :debug
    chef.json = { 
      :java => {:install_flavor => "oracle"},
      :postgresql => {
          :version => "9.1",
          :password => {:postgres => "setMe"},
      },
      :fedora => {
          :username => "fedoraAdmin",
          :password => "fedoraAdmin",
          :email    => "test@test.com"
      },

      :jboss => {
          :username => "fedoraAdmin",
          :password => "fedoraAdmin",
          :port     => "8080"
      },
 
      :escidoc => {
          :installpath => "/usr/share/escidoc",
          :hostname => "localhost",
          :osuser => "escidoc",
          :osgroup => "escidoc",
          :users => {
              :databaseUser => {
                  :username => "escidoc",
                  :password => "escidoc"
              },
              :adminUser => {
                  :username => "adminUser",
                  :password => "adminUser"
              },
              :inspector => {
                  :username => "inspector",
                  :password => "inspector"
              },
              :depositor => {
                  :username => "depositor",
                  :password => "depositor"
              }
         }
      }
    }
  end
end
