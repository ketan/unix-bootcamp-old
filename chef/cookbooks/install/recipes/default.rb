%w(curl wget tree man-pages crontabs at mailx httpd zsh vim-enhanced htop strace git).each do |pkg|
  package pkg
end

%w(postgresql postgresql-server).each do |pkg|
  package pkg
end

execute "initdb --encoding UTF8" do
  user "postgres"
  creates ::File.join(["/var/lib/postgres", 'data', 'PG_VERSION'])
end

execute "fetch ruby binary" do
  url = "http://s3.amazonaws.com/rpms.gosaas.thoughtworks.com/rpms/ruby-1.9.3-p286-1.9.3p286-1.x86_64.rpm"
  file = File.join(Chef::Config[:file_cache_path], "ruby-1.9.3-p286-1.9.3p286-1.x86_64.rpm")
  command "curl '#{url}' > #{file}"
  not_if "rpm -qa | egrep -qx 'ruby-1.9.3-p286-1.9.3p286-1.x86_64'"
end

yum_package "#{Chef::Config[:file_cache_path]}/ruby-1.9.3-p286-1.9.3p286-1.x86_64.rpm" do
  not_if "rpm -qa | egrep -qx 'ruby-1.9.3-p286-1.9.3p286-1.x86_64'"
end

file "/etc/profile.d/ruby-1.9.3-p286.sh" do
  owner "root"
  group "root"
  mode  "0644"
  content "export PATH=/opt/local/ruby/1.9.3-p286/bin:$PATH"
end

{
  'bundler' => '1.2.3',
  'rake'    => '10.0.3',
}.each do |gem_name, gem_version|
  gem_package(gem_name) do
    version gem_version
    gem_binary("/opt/local/ruby/1.9.3-p286/bin/gem")
    action :install
  end
end

%w(atd crond sshd httpd postgresql).each do |svc|
  service svc do
    supports :start => true, :stop => true, :restart => true
    action [:enable, :start]
  end
end

execute "generate man page indices" do
  command "/usr/sbin/makewhatis"
end
