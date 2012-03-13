require_recipe "java"
require_recipe "postgresql::server"
 
user node[:escidoc][:osuser] do
  action :create
  shell "/bin/bash"
end

group node[:escidoc][:osgroup] do
  members ['escidoc']
end

directory node[:escidoc][:installpath] do
  owner node[:escidoc][:osuser]
  group node[:escidoc][:osgroup]
  mode "0755"
  action :create
end

remote_file "#{Chef::Config[:file_cache_path]}/escidoc.jar" do
  source "http://www.escidoc.org/software/builds/stable-releases/1.4.1/escidoc-core-1.4.1-installer.jar"
  action :create_if_missing
  mode "0644"
  checksum "f49207113f300f87466861ef01250d9add0d4d9e2" 
end

template "installscript.xml" do
  path "#{node[:escidoc][:installpath]}/installscript.xml"
  source "installscript.xml"
  owner node[:escidoc][:osuser]
  group node[:escidoc][:osgroup]
  mode "0644"
end

execute "install escidoc" do
  user node[:escidoc][:osuser]
  group node[:escidoc][:osgroup]
  command "java -jar #{Chef::Config[:file_cache_path]}/escidoc.jar #{node[:escidoc][:installpath]}/installscript.xml"
end

template "/etc/init.d/escidoc" do
  source "init.erb"
  mode "0755"
  owner "root"
  group "root"
end

service "escidoc" do
  action [ :enable, :start ]
end

template "/etc/sudoers.d/escidoc" do
  source "escidoc_sudoers"
  mode 0440
  owner "root"
  group "root"
end
