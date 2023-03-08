Vagrant.configure("2") do |config|
    config.vm.box = "emoflon"
    config.vm.define 'emoflon'
    config.vm.provider :virtualbox do |vb|
        vb.name = "emoflon-hosr"
        vb.memory = 8192
        vb.cpus = 2
    end
    config.vm.provision "shell", path: "prov.sh", privileged: false

    # Prevent SharedFoldersEnableSymlinksCreate errors
    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.ssh.username = 'vagrant'
    config.ssh.password = 'vagrant'
    config.ssh.insert_key = false

    config.vm.provision "file", source: "./resources/updatesite.zip", destination: "updatesite.zip"

    # TODO: Remove me:
    config.vm.provision "file", source: "./eclipse-workspace.zip", destination: "eclipse-workspace.zip"
end
