# Self-fixed Technical Debt
# About

This is a repository for the paper 

**An Empirical Study on Self-Fixed Technical Debt**

It contains the replication package of the study reported in the aforementioned paper.

# Replication Instructions

Most of the workload to replicate this project is automated through scripts. 

To reduce the effort further, we also automated the creation of an environment for the study.

The instruction to create the environment and replicate the study are described in the following. 

## 1. Bootstrap Virtual Machine

### Requirements

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Install the plugin `vagrant-docker-compose`. In your command prompt or terminal, run:
```shell
$ vagrant plugin install vagrant-docker-compose 
```
4. (Optional) Install the plugin `vagrant-vbguest` (VirtualBox Guest Additions). In your command prompt or terminal, run:
```shell
$ vagrant plugin install vagrant-vbguest 
```

### Using the Virtual Machine (VM)

The VM is controlled via [Vagrant](https://www.vagrantup.com/downloads.html) and contains the configured environment to run all scripts for this study. Mainly, the VM provides:
- SonarQube (version 7.6-community)
- PostgreSQL (version 11, to store SonarQube data)
- Jupyter + Python + libraries (to run scripts)

Whenever you boot the VM, the environment is initialized and SonarQube is available at http://localhost:9000.

You can control the VM via a command prompt (Windows) or terminal (Linux + MacOS). For that, you:
1. Open a command prompt or terminal
2. On it, navigate to the root folder of this repository
3. Execute one of the following commands

There are several commands available, but we focus on the ones necessary for the study.

```bash
# Boot the VM
$ vagrant up
```

```bash
# Stop the VM
$ vagrant halt
```

```bash
# Purge the VM
$ vagrant destroy
```

```bash
# Connect (via SSH) to the VM
$ vagrant ssh
```

> **Important Notes** 
>
> The first boot (or the boot after purging) takes a long time, as it will:
> * download and configure the VM
> * download and configure the tools (e.g., SonarQube)
>
> The next boots are much quicker as you just "turn the machine on"
> 
> Purging the VM will delete all VM files except for the ones in this folder (and subfolders).


## 2. Additional SonarQube Configurations

Before you run the scripts for the study, you have to configure SonarQube as follows:

1. Change the General Settings in the following way:
    * Administration -> Configuration -> General (set each value instead of default value):
    - Keep only one analysis a day after -> 876000
    - Keep only one analysis a week after -> 5200
    - Keep only one analysis a month after -> 5200
    - Keep only analyses with a version event after -> 10400
    - Delete all analyses after -> 10400
    - Delete closed issues after -> 36500

2. Activate more Python rules:

    * Quality Profiles -> Python -> Sonar way, from the drop-down menu click on Copy and set a name
    * Then click on Inactive and then Bulk Change -> Activate In...
    * Back to  Quality Profiles and set the new profile as Default (from the drop-down)
    
## 3. Data Collection

To collect the data for the study, you must follow the instructions described in the Jupyter notebook at `study.d/Data-Collection.ipynb`. For that:

1. Open [Jupyter Lab](http://localhost:8888/lab) on your browser (*password: sonar*)

2. There is a file tree on the left, click on `Data-Collection.ipynb`
