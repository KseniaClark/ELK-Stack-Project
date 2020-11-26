# ELK-Stack-Project
Set up Cloud monitoring system by configuring ELK stack logserver
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://drive.google.com/file/d/1xI72LLZsqCYtDVRSJbUloY8xnAdBx8Uc/view?usp=sharing

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the filebeat_configuration.yml file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-playbook.yml
  - metricbeat-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly avaliable, in addition to restricting access to the network.
- Load balancer ia protecting Jump-box-Provisioner from DoS attacks and provides some redundantcy by distributing traffic accoss more than one VM.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.
- Filebeat: collects data about file system
- Metricbeat: collects machine metrics such as uptime

The configuration details of each machine may be found below.

| Name                 | Function  | IP        | Operating System |
|----------------------|-----------|-----------|------------------|
| Jump-box-Provisioner | Gateway   | 10.0.0.8  | Ubuntu 18.4      |
| Web-1                | Webserver | 10.0.0.9  | Ubuntu 18.4      |
| Web-2                | Webserver | 10.0.0.10 | Ubuntu 18.4      |
| Web-3                | Webserver | 10.0.0.11 | Ubuntu 18.4      |
| ElkStuck             | Logserver | 10.1.0.5  | Ubuntu 18.4      |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Local host machine IP

Machines within the network can only be accessed by SSH.
- Jump-Box-Provisioner with installed docker container with ansible can access all the VMs withing the network via SSH from 10.0.0.8 IP address

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly accessible | Allowed IP addresses |
|----------------------|---------------------|----------------------|
| Jump-box-Provisioner | Yes                 | 52.255.155.220       |
| Web-1                | No                  | 52.142.11.65         |
| Web-2                | No                  | 52.142.11.65         |
| Web-3                | No                  | 52.142.11.65         |
| ElkStack             | No                  | 104.42.118.177       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves time and resources to manage systems.
-Biggest advantage of Ansible is idempotency, operations may be run multiple times without changing the results beyong initial application. 
-Ansible allowed to install/update/launch same software from singe host into multiple Machines by running single playbook script   

The playbook implements the following tasks:
- Configure ELK VM with Docker 
- Install Docker
- Install Python3
- Install Docker Python module
- Increase Memory
- Download image and launch Docker ELK container

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.9
- Web-2 10.0.0.10
- Web-3 10.0.0.12

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing
- Metricbeat  takes the metrics and statistics that it collects and ships them to the output that specify, such as Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat_configuation.yml file to /etc/ansible/files.
- Update the filebeat_configuration.yml file to include ELK VM Ip address in elasticsearch and kibana sections
- Run the playbook, and navigate to Kibana Filebeat to check that the installation worked as expected.

- Copy filebeat_playbook.yml file into /etc/ansible/roles folder
- Update host file in /etc/ansible/hosts add Webservers, EKL 
- Navigate to http://104.42.118.177:5601/app/kibana

- To run playbook: sudo ansible-playbook name_of_the_playbook.yml
- To create a playbook: nano /etc/ansible/roles/name_of_the_playbook.yml
